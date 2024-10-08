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

class MX_LightTools(QWidget):

    def __init__(self,root_path):
        
        super(MX_LightTools,self).__init__()
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()
        
        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier
        
        for widget in self.mayaMainWindow.children():
            if widget.objectName() == 'LightTools':
                # close the child window                
                widget.close()
                widget.deleteLater()
                break
        #Set the object name     
        self.setObjectName('LightTools')
        self.setWindowTitle('LightTools')

        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window)

        self.root_path = root_path


    def initUI(self):
        loader = QUiLoader()
        file = QFile(self.root_path+"/mx_light_tools.ui")
        file.open(QFile.ReadOnly) 
        self.ui = loader.load(file, parentWidget=self)
        file.close()


        # Call function if user click button
        
        self.ui.pushButton.clicked.connect(self.hdri_haven)

        self.show()



    @Slot()

    def hdri_haven(self):
        
        unload_pkgs.unload_packages(True, ['light.scripts.mx_hdri_haven.MX_HdriHaven'])

        from light.scripts import mx_hdri_haven
        hh = mx_hdri_haven.MX_HdriHaven(os.path.join(self.root_path,"assets"))

