# -*- coding: utf-8 -*-

import maya.cmds as cmds

def multi_groups():
    
    
    sel = cmds.ls(sl=True)
    
    for obj in sel:
        
        cmds.select(obj)
        
        mat = cmds.xform(obj,q=True, m=True, ws=True) #get world space matrix
        
        grp = cmds.group(n="{}_Grp".format(obj),em=True)       
        
        cmds.xform(grp, m=mat,ws=True)
        
        cmds.parent(obj,grp)
        
        cmds.setAttr("{}.tx".format(obj),0)
        cmds.setAttr("{}.ty".format(obj),0)
        cmds.setAttr("{}.tz".format(obj),0)
        
        cmds.setAttr("{}.rx".format(obj),0)
        cmds.setAttr("{}.ry".format(obj),0)
        cmds.setAttr("{}.rz".format(obj),0)

        cmds.setAttr("{}.sx".format(obj),1)
        cmds.setAttr("{}.sy".format(obj),1)
        cmds.setAttr("{}.sz".format(obj),1)

        cmds.select(cl=True)
        
multi_groups()
