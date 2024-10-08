# -*- coding: utf-8 -*-

import maya.cmds as cmds
import maya.mel as mel


def edge_dfs(edge,real_sel_in_loop,new_loop): #dfs 递归的深度优先搜索
    
    cmds.select(edge)
            
    mel.eval('PolySelectTraverse 1')
                    
    growth = cmds.ls(sl=True,flatten=True)

    growth_without_edge = list(set(growth) - set([edge]))
    
    count = len(growth_without_edge)
    
    for tmp_edge in growth_without_edge:
        
        if count>0:                
            if (tmp_edge in real_sel_in_loop) and not( tmp_edge in new_loop) :                
                new_loop.append(tmp_edge)                
                edge_dfs(tmp_edge,real_sel_in_loop, new_loop)
                count -= 1            
            else:
                count -= 1
        else:            
            return 
            
            
def multi_loop_to_curve():
                            
    sel = cmds.ls(sl=True,flatten=True)
    
    loops= []

    for edge in sel:
        
        cmds.polySelectSp(edge, l=True) #找到loop
        
        tmpLoop = cmds.ls(sl=True,flatten=True)
        
        if not (tmpLoop in loops): #边在新的loop里
            loops.append(tmpLoop)
        

    final_loops = []

    for loop in loops:
        
        real_sel_in_loop = list(set(sel) & set(loop)) #找到在loop里的初始选择集        
        
        if(len(real_sel_in_loop)==len(loop)): #如果一条loop只包含一个初始选择集
            final_loops.append(loop)
            continue
    
        else: #多条        
            while(len(real_sel_in_loop)>0):
        
                new_loop = []
                
                edge = real_sel_in_loop[0]
                
                new_loop.append(edge)
                
                edge_dfs(edge,real_sel_in_loop, new_loop)
                
                final_loops.append(new_loop)
                
                real_sel_in_loop = list(set(real_sel_in_loop) - set(new_loop))            
                    

    for loop in final_loops:
        
        cmds.select(loop)
        cmds.polyToCurve(form=2, degree=3, conformToSmoothMeshPreview = 1)
        
