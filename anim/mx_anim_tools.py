# -*- coding: utf-8 -*-

import os,sys
import maya.cmds as cmds
import maya.mel as mel

# for ui
from maya import OpenMayaUI as omui 
from PySide2.QtCore import * 
from PySide2.QtGui import *
from PySide2.QtWidgets import *
from PySide2.QtUiTools import QUiLoader

from shiboken2 import wrapInstance 

import unload_pkgs

#========== class defination

class MX_AnimTools(QWidget):

    def __init__(self,root_path):
        
        super(MX_AnimTools,self).__init__()
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()
        
        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier

        # 检查窗口是否存在
        for widget in self.mayaMainWindow.children():            
            if widget.objectName() == "AnimTools":
                widget.close()
                widget.deleteLater()
                break
                
        #Set the object name     
        self.setObjectName('AnimTools')
        self.setWindowTitle('AnimTools')

        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window | Qt.WindowCloseButtonHint)

        self.root_path = root_path


    def initUI(self):
        loader = QUiLoader()
        file = QFile(self.root_path+"/mx_anim_tools.ui")
        file.open(QFile.ReadOnly) 
        self.ui = loader.load(file, parentWidget=self)
        file.close()

        # Call function if user click button
        self.ui.pushButton_1.clicked.connect(self.mirror)
        self.ui.pushButton_2.clicked.connect(self.a2f_to_mh)
        self.ui.pushButton_3.clicked.connect(self.a2f_to_adv)

        self.ui.pushButton_6.clicked.connect(self.auto_walk)
        self.ui.pushButton_4.clicked.connect(self.delay_anim)
        
        self.ui.pushButton_7.clicked.connect(self.bake_mesh)

        self.show()


    @Slot()
    def mirror(self):

        unload_pkgs.unload_packages(True, ['anim.scripts.mx_mirror'])
        from anim.scripts import mx_mirror 
        mir = mx_mirror.MX_Mirror(os.path.join(self.root_path,"scripts"))
        mir.initUI()

    
    @Slot()
    def auto_walk(self):

        mel_path =  os.path.join(self.root_path, "scripts", "mx_auto_walk.mel")
        mel_path = mel_path.replace("\\","/")
        mel.eval( "source " +'"' + mel_path + '"')

    
    @Slot()
    def delay_anim(self):
        mel_path =  os.path.join(self.root_path, "scripts", "mx_delay_animation.mel")
        mel_path = mel_path.replace("\\","/")
        mel.eval( "source " +'"' + mel_path + '"')


    @Slot()
    def a2f_to_mh(self):

        bs_weight_filename  = QFileDialog().getOpenFileName(self.ui, "BS Weight File",r"C:/",filter="*.json")[0]

        print( bs_weight_filename )
        from anim.scripts import mx_a2f_to_mh
        mx_a2f_to_mh.process(bs_weight_filename)


    @Slot()
    def a2f_to_adv(self):
        '''
        select any ctrl of character 
        '''

        bs_weight_filename  = QFileDialog().getOpenFileName(self.ui, "BS Weight File",r"C:/",filter="*.json")[0]
        print( bs_weight_filename )
        from anim.scripts import mx_a2f_to_adv
        mx_a2f_to_adv.process(bs_weight_filename)
    

        
    @Slot()
    def bake_mesh(self):

        unload_pkgs.unload_packages(True,['anim.scripts.mx_bake_mesh'])
        from anim.scripts import mx_bake_mesh
        bm = mx_bake_mesh.MX_BakeMesh(os.path.join(self.root_path,"scripts"))
        bm.initUI()
