# -*- coding: utf-8 -*-

import maya.cmds as cmds
import math

def invert_matrix(m):
    """求 4x4 矩阵的逆，m 为 4×4 的列表（每个元素代表一行）"""
    n = 4
    A = [row[:] for row in m]
    I = [[1 if i == j else 0 for j in range(n)] for i in range(n)]
    
    for i in range(n):
        if abs(A[i][i]) < 1e-10:
            for j in range(i+1, n):
                if abs(A[j][i]) > abs(A[i][i]):
                    A[i], A[j] = A[j], A[i]
                    I[i], I[j] = I[j], I[i]
                    break
            else:
                raise Exception("矩阵奇异，无法求逆")
        pivot = A[i][i]
        for j in range(n):
            A[i][j] /= pivot
            I[i][j] /= pivot
        for k in range(n):
            if k != i:
                factor = A[k][i]
                for j in range(n):
                    A[k][j] -= factor * A[i][j]
                    I[k][j] -= factor * I[i][j]
    return I

def multiply_vector_matrix(v, M):
    """行向量 v（长度4）乘以 4x4 矩阵 M，返回长度为4的结果"""
    result = []
    for j in range(4):
        s = 0.0
        for k in range(4):
            s += v[k] * M[k][j]
        result.append(s)
    return result

def vec_sub(a, b):
    """向量相减 a - b"""
    return [a[i] - b[i] for i in range(len(a))]

def convertWorldToObject(pos, inv_mat):
    """将 worldSpace 坐标 pos（列表 [x,y,z]）转换到对象空间，使用 inv_mat（4x4 矩阵）"""
    vec = [pos[0], pos[1], pos[2], 1.0]
    new_vec = multiply_vector_matrix(vec, inv_mat)
    if abs(new_vec[3]) > 1e-6:
        new_vec = [new_vec[i] / new_vec[3] for i in range(4)]
    return new_vec[:3]

def extractDeltasCmd(vertexListStr=None):
    """
    纯 cmds 版本实现 extractDeltas 算法：
      1. 选中两个对象：
         - 第一个为蒙皮对象（要求其下包含中间形状），
         - 第二个为修正网格（corrective mesh）。
      2. 可选参数 vertexListStr 为顶点索引列表（例如 "0,1,2,3"），仅对这些顶点处理。
      
    说明：
      - 对于皮肤和中间形状，直接获取对象空间数据；
      - 对于修正网格，先以 worldSpace 获取顶点，再利用其 transform 的逆矩阵转换到对象空间，
        确保各数据处于统一坐标系。
    """
    sels = cmds.ls(sl=True, type='transform')
    if len(sels) != 2:
        cmds.error("请选中两个多边形对象：第一个为蒙皮对象，第二个为修正网格。")
        return
    skin_transform = sels[0]
    corrective_transform = sels[1]
    
    # 获取皮肤对象的形状节点
    skin_shapes = cmds.listRelatives(skin_transform, s=True, f=True) or []
    if not skin_shapes:
        cmds.error("无法获取蒙皮对象的形状节点。")
        return
    
    # 区分中间形状与皮肤变形形状
    intermediate_shape = None
    skin_shape = None
    for s in skin_shapes:
        try:
            if cmds.getAttr(s + ".intermediateObject"):
                intermediate_shape = s
            else:
                skin_shape = s
        except:
            pass
    if not intermediate_shape:
        cmds.error("第一个对象中未找到中间形状（intermediate shape）。")
        return

    # 获取修正网格的形状节点
    corrective_shapes = cmds.listRelatives(corrective_transform, s=True, f=True) or []
    if not corrective_shapes:
        cmds.error("无法获取修正网格的形状节点。")
        return
    target_shape = corrective_shapes[0]
    
    # 取得修正网格 transform 的世界矩阵，并求其逆（用于将 worldSpace 转换到对象空间）
    tm = cmds.xform(corrective_transform, q=True, ws=True, m=True)
    if not tm:
        cmds.error("无法获取修正网格 transform 的矩阵。")
        return
    target_mat = [tm[0:4], tm[4:8], tm[8:12], tm[12:16]]
    try:
        target_inv = invert_matrix(target_mat)
    except Exception as e:
        cmds.error("修正网格 transform 矩阵不可逆：{}".format(e))
        return
    
    # 获取顶点总数（假定三个网格顶点数一致）
    vtxCount = cmds.polyEvaluate(intermediate_shape, vertex=True)
    
    def getVertexPosition(mesh, idx, use_ws=False):
        # 若 use_ws 为 True，则返回 worldSpace 坐标，否则返回对象空间坐标
        if use_ws:
            pos = cmds.xform("{}.vtx[{}]".format(mesh, idx), q=True, t=True, ws=True)
        else:
            pos = cmds.xform("{}.vtx[{}]".format(mesh, idx), q=True, t=True, os=True)
        return [float(p) for p in pos]
    
    # 获取中间形状与皮肤变形形状的顶点（对象空间）
    intermediatePoints = [getVertexPosition(intermediate_shape, i, use_ws=False) for i in range(vtxCount)]
    skinPoints = [getVertexPosition(skin_shape, i, use_ws=False) for i in range(vtxCount)]
    
    # 对于修正网格，先以 worldSpace 获取顶点，再转换到对象空间
    targetPoints = []
    for i in range(vtxCount):
        worldPos = getVertexPosition(target_shape, i, use_ws=True)
        objPos = convertWorldToObject(worldPos, target_inv)
        targetPoints.append(objPos)
    
    # 找出 skinPoints 与 targetPoints 差异超过容差的顶点
    tol = 1e-5
    pointList = []
    for i in range(vtxCount):
        diff = math.sqrt(sum((skinPoints[i][j] - targetPoints[i][j])**2 for j in range(3)))
        if diff > tol:
            pointList.append(i)
    
    # 如果提供了顶点列表，则取交集
    if vertexListStr:
        try:
            specified = [int(x.strip()) for x in vertexListStr.split(',')]
        except Exception as e:
            cmds.error("提供的顶点列表格式有误。")
            return
        pointList = list(set(pointList) & set(specified))
    
    if not pointList:
        cmds.error("未检测到差异（或指定的顶点中无差异）。")
        return

    # —— 修正后的复制结果网格部分 ——
    # 复制 intermediate_shape（原始形状），按原始代码逻辑删除第一个形状，
    # 并对剩余的形状取消 intermediate 标记和重命名。
    dup = cmds.duplicate(intermediate_shape, rc=True)
    result_transform = dup[0]
    shapes = cmds.listRelatives(result_transform, s=True, f=True)
    if not shapes or len(shapes) < 2:
        cmds.error("复制结果中未找到预期的形状节点。")
        return
    cmds.delete(shapes[0])
    cmds.setAttr(shapes[1] + ".intermediateObject", 0)
    result_shape = cmds.rename(shapes[1], shapes[0])
    # 解锁 transform 属性（与原代码一致）
    for a in ['tx','ty','tz','rx','ry','rz','sx','sy','sz']:
        cmds.setAttr(result_transform + '.' + a, l=False)
    
    # ★ 新增：将原 skin shape 的材质赋给复制出来的结果形状
    origSGs = cmds.listConnections(skin_shape, type='shadingEngine')
    if origSGs:
        for sg in origSGs:
            cmds.sets(result_shape, e=True, forceElement=sg)
    
    resultPoints = [getVertexPosition(result_shape, i, use_ws=False) for i in range(vtxCount)]
    
    # 辅助函数：对 intermediate_shape 中顶点进行有限差分查询（对象空间）
    def perturbAndQuery(idx, axis):
        orig = intermediatePoints[idx][:]
        perturbed = orig[:]
        perturbed[axis] += 1.0
        cmds.xform("{}.vtx[{}]".format(intermediate_shape, idx), t=perturbed, os=True)
        cmds.dgdirty(intermediate_shape)
        newPos = getVertexPosition(skin_shape, idx, use_ws=False)
        cmds.xform("{}.vtx[{}]".format(intermediate_shape, idx), t=orig, os=True)
        cmds.dgdirty(intermediate_shape)
        return newPos

    # 计算每个差异顶点的局部基向量（有限差分）
    xVectors = {}
    yVectors = {}
    zVectors = {}
    for idx in pointList:
        baseSkin = skinPoints[idx]
        newPosX = perturbAndQuery(idx, 0)
        newPosY = perturbAndQuery(idx, 1)
        newPosZ = perturbAndQuery(idx, 2)
        xVectors[idx] = vec_sub(newPosX, baseSkin)
        yVectors[idx] = vec_sub(newPosY, baseSkin)
        zVectors[idx] = vec_sub(newPosZ, baseSkin)
    
    # 对每个差异顶点构造转换矩阵并计算新顶点坐标
    for idx in pointList:
        # 构造 extractMatrix（行依次为：z向量、x向量、y向量、皮肤形状顶点）
        M_ex = [
            [ zVectors[idx][0], zVectors[idx][1], zVectors[idx][2], 0.0 ],
            [ xVectors[idx][0], xVectors[idx][1], xVectors[idx][2], 0.0 ],
            [ yVectors[idx][0], yVectors[idx][1], yVectors[idx][2], 0.0 ],
            [ skinPoints[idx][0], skinPoints[idx][1], skinPoints[idx][2], 1.0 ]
        ]
        # 构造 resultMatrix（固定基向量与结果网格中对应顶点的平移）
        M_res = [
            [0.0, 0.0, 1.0, 0.0],
            [1.0, 0.0, 0.0, 0.0],
            [0.0, 1.0, 0.0, 0.0],
            [resultPoints[idx][0], resultPoints[idx][1], resultPoints[idx][2], 1.0]
        ]
        target_vec = [targetPoints[idx][0], targetPoints[idx][1], targetPoints[idx][2], 1.0]
        
        try:
            inv_M_ex = invert_matrix(M_ex)
        except Exception as e:
            cmds.warning("第 {} 号顶点矩阵奇异，跳过该顶点。".format(idx))
            continue
        
        temp_vec = multiply_vector_matrix(target_vec, inv_M_ex)
        new_vec = multiply_vector_matrix(temp_vec, M_res)
        if abs(new_vec[3]) > 1e-6:
            newPos = [new_vec[i] / new_vec[3] for i in range(3)]
        else:
            newPos = new_vec[:3]
        cmds.xform("{}.vtx[{}]".format(result_shape, idx), t=newPos, os=True)
    
    cmds.select(result_transform)
    print("完成！生成的修正网格为：{}".format(result_transform))

