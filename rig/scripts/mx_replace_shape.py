#-*- coding: utf-8 -*-

import maya.cmds as cmds

def replace_shape():    
    
    sel = cmds.ls(sl=True)
    
    for curve_xform in sel:
        
        temp_curve = cmds.duplicate(sel[-1])
        
        new_shape = cmds.listRelatives(temp_curve)[0]
        old_shape = cmds.listRelatives( curve_xform )[0]
        cmds.delete(old_shape)
        cmds.parent(new_shape, curve_xform, s=True, r=True)    
        cmds.delete(temp_curve)
