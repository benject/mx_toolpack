# -*- coding: utf-8 -*-

import maya.cmds as cmds
import maya.utils as utils
import random
from threading import Thread
import MASH.api as mapi


class MX_Scatter():

    def __init__(self):        

        # create window

        ui = "Scatter"
             
        if cmds.window(ui, exists=True):
            cmds.deleteUI(ui)
             
        cmds.window(ui)


        # create layout
        cmds.columnLayout()

        cmds.text(label = "")
        cmds.text(label = u"首先选生长物体，再选散布物体")

        # create input textfield
        cmds.text(label = "")
        cmds.text(label = u"输入散布数量")
        cmds.textField("number_textfield", width=200)

        # create button
        cmds.button(label= u"散布",command=self.scatter_on_mesh, width=200)       
        
        # show window
        cmds.showWindow(ui)

    def scatter_on_mesh(self,args): #using mash

        num_points = int(cmds.textField("number_textfield", q=True, text=True))
        if(num_points==None):
                    num_points = 200 
        
        sel = cmds.ls(sl=True)
        mesh = cmds.listRelatives(sel[0])[0]
        
        if(len(sel)==1):

            cmds.polyCube() 
            # create a new MASH network
            mashNetwork = mapi.Network()
            mashNetwork.createNetwork(name="mx_scatter")

            mashNetwork.meshDistribute(mesh, mode=1)
            mashNetwork.setPointCount(num_points)
            
        else:
             
            cmds.select(sel[1:])
            # create a new MASH network
            mashNetwork = mapi.Network()
            mashNetwork.createNetwork(name="mx_scatter")

            mashNetwork.meshDistribute(mesh, mode=1)
            mashNetwork.setPointCount(num_points)
            id_node = mashNetwork.addNode("MASH_ID")
            cmds.setAttr("%s.numObjects"%id_node.name, len(sel[1:]))

    '''
    obsolete but it can support non-mesh object

    def scatter_on_mesh(self,args):

        num_points = int(cmds.textField("number_textfield", q=True, text=True))

        if(num_points==None):
            num_points = 200 

            
        # Specify the mesh and number of points to scatter
        
        sel = cmds.ls(sl=True)
        mesh = cmds.listRelatives(sel[0])[0]

        grp = cmds.group(em=True,name="%s_scattered_grp"%mesh)
        
        #create a intermediate mesh
        ori_mesh = cmds.duplicate(mesh,rr=True)[0]
        cmds.connectAttr("%s.worldMesh"%ori_mesh , "%s.inMesh"%mesh, force=True)
        cmds.setAttr("%s.intermediateObject"%ori_mesh,True)       

        if (num_points>1000):
            
            for i in range(10):
                temp_points = num_points//10
                t = Thread(target=self.run,args=(temp_points,mesh,ori_mesh,sel,grp,))
                t.start()

        else:
            self.wrapped_fun(num_points,mesh,ori_mesh,sel,grp)
    
    def wrapped_fun(self,num_points,mesh,ori_mesh,sel,grp):

        #create uvpin and connect the attributes
        pin = cmds.createNode("uvPin", name="%s_pin" % mesh)
        print(pin)
        cmds.connectAttr("%s.outMesh" % ori_mesh, "%s.originalGeometry" % pin, force=True)
        cmds.connectAttr("%s.worldMesh" % mesh, "%s.deformedGeometry" % pin, force=True)
        
        #using random uv and uvpin to scatter points
        for i in range(num_points):
        
            u, v = random.uniform(0, 1), random.uniform(0, 1)
            
            cmds.setAttr("%s.coordinate[%i].coordinateU " %(pin, i), u)
            cmds.setAttr("%s.coordinate[%i].coordinateV" % (pin, i), v)
            
            if(len(sel)==1):
                loc = cmds.spaceLocator(p=(0,0,0))[0]        
                cmds.connectAttr("%s.outputMatrix[%i]" % (pin,i), "%s.offsetParentMatrix" % loc, force=True)
                cmds.parent(loc,grp)
            else:
        
                obj = random.choices(sel[1:])[0]
                new_obj = cmds.duplicate(obj,rr=True)[0]
                cmds.connectAttr("%s.outputMatrix[%i]" % (pin,i), "%s.offsetParentMatrix" % new_obj, force=True)
                cmds.parent(new_obj,grp)

    def run(self,num_points,mesh,ori_mesh,sel,grp):

        utils.executeDeferred(self.wrapped_fun,num_points,mesh,ori_mesh,sel,grp)

    '''
