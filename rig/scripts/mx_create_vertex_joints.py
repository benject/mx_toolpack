# -*- coding: utf-8 -*-
import maya.cmds as cmds

def create_vertex_joints():
    # 获取选中的对象
    sel = cmds.ls(selection=True)
    if not sel:
        cmds.error("请先选择一个多边形网格对象！")
        return
    
    for mesh in sel:
        # 检查是否为多边形网格
        shape = cmds.listRelatives(mesh, shapes=True, type="mesh")
        if not shape:
            cmds.error("请选择一个有效的多边形网格对象！")
            return
        
        follicle_grp = cmds.group(em=True, n="{}_Follicle_Grp".format(mesh))

        mesh_shape = shape[0]

        # 获取顶点数
        vertex_count = cmds.polyEvaluate(mesh, vertex=True)
        
        # 遍历每个顶点
        for i in range(vertex_count):
            # 获取顶点对应的 UV
            uv = get_vertex_uv(mesh_shape, i)
            if not uv:
                cmds.warning("顶点 {} 没有有效的 UV 坐标，跳过。".format(i))
                continue
            
            u, v = uv

            # 创建一个 Follicle
            follicle_shape = cmds.createNode("follicle", name="{}_follicle_{}_shape".format(mesh, i))
            follicle_transform = cmds.listRelatives(follicle_shape, parent=True)[0]
            follicle_transform = cmds.rename(follicle_transform, "{}_follicle_{}".format(mesh, i))
            cmds.parent(follicle_transform, follicle_grp)
            
            # 连接 Follicle 到网格
            cmds.connectAttr("{}.worldMatrix[0]".format(mesh), "{}.inputWorldMatrix".format(follicle_shape))
            cmds.connectAttr("{}.outMesh".format(mesh), "{}.inputMesh".format(follicle_shape))
            
            # 设置 Follicle 的 UV 参数
            cmds.setAttr("{}.parameterU".format(follicle_shape), u)
            cmds.setAttr("{}.parameterV".format(follicle_shape), v)
            
            # 锁定 Follicle 位置
            cmds.connectAttr("{}.outTranslate".format(follicle_shape), "{}.translate".format(follicle_transform))
            cmds.connectAttr("{}.outRotate".format(follicle_shape), "{}.rotate".format(follicle_transform))
            
            # 创建骨骼并将其放置到 Follicle 的位置
            joint = cmds.joint(name="{}_joint_{}".format(mesh, i))
            cmds.delete(cmds.parentConstraint(follicle_transform, joint))  # 将骨骼对齐到毛囊初始位置
            
            # 使用父子约束绑定骨骼到毛囊
            cmds.parentConstraint(follicle_transform, joint, maintainOffset=False)
        
        print("成功为 {} 个顶点创建了骨骼和毛囊！".format(vertex_count))


def get_vertex_uv(mesh_shape, vertex_index):
    """
    获取指定顶点的 UV 坐标
    :param mesh_shape: 网格的形状节点
    :param vertex_index: 顶点索引
    :return: UV 坐标 (U, V)
    """
    # 将顶点转换为对应的 UV
    uv_components = cmds.polyListComponentConversion("{}.vtx[{}]".format(mesh_shape, vertex_index), toUV=True)
    if not uv_components:
        return None
    
    # 查询 UV 坐标
    uv_coords = cmds.polyEditUV(uv_components, query=True)
    if not uv_coords or len(uv_coords) < 2:
        return None
    
    # 返回第一个 UV 坐标
    return uv_coords[:2]
