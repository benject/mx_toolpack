# -*- coding: utf-8 -*-

import maya.cmds as cmds

def hide_jnts():
    cmds.select(hi=True)
    jnts = cmds.ls(sl=True)
    
    for jnt in jnts:
        
        cmds.setAttr("{}.drawStyle".format(jnt),2)
        
def show_jnts():
    cmds.select(hi=True)
    jnts = cmds.ls(sl=True)
    
    for jnt in jnts:
        
        cmds.setAttr("{}.drawStyle".format(jnt),0)    
        
def create_ui():
    """创建界面"""
    window_name = "show_hide_joints"
    if cmds.window(window_name, exists=True):
        cmds.deleteUI(window_name)
        
    window = cmds.window(window_name, title="show_hide_joints",  minimizeButton=False, maximizeButton=False, widthHeight=(200, 100))
    layout = cmds.columnLayout(adjustableColumn=True)
    
    cmds.text(label="Select root joint and click button", align="center", height=30)

    cmds.button(label="hide joints", command=lambda x: hide_jnts())
    cmds.button(label="show joints", command=lambda x: show_jnts())
    
    cmds.setParent(layout)
    cmds.window(window_name, e=True, widthHeight=(200, 100))
    cmds.showWindow(window)
