# -*- coding: utf-8 -*-

import maya.cmds as cmds
import maya.mel  as mel

def add_ctrl_to_jnts():

    # Get the selected objects in the scene
    # Select joint first and then curve
    cmds.select(hi=True)
    jnts = cmds.ls(sl=True,type='joint')

    # Loop through all selected objects except the last one
    for jnt in jnts:

        # Make Ctrl Curve
        ctrlCurve = mel.eval("curve -d 1 -p 0 1 0 -p 0.258819 0.965926 0 -p 0.5 0.866025 0 -p 0.707107 0.707107 0 -p 0.866025 0.5 0 -p 0.965926 0.258819 0 -p 1 0 0 -p 0.965926 -0.258819 0 -p 0.866025 -0.5 0 -p 0.707107 -0.707107 0 -p 0.5 -0.866025 0 -p 0.258819 -0.965926 0 -p 0 -1 0 -p -0.258819 -0.965926 0 -p -0.5 -0.866025 0 -p -0.707107 -0.707107 0 -p -0.866025 -0.5 0 -p -0.965926 -0.258819 0 -p -1 0 0 -p -0.965926 0.258819 0 -p -0.866025 0.5 0 -p -0.707107 0.707107 0 -p -0.5 0.866025 0 -p -0.258819 0.965926 0 -p 0 1 0 -p 0 0.965926 0.258819 -p 0 0.866025 0.5 -p 0 0.707107 0.707107 -p 0 0.5 0.866025 -p 0 0.258819 0.965926 -p 0 0 1 -p 0 -0.258819 0.965926 -p 0 -0.5 0.866025 -p 0 -0.707107 0.707107 -p 0 -0.866025 0.5 -p 0 -0.965926 0.258819 -p 0 -1 0 -p 0 -0.965926 -0.258819 -p 0 -0.866025 -0.5 -p 0 -0.707107 -0.707107 -p 0 -0.5 -0.866025 -p 0 -0.258819 -0.965926 -p 0 0 -1 -p 0 0.258819 -0.965926 -p 0 0.5 -0.866025 -p 0 0.707107 -0.707107 -p 0 0.866025 -0.5 -p 0 0.965926 -0.258819 -p 0 1 0 -p 0 0.965926 0.258819 -p 0 0.866025 0.5 -p 0 0.707107 0.707107 -p 0 0.5 0.866025 -p 0 0.258819 0.965926 -p 0 0 1 -p -0.5 0 0.866025 -p -0.866025 0 0.5 -p -1 0 0 -p -0.866025 0 -0.5 -p -0.5 0 -0.866025 -p 0 0 -1 -p 0.5 0 -0.866025 -p 0.866025 0 -0.5 -p 1 0 0 -p 0.866025 0 0.5 -p 0.5 0 0.866025 -p 0 0 1 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12 -k 13 -k 14 -k 15 -k 16 -k 17 -k 18 -k 19 -k 20 -k 21 -k 22 -k 23 -k 24 -k 25 -k 26 -k 27 -k 28 -k 29 -k 30 -k 31 -k 32 -k 33 -k 34 -k 35 -k 36 -k 37 -k 38 -k 39 -k 40 -k 41 -k 42 -k 43 -k 44 -k 45 -k 46 -k 47 -k 48 -k 49 -k 50 -k 51 -k 52 -k 53 -k 54 -k 55 -k 56 -k 57 -k 58 -k 59 -k 60 -k 61 -k 62 -k 63 -k 64 -k 65 -k 66 -n \"Ctrl\";")
        # Duplicate the last selected object, rename it, and rename its children
        ctrl = cmds.duplicate(ctrlCurve, rr=True, n='{}Shape'.format(jnt), rc=True)[0]

        # Get the shape node of the duplicated object
        ctrl_shape = cmds.listRelatives(ctrl, shapes=True, fullPath=True)[0]

        # Parent the shape node to the current joint, maintaining the shape's transformations
        cmds.parent(ctrl_shape, jnt, s=True, r=True)

        # Delete the original duplicated transform node, keeping only the shape
        cmds.delete(ctrl,ctrlCurve)

    transfer_joint_to_ctrl(jnts)
    

def transfer_joint_to_ctrl(jnts):

    for jnt in jnts:
        try:
            shape = cmds.listRelatives(jnt,shapes=True)[0]
           
            ctrl = cmds.group(n="{}_ctrl".format(jnt),em=True)
            cmds.parent(ctrl,jnt)
            
            cmds.setAttr("{}.tx".format(ctrl),0)
            cmds.setAttr("{}.ty".format(ctrl),0)
            cmds.setAttr("{}.tz".format(ctrl),0)
            
            cmds.setAttr("{}.rx".format(ctrl),0)
            cmds.setAttr("{}.ry".format(ctrl),0)
            cmds.setAttr("{}.rz".format(ctrl),0)
        
            cmds.setAttr("{}.sx".format(ctrl),1)
            cmds.setAttr("{}.sy".format(ctrl),1)
            cmds.setAttr("{}.sz".format(ctrl),1)
            
            ctrl_parent_grp = cmds.group(ctrl,n='{}_grp'.format(ctrl))
            cmds.parent(shape, ctrl, s=True,r=True)            
            
            try:
                parent_jnt = cmds.listRelatives(jnt,parent=True)[0]                
                cmds.parent(ctrl_parent_grp, '{}_ctrl'.format(parent_jnt))
                cmds.parentConstraint(ctrl, jnt, mo=True)

            except:
                cmds.parent(ctrl_parent_grp, w=True)
                cmds.parentConstraint(ctrl, jnt, mo=True)
                parent_jnt = cmds.listRelatives(jnt,parent=True)[0]
                cmds.parentConstraint(parent_jnt, ctrl_parent_grp, mo=True)
                cmds.scaleConstraint(parent_jnt, ctrl_parent_grp, mo=True)
        except:            
            continue

