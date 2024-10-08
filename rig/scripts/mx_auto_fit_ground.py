# -*- coding: utf-8 -*-

import maya.cmds as cmds
import maya.mel as mel


def auto_fit_ground():

    '''
    # select ground first and then locator
    '''
    sel = cmds.ls(sl=True)

    for i,node in enumerate(sel):
        
        if i==0:
            
            cmds.select(node)
            mel.eval("cMuscle_makeMuscle(0);")
            cmds.select(cl=True)
        
        else:
            
            cmds.select(node)    
        
            mel.eval("cMuscle_rigKeepOutSel();")
            
            cmds.select(hi=True)
            keepout = cmds.ls(sl=True,type="cMuscleKeepOut")[0]
            print(keepout)
            
            keepout_transform = cmds.listRelatives(keepout,p=True)[0]
            
            grp = cmds.listRelatives(keepout_transform)[1] #get under grps 
            
            cmds.setAttr('{}.inDirectionY'.format(keepout),1)
            cmds.setAttr('{}.inDirectionX'.format(keepout),0)
            
            cmds.select(cl=True)
            jnt = cmds.joint(p=cmds.pointPosition(node))
            
            cmds.parent(jnt,grp)
            
            cmds.select(keepout,sel[0])
            
            mel.eval("cMuscle_keepOutAddRemMuscle(1);")
            


