#!/usr/bin/python
# -*- coding: utf-8 -*-

import maya.cmds as cmds


def get_faces_from_sg(myGeo):           
    
    shape = cmds.listRelatives(myGeo)    
    mat2face = {}    
    sgs = cmds.listConnections(shape[0], type='shadingEngine',source=False,destination=True)      
    
    for sg in sgs:

        faces = []
        members = cmds.sets(sg, q=True)
        
        cmds.select(members)
        sel = cmds.ls(sl=True,flatten=True)
        
        #既可以是物体也可以是面
        for item in sel:
            if myGeo in item:
                faces.append(item)
                
        mat2face[sg] = faces
        
    return mat2face

def separate_by_mtl():

    geo = cmds.ls(sl=True)[0]
        
    faces_dict = get_faces_from_sg(geo)
    
    new_geo = ''

    print(faces_dict)
    
    for key in faces_dict.keys():        
        
        
        
        #duplicate a new geo
        
        new_geo = cmds.duplicate(geo,rr=True)[0]
        
        print(new_geo)
        
        keep_faces = []
        
        
        for faces in faces_dict[key]:            
            
            geo_name = faces.split('.')[0]
            faces = faces.replace(geo_name,new_geo)
            
            keep_faces.append(faces)
                    
            
        cmds.select(keep_faces)        
        cmds.select( new_geo+".f[*]", tgl=True) #反选        
        cmds.delete()

    cmds.hide(geo)
