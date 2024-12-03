#-*- coding: utf-8 -*-

import maya.cmds as cmds

def replace_shape():    
    
    sel = cmds.ls(sl=True)
    
    for curve_xform in sel[0:-1]:        
        
        old_shape = cmds.listRelatives(curve_xform)[0]
        cmds.delete(old_shape)

        temp_curve = cmds.duplicate(sel[-1], rr=True)[0]
        temp_shape = cmds.listRelatives(temp_curve)[0]
        temp_xform = cmds.listRelatives(temp_shape,p=True)
        
        cmds.parent(temp_shape, curve_xform, s=True, r=True)

        cmds.rename(cmds.listRelatives(curve_xform)[0],old_shape)

        cmds.delete(temp_xform)

