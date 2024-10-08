#!/usr/bin/python
import maya.cmds as cmds
import maya.mel as mel

def select_next_ring():
    
    edge = cmds.ls(sl=True,fl=True)
    
    
    mel.eval("GrowPolygonSelectionRegion")
    mel.eval("GrowPolygonSelectionRegion")
    
    growSel = cmds.ls(sl=True,fl=True)
    
    #print(growSel)
    
    cmds.polySelectSp(edge[0],ring = True)
    
    rings = cmds.ls(sl=True,fl=True)
    #print(rings)
    
    nextRing = list(set(growSel) & set(rings))  
    
    cmds.select(nextRing)


