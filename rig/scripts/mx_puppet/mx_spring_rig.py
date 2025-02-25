#-*- coding: utf-8 -*-
import sys, os
import random

from PySide2 import QtWidgets, QtCore, QtGui

import maya.OpenMayaUI as omui
import maya.cmds as cmds
import maya.mel as mel

from shiboken2 import wrapInstance

class MX_SpringRig(QtWidgets.QDialog):
    def __init__(self):
        
        # 获取 Maya 主窗口作为父级，如果外部未指定，则自动获取
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()        

        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QtWidgets.QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QtWidgets.QWidget)  #for maya2020 and earlier
    
        super(MX_SpringRig, self).__init__( self.mayaMainWindow )
   
        
        self.setObjectName('CreateSpring')
        self.setWindowTitle(u"弹簧工具")
        self.setFixedSize(150, 140)
        
        self.setupUI()
        self.show()
    
    def setupUI(self):

        # 检查是否已有同名窗口并关闭
        for widget in self.mayaMainWindow .children():
            if widget.objectName() == 'CreateSpring':
                widget.close()
                widget.deleteLater()
                break
        # 使用 Arial 9pt 字体
        font = QtGui.QFont("Arial", 9)
        
        layout = QtWidgets.QVBoxLayout(self)
        layout.setSpacing(5)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setAlignment(QtCore.Qt.AlignCenter)
        
        # 第一部分：准备工作
        label1 = QtWidgets.QLabel(u"准备工作")
        label1.setFont(font)
        label1.setAlignment(QtCore.Qt.AlignCenter)
        layout.addWidget(label1)
        
        btn_create_spring = QtWidgets.QPushButton(u"创建弹簧")
        btn_create_spring.setFont(font)
        btn_create_spring.setMinimumHeight(30)
        btn_create_spring.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Fixed)
        layout.addWidget(btn_create_spring)
        btn_create_spring.clicked.connect(self.create_spring)
        
        layout.addSpacing(5)
        
        # 第二部分：创建绑定
        label2 = QtWidgets.QLabel(u"创建绑定")
        label2.setFont(font)
        label2.setAlignment(QtCore.Qt.AlignCenter)
        layout.addWidget(label2)
        
        btn_create_rig = QtWidgets.QPushButton(u"创建弹簧绑定")
        btn_create_rig.setFont(font)
        btn_create_rig.setMinimumHeight(30)
        btn_create_rig.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Fixed)
        layout.addWidget(btn_create_rig)
        btn_create_rig.clicked.connect(self.create_spring_rig)
    
    def create_spring(self):
        cmds.select(clear=True)
        spring_mesh = cmds.polyHelix(c=8, h=50, w=15)
        cmds.move(0, 25, 0, spring_mesh, r=True)
        cmds.polySelect(spring_mesh, edgeLoopPath=[3215, 6407])
        spring_curve = cmds.polyToCurve(form=2, degree=3, conformToSmoothMeshPreview=1)[0]
        cmds.reverseCurve(spring_curve, ch=False, rpo=1)
        self.spring_circle = cmds.circle(c=(0, 0, 0), nr=(0, 1, 0), sw=360, r=2, d=3, ut=0, tol=0.01, s=8, ch=0)[0]
        self.lattice = cmds.lattice(spring_curve, dv=(2, 2, 2), oc=True)
        spring_surf = cmds.extrude(self.spring_circle, spring_curve, ch=True, rn=False, po=0, et=2, ucp=1, fpt=1, upn=1, rotation=0, scale=1, rsp=1)
        cmds.delete(spring_mesh)
        self.dis_node0 = cmds.distanceDimension(sp=(-10, 50, 0), ep=(-10, 20, 0))
        self.dis_node1 = cmds.distanceDimension(sp=(-20, 50, 0), ep=(-20, 0, 0))
        self.dis_node2 = cmds.distanceDimension(sp=(-30, 50, 0), ep=(-30, -25, 0))
        self.locator0 = cmds.listConnections(self.dis_node0)
        self.locator1 = cmds.listConnections(self.dis_node1)
        self.locator2 = cmds.listConnections(self.dis_node2)
        grp = cmds.group(em=True,n="Spring_Fixed_Grp")
        cmds.parent(self.spring_circle, grp)
        cmds.parent(spring_curve, grp)
        cmds.parent(self.lattice, grp)
        cmds.parent(spring_surf, grp)
        cmds.setAttr(self.spring_circle + ".v", 0)
        cmds.setAttr(spring_curve + ".v", 0)
        cmds.setAttr(self.lattice[1] + ".v", 0)
        cmds.select(clear=True)
    
    def create_spring_rig(self):
        dis0 = cmds.getAttr(self.dis_node0 + ".distance")
        dis1 = cmds.getAttr(self.dis_node2 + ".distance") - cmds.getAttr(self.dis_node1 + ".distance")
        cube0 = cmds.polyCube(h=1, ch=False)
        cube1 = cmds.polyCube(h=dis0, ch=False)
        cube2 = cmds.polyCube(h=dis0, ch=False)
        cube3 = cmds.polyCube(h=1, ch=False)
        cubes = [cube0, cube1, cube2, cube3]
        cmds.move(0, -0.5, 0, cube0, r=True)
        cmds.move(0, dis0/2, 0, cube1, r=True)
        cmds.move(0, dis0/2, 0, cube2, r=True)
        cmds.move(0, 50 + dis1, 0, cube3, r=True)
        muscle_nodes = []
        for i, cube in enumerate(cubes):
            cmds.setAttr(cube[0] + ".v", 0)
            cmds.select(cube)
            muscle_node = mel.eval("cMuscle_makeMuscle(0);")
            cmds.setAttr(muscle_node[0] + ".fat", 0)
            if i % 2 != 0:
                cmds.setAttr(muscle_node[0] + ".reverseNormals", 1)
            muscle_nodes.append(muscle_node[0])
        cmds.select(clear=True)
        joint_base = cmds.joint(p=(0, 0, 0))
        cmds.select(clear=True)
        joint_top = cmds.joint(p=(0, 50, 0))
        cmds.skinCluster([joint_base, joint_top], self.lattice[1], tsb=True)
        grp0 = cmds.group(em=True)
        cmds.select(grp0)
        keepOut1 = mel.eval("cMuscle_rigKeepOutSel();")
        cmds.parent(joint_base, cmds.listRelatives(keepOut1)[1])
        grp1 = cmds.group(em=True)
        cmds.move(0, 50, 0, grp1)
        cmds.select(grp1)
        keepOut2 = mel.eval("cMuscle_rigKeepOutSel();")
        cmds.parent(joint_top, cmds.listRelatives(keepOut2)[1])
        cmds.setAttr(keepOut1[0] + ".inDirectionX", 0)
        cmds.setAttr(keepOut1[0] + ".inDirectionY", 1)
        cmds.setAttr(keepOut2[0] + ".inDirectionX", 0)
        cmds.setAttr(keepOut2[0] + ".inDirectionY", 1)
        cmds.select(cube0, cube1, keepOut1)
        mel.eval("cMuscle_keepOutAddRemMuscle(1);")
        cmds.select(cube2, cube3, keepOut2)
        mel.eval("cMuscle_keepOutAddRemMuscle(1);")
        grp2 = cmds.group(em=True,n='Spring_Grp'+"_"+str(random.randint(0,1000000)))
        ctrl = cmds.circle(c=(0, 0, 0), nr=(0, 1, 0), sw=360, r=15, d=3, ut=0, tol=0.01, s=8, ch=0)[0]
        

        cmds.setAttr("{}.tx".format(ctrl), l=True )
        cmds.setAttr("{}.tz".format(ctrl), l=True )
        cmds.setAttr("{}.rx".format(ctrl), l=True )
        cmds.setAttr("{}.ry".format(ctrl), l=True )
        cmds.setAttr("{}.rz".format(ctrl), l=True )
        cmds.setAttr("{}.sx".format(ctrl), l=True )
        cmds.setAttr("{}.sy".format(ctrl), l=True )
        cmds.setAttr("{}.sz".format(ctrl), l=True )
        cmds.setAttr("{}.v".format(ctrl), l=True )

        
        cmds.parent(cube1[0], cube0[0])
        cmds.parent(cube2[0], cube0[0])
        cmds.parent(cube3[0], cube0[0])
        cmds.parent(cube0[0], ctrl)
        cmds.parent(grp0, grp2)
        cmds.parent(grp1, grp2)
        cmds.parent(ctrl, grp2)
        cmds.delete(self.locator0)
        cmds.delete(self.locator1)
        cmds.delete(self.locator2)

        cmds.select(grp2)
        mel.eval('CenterPivot;')
        ctrl_all = cmds.circle(r=20,nr=(0,1,0),ch=False,n='Spring_Rig_Ctrl')
        pcnt = cmds.pointConstraint(grp2,ctrl_all,mo=False)
        cmds.delete(pcnt)

        cmds.scaleConstraint(ctrl_all, self.spring_circle)

        cmds.parent(grp2, ctrl_all)


        
