#-*- coding: utf-8 -*-
import sys
import maya.cmds as cmds
import maya.mel as mel


# for ui
from maya import OpenMayaUI as omui 
from PySide2.QtCore import * 
from PySide2.QtGui import *
from PySide2.QtWidgets import *
from PySide2.QtUiTools import QUiLoader

from shiboken2 import wrapInstance

class MX_TransferWeight(QWidget):

    def __init__(self):

        super(MX_TransferWeight,self).__init__()
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()

        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier
        
        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow)
        self.setWindowFlags(Qt.Window)

        # 检查窗口是否存在
        for widget in self.mayaMainWindow.children():            
            if widget.objectName() == "TransferWeightUI":
                widget.close()
                widget.deleteLater()
                break

        self.setObjectName("TransferWeightUI")    
        self.setWindowTitle("TransferWeightUI")
        self.setFixedSize(300, 400)
        
        # Create layout
        layout = QVBoxLayout(self)
        
        # Add widgets
        layout.addWidget(QLabel(u"1.整体个别传递", self))
        layout.addWidget(QLabel(u"请选择有权重的模型,加选没有权重的模型", self))
        
        button1 = QPushButton(u"传递权重", self)
        button1.clicked.connect(self.transfer_weights)
        layout.addWidget(button1)

        layout.addWidget(QLabel(u"2.批量传递,用于套已有的绑定", self))
        layout.addWidget(QLabel(u"打开模型文件，然后参考rig文件", self))
        layout.addWidget(QLabel(u"请选择没有权重的模型后输入前缀", self))
        
        self.prefix_textfield = QLineEdit(self)
        layout.addWidget(self.prefix_textfield)
        
        button2 = QPushButton(u"传递权重", self)
        button2.clicked.connect(lambda:self.transfer_weights_batch(self.prefix_textfield.text()))
        layout.addWidget(button2)

        layout.addWidget(QLabel(u"3.将已有蒙皮骨骼的权重传递到其父子约束的骨骼", self))
        layout.addWidget(QLabel(u"特别适用于在不同绑定系统间传递权重", self))
        layout.addWidget(QLabel(u"选择蒙皮模型", self))
        
        button3 = QPushButton(u"传递约束骨骼的权重", self)
        button3.clicked.connect(self.transfer_weights_to_constraint_joint)
        layout.addWidget(button3)

        label4 = QLabel(u"4.传递点的权重", self)
        layout.addWidget(label4)
        
        layout.addWidget(QLabel(u"请选择权重的源点，加选目标点", self))
        
        button4 = QPushButton(u"传递点的权重", self)
        button4.clicked.connect(self.transfer_vertex_weight)
        layout.addWidget(button4)

        self.setLayout(layout)
        
        # Apply a style sheet to adjust font sizes        
        self.setStyleSheet("""QWidget { font-size: 12px; } QLabel { font-size: 12px; } QPushButton { font-size: 12px; }""")

        self.show()

    def transfer_weights(self, source = '', destination = ''):

        if(source=='' and destination==''):
            sel = cmds.ls(sl=True)

            source = sel[0]
            destination = sel[1]

        sourceSkin = mel.eval('findRelatedSkinCluster '+source)

        influences = cmds.skinCluster(sourceSkin,query=True,inf=True)

        #print(influences)

        cmds.skinCluster(influences,destination,tsb=True)

        destSkin = mel.eval('findRelatedSkinCluster '+ destination)


        shape_type = cmds.nodeType(cmds.listRelatives(destination, shapes=True)[0])
        if shape_type in ["nurbsSurface", "nurbsCurve"]:
            # 对于 nurbsSurface 和 nurbsCurve 类型的对象，使用 cv 参数
            cmds.copySkinWeights(
                sourceSkin=sourceSkin, 
                destSkin=destination + ".cv[*]", 
                noMirror=True, 
                surfaceAssociation='closestPoint', 
                influenceAssociation='oneToOne'
            )
        else:
            # 对于其他对象，直接使用目标对象
            cmds.copySkinWeights(
                sourceSkin=sourceSkin, 
                destinationSkin= destSkin, 
                noMirror=True, 
                surfaceAssociation='closestPoint', 
                influenceAssociation='oneToOne'
            )

        cmds.skinCluster( destSkin, forceNormalizeWeights=True, e = True )



    def transfer_weights_batch(self,prefix_str):
       
        sel = cmds.ls(sl=True)

        if(prefix_str):

            for destination in sel:

                source = prefix_str + destination
                                
                self.transfer_weights(source=source,destination=destination)

    def find_influencing_joints(self,mesh):
        # 获取顶点的蒙皮簇
        skin_clusters = cmds.ls(cmds.listHistory(mesh), type='skinCluster')
        if not skin_clusters:
            raise RuntimeError('No skinCluster found influencing the vertex.')

        skin_cluster = skin_clusters[0]
        
        # 获取所有影响骨骼
        influences = cmds.skinCluster(skin_cluster, query=True, influence=True)
        
        # 获取所有顶点
        vertices = cmds.ls("{}.vtx[*]".format(mesh), flatten=True)
        
        # 记录权重不为0的骨骼
        influencing_joints = set()
        
        # 遍历所有顶点
        for vtx in vertices:
            # 遍历所有影响骨骼
            for inf in influences:
                # 获取顶点在当前骨骼上的权重
                weight = cmds.skinPercent(skin_cluster, vtx, transform=inf, query=True)
                if weight > 0:
                    influencing_joints.add(inf)
        
        return list(influencing_joints)

    def transfer_weights_to_constraint_joint(self,args):
        '''
        用于将已有蒙皮骨骼的权重传递到其父子约束的骨骼，特别适用于在不同绑定系统间传递权重
        1.选择模型
        2.执行脚本
        '''                
        mesh = cmds.ls(sl=True)[0]

        skin_clusters = cmds.ls(cmds.listHistory(mesh), type='skinCluster')
        skin_cluster = skin_clusters[0]
        
        # 获取所有影响骨骼
        influences = cmds.skinCluster(skin_cluster, query=True, influence=True)
        
        old_inf_joints = self.find_influencing_joints(mesh)

        #print(old_inf_joints)
        

        for old_inf_joint in old_inf_joints:

            # 获取父子约束
            constraints = cmds.listConnections(old_inf_joint, type='parentConstraint')
            
            if constraints:
                constraints = list(set(constraints))
                
                for constraint in constraints:
                    
                    # 获取新的骨骼
                    new_inf_joints = cmds.parentConstraint(constraint, query=True, targetList=True)                
                    print(new_inf_joints)
                    
                    if new_inf_joints:

                        new_inf_joint = new_inf_joints[0]
                        
                        # 检查 new_joint 是否已经在影响列表中
                        if new_inf_joint not in influences:
                            # 将新的骨骼加入到蒙皮簇的影响列表中
                            cmds.skinCluster(skin_cluster, edit=True, ai=new_inf_joint, lw=True, wt=0)

                        # 取消锁定新骨骼
                        cmds.setAttr("{}.liw".format(new_inf_joint), False)
                        
                        # 获取所有顶点
                        vertices = cmds.ls("{}.vtx[*]".format(mesh), flatten=True)

                        # 遍历所有顶点，将旧骨骼的权重转移到新骨骼
                        for vtx in vertices:
                            old_weight = cmds.skinPercent(skin_cluster, vtx, transform=old_inf_joint, query=True)
                            if old_weight > 0:
                                # 设置新骨骼的权重为旧骨骼的权重
                                cmds.skinPercent(skin_cluster, vtx, transformValue=[(new_inf_joint, old_weight)])
                                # 将旧骨骼的权重设置为0
                                cmds.skinPercent(skin_cluster, vtx, transformValue=[(old_inf_joint, 0)])
                        
                        print("Weights transferred from {} to {} for mesh {}".format(old_inf_joint, new_inf_joint, mesh))
        print("Done")

    def transfer_vertex_weight(self,args):
        '''传递点的权重'''

        sel = cmds.ls( orderedSelection=True)
        if len(sel) < 2:
            cmds.warning("请至少选择两个对象。")
            return

        cmds.select(sel[0])
        mel.eval("CopyVertexWeights;")

        cmds.select(sel[1:-1])
        mel.eval("PasteVertexWeights;")

        print("transfered.")