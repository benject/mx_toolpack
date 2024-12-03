#-*- coding: utf-8 -*-

import maya.cmds as cmds

def replace_shape():    
    
    sel = cmds.ls(sl=True)
    for curve_xform in sel:
        
        temp_curve = cmds.duplicate(sel[-1],rr=True,n="{}_newCurve".format(curve_xform))
        pos = cmds.xform(curve_xform,ws=True,q=True,rp=True)
        cmds.move(pos[0],pos[1],pos[2],temp_curve )
        new_shape = cmds.listRelatives(temp_curve)[0]

        shape = cmds.listRelatives(curve_xform)

        cmds.delete(shape[0])

        cmds.parent(new_shape, curve_xform, s=True, r=True)
        cmds.delete(temp_curve)

