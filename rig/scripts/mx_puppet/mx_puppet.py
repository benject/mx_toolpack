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

class MX_Puppet(QWidget):

    def __init__(self,root_path):
        
        super(MX_Puppet,self).__init__()
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()

        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier
        

        #Set the object name     
        self.setObjectName('Puppet')
        self.setWindowTitle('Puppet')

        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window)

        # 设置窗口标志，只保留关闭按钮
        self.setWindowFlags(Qt.Window | Qt.WindowCloseButtonHint)

        self.root_path = root_path



    def initUI(self):

        print(self.root_path)
        
        children = self.mayaMainWindow.children()
        for child in children:
            if child.objectName() == 'Puppet':
                # close the child window                
                child.close()        
        
        loader = QUiLoader()
        file = QFile(self.root_path+"/mx_puppet.ui")
        file.open(QFile.ReadOnly) 
        self.ui = loader.load(file, parentWidget=self)
        file.close()

        # Call function if user click button
        self.ui.pushButton_2.clicked.connect(self.tentacle_rig)
        self.ui.pushButton_3.clicked.connect(self.tank_rig )
        self.ui.pushButton_4.clicked.connect(self.belt_rig)
        self.ui.pushButton_5.clicked.connect(self.spring_rig)     
        self.ui.pushButton_6.clicked.connect(self.import_humanbody)
        
        self.show()

    @Slot()
    def tentacle_rig(self):
        unload_pkgs.unload_packages(True, ['rig.scripts.mx_puppet.tentacle_rig'])
        from rig.scripts.mx_puppet import mx_tentacle_rig
        ttr = mx_tentacle_rig.MX_TentacleRig()

    @Slot()
    def tank_rig(self):

        unload_pkgs.unload_packages(True, ['rig.scripts.mx_puppet.tank_rig'])
        from rig.scripts.mx_puppet import mx_tank_rig
        tr = mx_tank_rig.MX_TankRig()

    @Slot()
    def belt_rig(self):
        
        unload_pkgs.unload_packages(True, ['rig.scripts.mx_puppet.belt_rig'])
        from rig.scripts.mx_puppet import mx_belt_rig
        br = mx_belt_rig.MX_BeltRig()
    
    @Slot()
    def spring_rig(self):
        
        unload_pkgs.unload_packages(True, ['rig.scripts.mx_puppet.mx_spring_rig'])
        from rig.scripts.mx_puppet import mx_spring_rig 
        sr = mx_spring_rig.MX_SpringRig()
        

    
    @Slot()
    def import_humanbody(self):

        mel_path =  os.path.join(self.root_path, "mx_import_humanbody.mel")
        mel_path = mel_path.replace("\\","/")
        mel.eval( "source " +'"' + mel_path + '"')