# -*- coding: utf-8 -*-

import maya.cmds as cmds

def remove_unloaded_reference_nodes():
    # 获取所有引用节点
    all_references = cmds.ls(type="reference")
    
    # 存储未加载的引用节点及其文件名
    unloaded_references = {}

    # 遍历所有引用节点
    for ref in all_references:
        # 跳过子引用节点，并确保只有主引用节点在处理范围内
        if cmds.referenceQuery(ref, isNodeReferenced=True):
            continue
        
        try:
            # 检查引用文件是否已被卸载
            if not cmds.referenceQuery(ref, isLoaded=True):
                # 获取未加载引用节点的文件路径
                file_name = cmds.referenceQuery(ref, filename=True)
                unloaded_references[ref] = file_name
        except RuntimeError:
            # 跳过没有关联文件的节点（如 sharedReferenceNode）
            continue

    # 输出未加载的引用节点及其文件名
    for ref, file_name in unloaded_references.items():  # 使用 items() 代替 iteritems()
        print("Unloaded reference node: {}, File name: {}".format(ref, file_name))
        cmds.file(file_name,rr=1)
