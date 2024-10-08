# -*- coding: utf-8 -*-

import maya.cmds as cmds

class MX_MultiAlign():
    def __init__(self):

        ui = "align_ui"
        # Check if the window exists; if so, delete it
        if cmds.window(ui, exists=True):
            cmds.deleteUI(ui, window=True)
        
        # Create a new window
        window = cmds.window(ui, widthHeight=(200, 100))

        # Create a column layout to hold the UI elements
        cmds.columnLayout(adjustableColumn=True)
        
        # Add a text description
        cmds.text(label=" ")
        cmds.text(label= u"先多选被对齐的物体")
        cmds.text(label= u"然后再加选需要被移动对齐的物体")
        cmds.text(label=" ")
        
        # Add a button to call the multi_align function
        cmds.button(label="批量对齐", command=self.do_multi_align)
        
        # 设置窗口宽度
        cmds.window(window, edit=True, widthHeight=(200, 100))
        # Show the window
        cmds.showWindow(window)

        
    def do_multi_align(self,args):
        sel = cmds.ls(sl=True)
        half = len(sel) // 2

        for i in range(half):
            parent_node = cmds.parentConstraint(sel[i], sel[half + i], mo=False)
            cmds.delete(parent_node)


        
