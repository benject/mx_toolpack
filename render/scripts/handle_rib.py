#!/usr/bin/python
# -*- coding: utf-8 -*-

import os,sys
import maya.cmds as cmds
import maya.utils as utils
import rfm2.api.nodes

# for ui
from maya import OpenMayaUI as omui 
from PySide2.QtCore import * 
from PySide2.QtGui import *
from PySide2.QtWidgets import *
from PySide2.QtUiTools import QUiLoader

from shiboken2 import wrapInstance 


#=================== install function

def onMayaDroppedPythonFile(obj):

    sys_path = os.path.abspath(os.path.join(os.path.dirname( __file__ ), '..')) 
    sys.path.append(sys_path) #install this mod to maya
    

class MX_HANDLE_RIB(QWidget): 

    def __init__(self):
        super(MX_HANDLE_RIB,self).__init__()

        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()
        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier

        #Set the object name     
        self.setObjectName('RIB_HANDLE_UI')
        self.setWindowTitle('RIB_HANDLE_UI')

        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window)

    def initUI(self,root_path):
        loader = QUiLoader()
        file = QFile(root_path+"/handle_rib_ui.ui")
        file.open(QFile.ReadOnly) 
        self.ui = loader.load(file, parentWidget=self)
        file.close()

        # Call anaylse if user click 'analyse' button
        self.ui.pushButton_2.clicked.connect( self.export_rib )
        
        # Call process if user clicks 'replace' button
        self.ui.pushButton_3.clicked.connect( self.import_rib )

        self.show()

    @Slot()
    def export_rib(self,file_name):

        file_path = QFileDialog.getExistingDirectory()

        objs = cmds.ls(sl=True)

        for obj in objs:

            cmds.select(cl=True)
            cmds.select(obj)
        
            file_name = os.path.join(file_path,obj)            
            cmds.file ( file_name ,force=True, options =   "rmanExportRIBFormat=1;rmanExportMultipleFrames=0;rmanExportStartFrame=1;rmanExportEndFrame=10;rmanExportByFrame=1;rmanExportRIBArchive=1;rmanExportRIBOmitDefaultedAttributes=0;rmanExportRIBCamera=persp" ,
                        typ = "RIB" ,pr = True, es = True )
        
    @Slot()
    def import_rib(self):

        file_names,file_type = QFileDialog.getOpenFileNames(self,"select rib files",os.path.curdir,"RIB Files (*.rib)")

        print(file_names)

        if len(file_names)>0 :
            for file_name in file_names:
                rfm2.api.nodes.import_archive(file_name)

