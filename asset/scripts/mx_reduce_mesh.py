# -*- coding: utf-8 -*-

import maya.cmds as cmds
import maya.mel as mel

def reduce_mesh():
    '''
    select 1 mesh 
    '''
    #Get the selected mesh
    selectedMesh=cmds.ls( selection=True )[0]
    #Get the vertex count i.e. vertex id of last vertex...
    vertexCount=cmds.polyEvaluate( v=True )
    vertexId = selectedMesh+'.vtx['+str(vertexCount)+']'
    cmds.select(vertexId)
    #Convert selection to edges...
    x=cmds.polyListComponentConversion( fv=True,te=True )
    cmds.select(x)

    #get the edges number...
    k=x[0].rfind(']')
    l=x[0].rfind('[')
    start = x[0][l+1:]
    edges = str(start[:-1])
    colon = edges.split(':')

    #Select edge loops and rings...
    mel.eval('SelectEdgeLoopSp;')
    mel.eval('polySelectEdgesEveryN "edgeRing" 2;')
    mel.eval('SelectEdgeLoopSp;')
    mel.eval('SelectEdgeLoopSp;')
    mel.eval('SelectEdgeLoopSp;')
    mel.eval('polySelectEdgesEveryN "edgeRing" 2;')

    #Delete the selected edgeloops
    cmds.polyDelEdge( cv=True )

    cmds.select(selectedMesh)