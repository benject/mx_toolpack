# -*- coding: utf-8 -*-

import maya.cmds as cmds
import maya.mel as mel

def create_collider_deformer():
    
    #get source_mesh shader

    objs = cmds.ls(sl = True)
    source_mesh = objs[0]
    passive_mesh = objs[1]
        
    shapes = [ cmds.listRelatives(i)[0] for i in [source_mesh,passive_mesh] ]    
    
    shadingGrps = cmds.listConnections(shapes[0],type='shadingEngine')
    
    #create collision deformer bifrost graph
            
    graph_shape = mel.eval("bifrostGraph -importGraphAsShape "+ "\"MX_PACK::Anim::bifrostColliderDeformerShape\" ; ")    
    
    #rename graph shape to avoid same name    
    graph_xform = cmds.listRelatives(graph_shape,p=True)[0]     
    
    cmds.rename(graph_shape,( graph_xform + "_Shape" ))
     
    graph = cmds.listRelatives(graph_xform)[0]

    #connect attrs
        
    cmds.connectAttr((source_mesh + ".worldMesh"), (graph + ".source_mesh"))
    cmds.connectAttr((passive_mesh + ".worldMesh"), (graph + ".collision_mesh"))
    
    cmds.setAttr((graph + ".start_frame"),-1000)
    cmds.setAttr((graph + ".elastic"),True)
    
    #create output mesh and assign shader
    
    output_mesh = cmds.createNode ("mesh",n = "outputShape")
    cmds.sets(output_mesh, e = True, forceElement = shadingGrps[0])
    geo_to_maya = cmds.createNode( "bifrostGeoToMaya")
    
    cmds.connectAttr((graph + ".out_mesh"), (geo_to_maya + ".bifrostGeo"))
    cmds.connectAttr((geo_to_maya + ".mayaMesh[0]"), (output_mesh + ".inMesh"))

    cmds.setAttr((source_mesh + ".v"), 0)
    cmds.setAttr((graph + ".v"), 0)

    grp = cmds.group(graph_xform)
    cmds.addAttr(grp, ln = "elastic", at="bool", dv=1, k=True)
    cmds.setAttr("%s.elastic"%grp, e=True, channelBox=True)
    cmds.connectAttr("%s.elastic"%grp, "%s.elastic"%graph)

