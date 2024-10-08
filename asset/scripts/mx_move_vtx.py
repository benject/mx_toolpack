# -*- coding: utf-8 -*-

import maya.cmds as cmds

def move_vtx():

    sel = cmds.ls(sl=True)    
    
    vtxs = cmds.polyEvaluate(sel[0] , v=True)    
    
    for i in range(vtxs):
        
        vtx1 = cmds.pointPosition( f"{sel[0]}.vtx[{i}]")        
            
        cmds.xform( f"{sel[1]}.vtx[{i}]", ws = True, t = vtx1)
