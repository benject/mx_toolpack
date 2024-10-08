# -*- coding: utf-8 -*-

import os,sys
import re
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

class MX_RenderTools(QWidget):

    def __init__(self,root_path):
        
        super(MX_RenderTools,self).__init__()
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()
        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier
        #Set the object name     
        self.setObjectName('RenderTools')
        self.setWindowTitle('RenderTools')

        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window)

        self.root_path = root_path


    def initUI(self):
        
        children = self.mayaMainWindow.children()
        for child in children:
            if child.objectName() == 'RenderTools':
                # close the child window                
                child.close()
        
        
        loader = QUiLoader()
        file = QFile(self.root_path+"/mx_render_tools.ui")
        file.open(QFile.ReadOnly) 
        self.ui = loader.load(file, parentWidget=self)
        file.close()


        # Call function if user click button
        self.ui.pushButton.clicked.connect( self.megascan_to_prman )
        self.ui.pushButton_2.clicked.connect(self.handle_rib)
        self.show()

    @Slot()
    def megascan_to_prman(self):

        unload_pkgs.unload_packages(True, ['render.scripts.ms_to_prman'])
        from render.scripts import ms_to_prman        
        m2r = ms_to_prman.MX_M2R()
        m2r.initUI(os.path.join(self.root_path,"scripts"))
        
    @Slot()
    def handle_rib(self):

        unload_pkgs.unload_packages(True, ['render.scripts.handle_rib'])
        from render.scripts import handle_rib 
        rh = handle_rib.MX_HANDLE_RIB()
        rh.initUI(os.path.join(self.root_path,"scripts"))
