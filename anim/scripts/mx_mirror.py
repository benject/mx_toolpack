#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys,os
import maya.cmds as cmds


# for ui
from maya import OpenMayaUI as omui 
from PySide2.QtCore import * 
from PySide2.QtGui import *
from PySide2.QtWidgets import *
from PySide2.QtUiTools import QUiLoader

from shiboken2 import wrapInstance 
import subprocess


class MX_Mirror(QWidget): 
    
    def __init__(self,root_path, *args, **kwargs):        
        super(MX_Mirror, self).__init__(*args, **kwargs)

        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()

        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier

        # 检查窗口是否存在
        for widget in self.mayaMainWindow.children():            
            if widget.objectName() == "MirrorUI":
                widget.close()
                widget.deleteLater()
                break

        #Set the object name     
        self.setObjectName('MirrorUI')
        self.setWindowTitle('MirrorUI')

        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window)

        self.root_path = root_path


    def initUI(self):
        
        loader = QUiLoader()
        file = QFile(self.root_path+"/mx_mirror.ui")
        file.open(QFile.ReadOnly) 
        self.ui = loader.load(file, parentWidget=self)
        file.close()

        #connect to video to face
        self.ui.pushButton.clicked.connect( self.video_to_json)
        
        #connect to speech to face
        self.ui.pushButton_2.clicked.connect( self.speech_to_face)
        self.ui.pushButton_4.clicked.connect(self.json_to_face)        
        self.ui.pushButton_5.clicked.connect(self.select_json)


        self.show()

    @Slot()
    def video_to_json(self):     

        self.video_file  = QFileDialog().getOpenFileName(self.ui, "Video File",os.path.dirname(__file__),filter="*.mp4")[0]

        self.ui.textEdit.setPlainText(self.video_file)

        self.json_file = self.video_file.replace("mp4","mp4.json")

        self.ui.textEdit_3.setPlainText(self.json_file)

        cmd = os.path.join(os.path.dirname(self.root_path),"dist","facecapture","facecapture.exe")

        #print(cmd)
        subprocess.run(cmd + " -v " + self.video_file) 

    @Slot()
    def select_json(self):     

        self.json_file  = QFileDialog().getOpenFileName(self.ui, "JSON File",os.path.dirname(__file__),filter="*.json")[0]
        self.ui.textEdit_3.setPlainText(self.json_file)

    @Slot()
    def json_to_face(self):

        if (self.json_file ==""):
            cmds.warning("you must select a json file!")
            
        else:
            from anim.scripts import mx_mp_to_adv             
            mx_mp_to_adv.process(self.json_file)

    
    @Slot()
    def speech_to_face(self):
        pass