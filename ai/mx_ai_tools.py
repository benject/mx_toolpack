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

class MX_AITools(QWidget):

    def __init__(self,root_path):
        
        super(MX_AITools,self).__init__()
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()
        
        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier

        # 检查窗口是否存在
        for widget in self.mayaMainWindow.children():            
            if widget.objectName() == "AITools":
                widget.close()
                widget.deleteLater()
                break
                
        #Set the object name     
        self.setObjectName('AITools')
        self.setWindowTitle('AITools')

        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window)

        self.root_path = root_path


    def initUI(self):
        loader = QUiLoader()
        file = QFile(self.root_path+"/mx_ai_tools.ui")
        file.open(QFile.ReadOnly) 
        self.ui = loader.load(file, parentWidget=self)
        file.close()

        # Call function if user click button
        self.ui.pushButton_1.clicked.connect(self.ai_agent)
        self.ui.pushButton_2.clicked.connect(self.aigc)


        self.show()

    @Slot()
    def ai_agent(self):

        pass

    @Slot()

    def aigc(self):

        unload_pkgs.unload_packages(True, ['ai.scripts.mx_maya_aigc'])
        from ai.scripts import mx_maya_aigc
        mma = mx_maya_aigc.MX_MayaAIGC()
        mma.initUI()