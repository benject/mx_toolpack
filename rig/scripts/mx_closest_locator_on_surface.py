import maya.cmds as cmds

def closest_locator_on_surface():
    
    """
    create a nurbs surface and a locator ,select surface first and then locator
    """
    sel = cmds.ls(sl=True)
    
    surf_shape = cmds.listRelatives(sel[0])[0]
    
    cps = cmds.createNode("closestPointOnSurface")
    
    cmds.connectAttr( "{}.worldSpace".format(surf_shape),  "{}.inputSurface".format(cps))
    cmds.connectAttr( "{}.translate".format(sel[1]),  "{}.inPosition".format(cps))    
    
    posi = cmds.createNode("pointOnSurfaceInfo")    
    cmds.connectAttr( "{}.worldSpace".format(surf_shape),  "{}.inputSurface".format(posi))
    cmds.connectAttr("{}.parameterU".format(cps), "{}.parameterU".format(posi))
    cmds.connectAttr("{}.parameterV".format(cps), "{}.parameterV".format(posi))    
    
    ab = cmds.createNode("angleBetween")    
    
    cmds.setAttr( "{}.vector1X".format(ab), 0)
    cmds.setAttr( "{}.vector1Y".format(ab), 1)
    cmds.setAttr( "{}.vector1Z".format(ab), 0)
    
    cmds.connectAttr("{}.normal".format(posi), "{}.vector2".format(ab))
    
    aatq = cmds.createNode("axisAngleToQuat")    
    cmds.connectAttr("{}.axis".format(ab), "{}.inputAxis".format(aatq))
    cmds.connectAttr("{}.angle".format(ab), "{}.inputAngle".format(aatq))        
    
    qte = cmds.createNode("quatToEuler")    
    cmds.connectAttr("{}.outputQuat".format(aatq) ,"{}.inputQuat".format(qte))    
    
    out_loc = cmds.spaceLocator(name ="output_loc")
    
    cmds.connectAttr( "{}.position".format(posi) ,"{}.translate".format(out_loc[0]))
    cmds.connectAttr("{}.outputRotate".format(qte),"{}.rotate".format(out_loc[0]))


closest_locator_on_surface()