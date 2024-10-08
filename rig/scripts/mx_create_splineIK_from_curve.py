# -*- coding: utf-8 -*-

import maya.cmds as cmds

def create_splineIK_from_curve(curve_name, jnt_count):
    # 获取曲线上的点
    curve_points = cmds.getAttr("{}.cv[*]".format(curve_name))
    print(curve_points)
    
    # 创建骨骼链
    joint_chain = []
    for i, point in enumerate(curve_points):
        cmds.select( d=True )
        joint = cmds.joint(name="joint_" + str(i), p = [point[0],point[1],point[2]])
        joint_chain.append(joint)
        
        
        # 连接前一个骨骼（除第一个骨骼外）
        if i > 0:
            cmds.parent(joint, joint_chain[i-1])
            
    # 创建曲线IK解算器
    ik_handle, curve_info = cmds.ikHandle(
        solver='ikSplineSolver',
        startJoint=joint_chain[0],
        endEffector=joint_chain[-1],
        curve=curve_name,
        createCurve=False,
        n="{}_ik".format(curve_name)
    )    

    # 返回相关节点名称
    return ik_handle, curve_info


    
# 使用示例
jnt_count = 0
curve_name = 'curve1'  # 曲线名称
joint_chain = create_splineIK_from_curve(curve_name, jnt_count)
