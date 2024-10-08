# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import math

'''obsolete
def move_uv_shell(obj):

    cmds.select(obj,r=True)   
    uv_cnt = cmds.polyEvaluate(uv=True) #get all uv count    
    uv_list = cmds.select( '{0}.map[0:{1}]'.format(obj,uv_cnt))
    
    uv_sel = cmds.ls(sl=True,fl=True)
    

    while(len(uv_sel)>0):

        uv_pick = cmds.polyEditUV( uv_sel[0], query=True)
        
        cmds.select(uv_sel[0])
        mel.eval('polySelectBorderShell 0;')
        

        uv_list = cmds.ls(sl=True,fl=True) # get uv shell as selection
        

        uv_sel = list(set(uv_sel) - set(uv_list))
        
        if (uv_pick[0]>=0) and (uv_pick[0]<=1) and (uv_pick[1]>=0) and (uv_pick[1]<=1): #if the uv is in 0-1
        
            continue
        else:            
            cmds.polyEditUV(u = -1 * math.ceil(uv_pick[0]) + 1 ,v = -1 * math.ceil(uv_pick[1]) +1 )

    cmds.select(cl=True)
    
    
def move_uv_to_first_uv():
    
    sel = cmds.ls(sl=True)
    
    if(len(sel)==0):
        
        print("you must select at least one poly!")
    else:
    
        for obj in sel:
            move_uv_shell(obj)
            

'''

def move_uv_to_first_uv():
    mel.eval("texGatherShells;")