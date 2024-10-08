#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys,os
import maya.cmds as cmds
import maya.mel as mel

# for ui
from maya import OpenMayaUI as omui 
from PySide2.QtCore import * 
from PySide2.QtGui import *
from PySide2.QtWidgets import *
from PySide2.QtUiTools import QUiLoader

from shiboken2 import wrapInstance 
import subprocess


class MX_BakeMesh(QWidget): 
    
    def __init__(self,root_path, *args, **kwargs):    

        super(MX_BakeMesh, self).__init__(*args, **kwargs)

        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()

        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier

        #Set the object name     
        self.setObjectName('Bake_Mesh_UI')
        self.setWindowTitle('Bake_Mesh_UI') 
        
        # 检查窗口是否存在
        for widget in self.mayaMainWindow.children():            
            if widget.objectName() == "Bake_Mesh_UI":
                widget.close()
                widget.deleteLater()
                break

        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window | Qt.WindowCloseButtonHint)

        self.root_path = root_path
        self.abc_file = ''
        self.init_fbx_file = ''
        self.out_fbx_file=''

        self.cache = ''
        self.target = ''   

    def initUI(self):
        
        loader = QUiLoader()
        file = QFile(self.root_path+"/mx_bake_mesh.ui")
        file.open(QFile.ReadOnly) 
        self.ui = loader.load(file, parentWidget=self)
        file.close()

        self.ui.pushButton_5.clicked.connect( self.set_out_fbx_file )
        self.ui.pushButton_6.clicked.connect( self.bake_to_skincluster )

        self.ui.radioButton.toggled.connect(self.changeToDemBonesHelpText)
        self.ui.radioButton_2.toggled.connect(self.changeToOneJointHelpText)
        self.ui.radioButton_3.toggled.connect(self.changeToBSSeqHelpText)

        self.show()


    @Slot()
    def set_out_fbx_file(self):
        self.out_fbx_file = cmds.fileDialog2(fileFilter="*.fbx", dialogStyle=2)[0]
        self.ui.lineEdit_4.setText(self.out_fbx_file)

    @Slot()
    def bake_to_skincluster(self):          

        if(self.ui.radioButton.isChecked()==True):
            sel = cmds.ls(sl=True)
            self.cache = cmds.listRelatives(sel[0])[0]
            self.target = cmds.listRelatives(sel[1])[0]

            cache_node = cmds.listConnections(self.cache, t="AlembicNode")[0]
            self.abc_file = cmds.getAttr("{}.abc_File".format(cache_node))

            
            temp_dir = cmds.internalVar(userTmpDir=True)
            self.init_fbx_file = os.path.join(temp_dir , "bindpose_fbx.fbx")
            self.init_fbx_file = self.init_fbx_file.replace("\\","/")
            #export as a fbx
            cmds.select(self.target)
            
            #to ensure this script works.scale the fbx down to 0.01
            #cmds.scale(0.01,0.01,0.01)

            mel.eval('FBXResetExport')
                    
            mel.eval('FBXExportSmoothingGroups -v false')
            mel.eval('FBXExportSmoothMesh -v true')
                        
            mel.eval('FBXProperty Export|IncludeGrp|Animation -v false')

            mel.eval('FBXExportCameras -v false')
            mel.eval('FBXExportLights -v false')

            print("export bindpose fbx to {}".format(self.init_fbx_file))
            
            mel.eval('FBXExport -f "{}" -s'.format(self.init_fbx_file))

            #dembones
            cmd = os.path.join(os.path.dirname(self.root_path),"dist","dembones","DemBones.exe")
            print(cmd + " -a=" + self.abc_file +  " -i=" + self.init_fbx_file  + " -o=" + self.out_fbx_file) 
            subprocess.run(cmd + " -a=" + self.abc_file +  " -i=" + self.init_fbx_file  + " -o=" + self.out_fbx_file + " -n=" + self.ui.lineEdit.text() ) 
            
            #os.remove(self.init_fbx_file)

        elif(self.ui.radioButton_2.isChecked() == True):
            
            sel = cmds.ls(sl=True)
            self.cache = cmds.listRelatives(sel[0])[0]            

            #1 joint per vertex
            temp_obj = cmds.duplicate(self.cache, rr=True)
            
            # Specify the mesh and number of points to scatter        
            grp = cmds.group(em=True,name="%s_scattered_grp"%self.cache) 
            mesh = self.cache
                    
            cmds.select(cl=True)
            locs =[]
            jnts =[]
            
            vertexCount=cmds.polyEvaluate(mesh,v=True)
            cmds.select("{}.vtx[0:{}]".format(mesh,vertexCount), r=True)
            mel.eval("Rivet;")
            locs = cmds.ls(sl=True,type="transform")
            cmds.parent(locs,grp)

            cmds.select(cl=True)  
            root_joint = cmds.joint(p=[0,0,0])

            for loc in locs:
                cmds.select(cl=True)               
                jnt = cmds.joint(p=[0,0,0])
                cmds.parentConstraint(loc, jnt, mo=False)
                jnts.append(jnt)

                cmds.parent(jnt,root_joint)

            cmds.select(jnts)
            cmds.skinCluster(temp_obj, jnts, tsb=True)
            cmds.hide(root_joint)
            cmds.hide(grp)
          
        else:
            #bake to blendshape
            # 获取时间滑条的起始和结束帧
            start_frame = cmds.playbackOptions(q=True, min=True)
            end_frame = cmds.playbackOptions(q=True, max=True)

            self.cache = cmds.ls(sl=True)[0]
            # 在第一帧创建temp_obj并复制self.cache
            cmds.currentTime(start_frame)
            temp_obj = cmds.duplicate(self.cache, name="{}_bs_seq".format(self.cache))[0]
            # 遍历每一帧，复制self.cache为cache_frame$，并为temp_obj创建blendshape
            blendshape_node = cmds.blendShape(temp_obj, origin='world')[0]
            
            print(blendshape_node)

            for frame in range(int(start_frame), int(end_frame) + 1):
                # 设置当前帧
                cmds.currentTime(frame)                
                # 复制self.cache为cache_frame$
                cache_frame = cmds.duplicate(self.cache, name=f"cache_frame{frame}")[0]
                
                # 添加每一帧的cache_frame到blendshape
                cmds.blendShape(blendshape_node, edit=True, t=(temp_obj, frame - int(start_frame), cache_frame, 1.0))
                
                # 设置当前帧的权重为1，其他帧的权重为0
                for i in range(int(start_frame), int(end_frame) + 1):
                    weight = 1.0 if i == frame else 0.0
                    cmds.setKeyframe(blendshape_node, attribute="w[{}]".format(i - int(start_frame)), value=weight, t=frame)
                cmds.delete(cache_frame)
              
            cmds.currentTime(start_frame)
            cmds.select(cl=True)
            self.root_jnt = cmds.joint(n="root_fbx_jnt")
            cmds.select(temp_obj,self.root_jnt)
            mel.eval("SmoothBindSkin;")
    
    
    @Slot()
    def changeToDemBonesHelpText(self):        
        self.ui.label.setText(u"调用Dembone来用骨骼蒙皮模拟缓存")
        self.ui.label_2.setText(u"1.选择Alembic缓存物体")
        self.ui.label_3.setText(u"2.选择带骨骼绑定的模型")
        self.ui.label_8.setText(u"3.指定输出fbx文件")

    @Slot()
    def changeToOneJointHelpText(self):        
        self.ui.label.setText(u"为每一个顶点创建一个骨骼并烘焙动画")
        self.ui.label_2.setText(u"1.选择Alembic缓存物体")
        self.ui.label_3.setText(u"")
        self.ui.label_8.setText(u"")

    @Slot()
    def changeToBSSeqHelpText(self):        
        self.ui.label.setText(u"创建一个BS序列并烘焙动画")
        self.ui.label_2.setText(u"1.选择Alembic缓存物体")
        self.ui.label_3.setText(u"")
        self.ui.label_8.setText(u"")






        


'''
rem Skinning decompsition to generate bone transformations and skinning weights from input meshes sequence 自动添加骨骼
call "../bin/Windows/DemBones.exe" -i="Bone_Geom.fbx" -a="Bone_Anim.abc" -b=5 -o="Decomposition_05.fbx"
call "../bin/Windows/DemBones.exe" -i="Bone_Geom.fbx" -a="Bone_Anim.abc" -b=10 -o="Decomposition_10.fbx"
call "../bin/Windows/DemBones.exe" -i="Bone_Geom.fbx" -a="Bone_Anim.abc" -b=20 -o="Decomposition_20.fbx"

rem Joint grouping  自动父子关系骨骼
call "../bin/Windows/DemBones.exe" -i="Bone_Geom.fbx" -a="Bone_Anim.abc" -b=20 --bindUpdate=2 -o="Decomposition_20_grouped.fbx"

rem Solve skinning weights from input meshes sequence and input bone transformations  #nTransIters=0： 锁住位置。只动权重
call "../bin/Windows/DemBones.exe" -i="Bone_Trans.fbx" -a="Bone_Anim.abc" --nTransIters=0 -o="SolvedWeights.fbx"

rem Solve bone transformations from input meshes sequence and input skinning weights #nWeightsIters=0： 锁住权重。只动位置
call "../bin/Windows/DemBones.exe" -i="Bone_Skin.fbx" -a="Bone_Anim.abc" --nWeightsIters=0 -o="SolvedTransformations.fbx"

rem Optimize given bone transformations and skinning weights from input meshes sequence  #bindUpdate=1 是用来优化初始位置的
call "../bin/Windows/DemBones.exe" -i="Bone_All.fbx" -a="Bone_Anim.abc" --bindUpdate=1 -o="Optimized.fbx"

rem Only solve helper bones using demLock attribute of the joints
call "../bin/Windows/DemBones.exe" -i="Bone_Helpers.fbx" -a="Bone_Anim.abc" --bindUpdate=1 -o="SolvedHelpers.fbx"

rem Partially solve skinning weights using per-vertex color attribute of the mesh
call "../bin/Windows/DemBones.exe" -i="Bone_PartiallySkinned.fbx" -a="Bone_Anim.abc" --nTransIters=0 -o="SolvedPartialWeights.fbx"

====================


USAGE: 

   DemBones      -a=<filename> ...  -i=<filename> ...  -o=<filename> ... 
                 [-b=<int>] [--nInitIters=<int>] [-n=<int>]
                 [--tolerance=<double>] [--patience=<int>]
                 [--nTransIters=<int>] [--bindUpdate=<int>]
                 [--transAffine=<double>] [--transAffineNorm=<double>]
                 [--nWeightsIters=<int>] [-z=<int>]
                 [--weightsSmooth=<double>] [--weightsSmoothStep=<double>]
                 [--dbg=<int>] [--log=<filename>] [--] [--version] [-h]


Where: 

   -a=<filename>,  --abc=<filename>  (accepted multiple times)
     (required)  animated mesh sequences (alembic geometry cache files)

   -i=<filename>,  --init=<filename>  (accepted multiple times)
     (required)  rest pose/init skin clusters (fbx files), each file
     correspond to one abc file

   -o=<filename>,  --out=<filename>  (accepted multiple times)
     (required)  output (fbx files), each outut correspond to one abc file

   -b=<int>,  --nBones=<int>
     number of bones

   --nInitIters=<int>
     number iterations per init cluster splitting

   -n=<int>,  --nIters=<int>
     number of global iterations

   --tolerance=<double>
     convergence tolerance, stop if error relatively reduces less than
     [--tolerance] in [--patience] consecutive iterations

   --patience=<int>
     convergence patience, stop if error relatively reduces less than
     [--tolerance] in [--patience] consecutive iterations

   --nTransIters=<int>
     number of transformation update iterations per global iteration

   --bindUpdate=<int>
     update bind pose (0=no update, 1=update joint positions, 2=regroup
     joints under one root)

   --transAffine=<double>
     bone translations affinity soft constraint

   --transAffineNorm=<double>
     p-Norm for bone translations affinity

   --nWeightsIters=<int>
     number of weights update iterations per global iteration

   -z=<int>,  --nnz=<int>
     number of non-zero weights per vertex

   --weightsSmooth=<double>
     weights smoothness soft constraint

   --weightsSmoothStep=<double>
     step size for the weights smoothness

   --dbg=<int>
     debug level

   --log=<filename>
     log file name

   --,  --ignore_rest
     Ignores the rest of the labeled arguments following this flag.

   --version
     Displays version information and exits.

   -h,  --help
     Displays usage information and exits.


   Dem Bones - (c) Electronic Arts 2019

   - This tool only handles clean input data, i.e. only one piece of
   geometry with one skinCluster and no excessive joint.

   - To hard-lock the transformations of bones: in the input fbx files,
   create bool attributes for joint nodes (bones) with name "demLock" and
   set the value to "true".

   - To soft-lock skinning weights of vertices: in the input fbx files,
   paint per-vertex colors in gray-scale. The closer the color to white,
   the more skinning weights of the vertex are preserved.


https://www.sidefx.com/docs/houdini/nodes/out/dembones_skinningconverter.html
'''