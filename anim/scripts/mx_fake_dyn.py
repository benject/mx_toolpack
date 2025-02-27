#-*- coding: utf-8 -*-

import maya.cmds as cmds

def get_shape(node):
    """
    如果节点是 transform 且包含 shape 节点，则返回第一个 shape 节点，否则返回原节点
    """
    shapes = cmds.listRelatives(node, shapes=True, noIntermediate=True) or []
    return shapes[0] if shapes else node

def break_current_time_connection(node):
    """
    断开指定节点 currentTime 属性上的所有输入连接，
    先尝试解锁属性，再查询所有源连接（返回完整插槽名称），然后断开所有连接。
    """
    attr = "{}.currentTime".format(node)
    try:
        cmds.setAttr(attr, lock=False)
    except Exception as e:
        print("无法解锁 {}: {}".format(attr, e))
    # 查询该属性的所有源连接（返回完整插槽名称）
    src_list = cmds.listConnections(attr, source=True, destination=False, plugs=True)
    if src_list:
        for src in src_list:
            try:
                cmds.disconnectAttr(src, attr)
                print("已断开连接: {} -> {}".format(src, attr))
            except Exception as e:
                print("断开连接失败 {} -> {}: {}".format(src, attr, e))
    else:
        print("未找到 {} 的输入连接".format(attr))

def fake_dyn():
    """
    选择顺序要求：
      1. 控制器 (ctrl)  -- 保持 transform
      2. Nucleus 节点 (nucleus)  -- transform
      3. Hair 节点 (hair)  -- 自动获取其 shape 节点
      4. nRigid 节点 (nrigid)  -- 自动获取其 shape 节点，可选
      
    如果选择不足3个对象, 则报错。
    """
    sel = cmds.ls(sl=True)
    if len(sel) < 3:
        cmds.error("请至少选择三个对象:ctrl, nucleus, hair,nrigid为可选。")
    
    ctrl    = sel[0]
    nucleus = sel[1]
    # 获取 hair 节点的 shape，如果没有则返回自身
    hair    = get_shape(sel[2])
    # 如果提供 nrigid，则获取其 shape 节点
    nrigid  = get_shape(sel[3]) if len(sel) >= 4 else None
    
    # 为控制器添加 StartTime 属性（如果不存在）
    if not cmds.attributeQuery("StartTime", node=ctrl, exists=True):
        cmds.addAttr(ctrl, ln="StartTime", dv=1)
        cmds.setAttr("{}.StartTime".format(ctrl), e=True, keyable=True)
    
    # 断开目标节点 currentTime 属性上的已有连接
    break_current_time_connection(nucleus)
    break_current_time_connection(hair)
    if nrigid:
        break_current_time_connection(nrigid)
    
    # 构建动态表达式部分，使用双大括号确保 if/else 中花括号最终输出为单个大括号
    if nrigid:
        dyn_expr = '''
        if(frame==1){{
            {nucleus}.currentTime = 1;
            {hair}.currentTime = 1;
            {nrigid}.currentTime = 1;
            }}
        else{{
            {nucleus}.currentTime += 1;
            {hair}.currentTime += 1;
            {nrigid}.currentTime += 1;
        }}'''.format(nucleus=nucleus, hair=hair, nrigid=nrigid)
    else:
        dyn_expr = '''
        if(frame==1){{
            {nucleus}.currentTime = 1;
            {hair}.currentTime = 1;
        }}
        else{{
            {nucleus}.currentTime += 1;
            {hair}.currentTime += 1;
        }}'''.format(nucleus=nucleus, hair=hair)
    
    # 构建完整表达式字符串，利用 ctrl 的变换属性驱动动态节点
    exp_template = '''"
    float $temp = {ctrl}.translateX;
    $temp = {ctrl}.translateY;
    $temp = {ctrl}.translateZ;

    $temp = {ctrl}.rotateX;
    $temp = {ctrl}.rotateY;
    $temp = {ctrl}.rotateZ;

    $temp = {ctrl}.scaleX;
    $temp = {ctrl}.scaleY;
    $temp = {ctrl}.scaleZ;
    {dyn_expr}"
    '''
    exp_str = exp_template.format(ctrl=ctrl, dyn_expr=dyn_expr)
    
    try:
        cmds.expression(s=exp_str)
        print("表达式创建成功:")
        print(exp_str)
    except Exception as e:
        print("创建表达式时出错: {}".format(e))


