#-*- coding: utf-8 -*-

import maya.cmds as cmds
import maya.mel as mel

class MX_SpringRig():

    def __init__(self):        
      
        # create window

        ui = "Spring_Rig"
             
        if cmds.window(ui, exists=True):
            cmds.deleteUI(ui)
             
        cmds.window(ui,w=240)

        # create layout
        cmds.columnLayout()


        cmds.text(label = "")
        cmds.text(label = u"准备工作")
        # create button
        cmds.button(label= u"创建弹簧", w=150, h=30, command=self.create_spring)
        
        cmds.text(label = "")
        cmds.text(label = u"创建绑定")
        # create button
        cmds.button(label= u"创建弹簧绑定", w=150, h=30, command=self.create_spring_rig)

        # show window
        cmds.showWindow(ui)
    
    def create_spring(self,args):
        '''
        create spring and some helper locators
        '''

        spring_mesh = cmds.polyHelix(c=8, h=50, w=15)        
        cmds.move(0, 25, 0, spring_mesh, r=True)

        #copy curve from mesh
        cmds.polySelect( spring_mesh,  edgeLoopPath=[3215,6407] )

        spring_curve = cmds.polyToCurve( form=2, degree=3, conformToSmoothMeshPreview=1)[0]
        cmds.reverseCurve(spring_curve, ch = False, rpo = 1)
        spring_circle = cmds.circle(c = (0, 0, 0), nr = (0, 1, 0) ,sw =360, r = 2, d=3, ut=0, tol=0.01, s=8, ch = 0)[0]
        self.lattice = cmds.lattice(spring_curve, dv=(2, 2, 2), oc=True )

        spring_surf = cmds.extrude(spring_circle, spring_curve, ch = True, rn = False, po = 0, et=2, ucp=1, fpt=1, upn=1, rotation=0, scale=1, rsp = 1)

        #delete the mesh
        cmds.delete(spring_mesh)

        self.dis_node0 = cmds.distanceDimension(sp = (-10,50,0), ep = (-10,20,0))
        self.dis_node1 = cmds.distanceDimension(sp = (-20,50,0), ep = (-20,0,0))
        self.dis_node2 = cmds.distanceDimension(sp = (-30,50,0), ep = (-30,-25,0))

        self.locator0 = cmds.listConnections(self.dis_node0)
        self.locator1 = cmds.listConnections(self.dis_node1)
        self.locator2 = cmds.listConnections(self.dis_node2)

        grp = cmds.group(em=True)

        cmds.parent(spring_circle,grp)
        cmds.parent(spring_curve,grp)
        cmds.parent(self.lattice,grp)
        cmds.parent(spring_surf,grp)

        cmds.setAttr(spring_circle+".v",0)
        cmds.setAttr(spring_curve+".v",0)
        cmds.setAttr(self.lattice[1]+".v",0) 

        cmds.select(cl=True)
        

    def create_spring_rig(self,args):

        dis0 = cmds.getAttr(self.dis_node0+".distance")
        dis1 = cmds.getAttr(self.dis_node2+".distance") - cmds.getAttr(self.dis_node1+".distance")
        
        cube0 = cmds.polyCube(h=1, ch=False)    
        cube1 = cmds.polyCube(h=dis0, ch=False)    
        cube2 = cmds.polyCube(h=dis0, ch=False) 
        cube3 = cmds.polyCube(h=1, ch=False)
        
        cubes = [cube0,cube1,cube2,cube3]
            
        cmds.move(0, -0.5, 0, cube0, r=True)    
        cmds.move(0, dis0/2, 0, cube1, r=True)
        cmds.move(0, dis0/2, 0, cube2, r=True)
        cmds.move(0, 50 + dis1, 0, cube3, r=True)
            
        muscle_nodes = []
        
        #create muscle for each collider
        for i , cube in enumerate(cubes):
            cmds.setAttr(cube[0]+".v",0)
            cmds.select(cube)
            muscle_node = mel.eval("cMuscle_makeMuscle(0);")
            cmds.setAttr(muscle_node[0] + ".fat",0)
            if( not(i % 2 ==0)):
                cmds.setAttr(muscle_node[0] + ".reverseNormals",1)
            muscle_nodes.append(muscle_node[0])
        cmds.select(cl=True)

        #create 2 joint to control the lattice
        joint_base = cmds.joint(p=(0,0,0))
        cmds.select(cl=True)
        joint_top = cmds.joint(p=(0,50,0))

        cmds.skinCluster([joint_base,joint_top],self.lattice[1],tsb=True)
        
        
        #create keep out
        grp0 = cmds.group(em=True)
        cmds.select(grp0)
        keepOut1 = mel.eval("cMuscle_rigKeepOutSel();")    
        cmds.parent(joint_base,cmds.listRelatives(keepOut1)[1])
        
        grp1 = cmds.group(em=True)    
        cmds.move(0,50,0,grp1)
        cmds.select(grp1)
        keepOut2 = mel.eval("cMuscle_rigKeepOutSel();")    
        cmds.parent(joint_top,cmds.listRelatives(keepOut2)[1])
        
        cmds.setAttr( keepOut1[0] + ".inDirectionX", 0)
        cmds.setAttr( keepOut1[0] + ".inDirectionY", 1)
        
        cmds.setAttr( keepOut2[0] + ".inDirectionX", 0)
        cmds.setAttr( keepOut2[0] + ".inDirectionY", 1)        
        
        #connect muscle to keepOut
        cmds.select(cube0,cube1,keepOut1)
        mel.eval("cMuscle_keepOutAddRemMuscle(1);")    
        
        cmds.select(cube2,cube3,keepOut2)
        mel.eval("cMuscle_keepOutAddRemMuscle(1);")

        #do some grouping work
        grp2 = cmds.group(em=True)

        #create controller
        ctrl = cmds.circle(c = (0, 0, 0), nr = (0, 1, 0) ,sw =360, r = 15, d=3, ut=0, tol=0.01, s=8, ch = 0)[0]

        cmds.parent(cube1[0],cube0[0])        
        cmds.parent(cube2[0],cube0[0])        
        cmds.parent(cube3[0],cube0[0]) 
        cmds.parent(cube0[0],ctrl)

        cmds.parent(grp0,grp2)
        cmds.parent(grp1,grp2)
        cmds.parent(ctrl,grp2)
        
        cmds.delete( self.locator0 )
        cmds.delete( self.locator1 )
        cmds.delete( self.locator2 )
