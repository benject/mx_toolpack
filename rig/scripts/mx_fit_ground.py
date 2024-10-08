# -*- coding: utf-8 -*-

import maya.cmds as cmds

'''
obsolete

def fit_ground():
    
    #select all the ctrls and last select the ground mesh
    
    drive_curves = []    
    proj_curves = []
    locs = []
    
    sel_list = cmds.ls(sl=True)
    
    for sel in sel_list[:-1]: #loop in objects
        
        #for each object create a curve and project to the ground
        
        pos = cmds.xform(sel, ws = True, q = True, t = True) #if the seletion is not cluster 
                    
        print(pos)
        
        drive_curve = cmds.curve(n = (sel + "_curve"), d = 1 , p =[(pos[0],10000,pos[2]- 0.001) ,  (pos[0],10000,pos[2] + 0.001)]) #create curve from selected joint
       
        drive_curve_ctrl = cmds.circle(r=30,ch=False,nr=(0,1,0),n="drive_curve_ctrl")
        cmds.xform(drive_curve_ctrl[0], t = [pos[0],pos[1],pos[2]] ,a=True ,ws = True)
        cmds.makeIdentity(drive_curve_ctrl[0],apply = True, t = 1, r = 1, s = 1, n=0, pn = 1)

        cmds.pointConstraint(drive_curve_ctrl,drive_curve,mo=True)

        drive_curves.append(drive_curve)
        drive_curves.append(drive_curve_ctrl)

        #key step 1
        proj_curve = cmds.polyProjectCurve( drive_curve, sel_list[-1],  ch = True,  direction = (0, -1, 0), pointsOnEdges = False, curveSamples = 1, automatic = False, tolerance = 0.001 ) #project curve on ground
        proj_curves.append(proj_curve[0])
        
        new_grp = cmds.group( n = (sel + "_grp") , em = True )
        locs.append(new_grp)
        
        curveInfo = cmds.createNode('pointOnCurveInfo') #key step 2
        curve_shape = cmds.listRelatives( cmds.listRelatives(proj_curve)[0])        
        cmds.connectAttr(curve_shape[0] + ".worldSpace" , curveInfo + ".inputCurve")
        cmds.setAttr((curveInfo + ".parameter"), 0.5)        
        cmds.setAttr((curveInfo + ".turnOnPercentage"), 1)
        
        cmds.connectAttr(curveInfo + ".result.position", new_grp + ".translate" )
                
        output_loc = cmds.spaceLocator( n = (sel+"_loc") , p = (0,0,0)) # make a new locator and attach to curve
        
        cmds.xform(output_loc, t = [pos[0],pos[1],pos[2]] ,a=True ,ws = True)
        cmds.pointConstraint(output_loc,sel)
        cmds.parent(output_loc, new_grp)

    drive_curves_grp = cmds.group(empty=True,n="drive_curves_grp")
        
    for drive_curve in drive_curves:
        cmds.parent(drive_curve,drive_curves_grp)

    proj_curves_grp = cmds.group(empty=True,n="proj_curves_grp")
    for proj_curve in proj_curves:
        cmds.parent(proj_curve,proj_curves_grp)

    locs_grp = cmds.group(empty=True,n="ctrl_locators_grp")
    for loc in locs:
        cmds.parent(loc,locs_grp)
'''