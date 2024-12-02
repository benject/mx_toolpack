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

class MX_RigTools(QWidget):

    def __init__(self,root_path):
        
        super(MX_RigTools,self).__init__()
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()

        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier
        
        
        for widget in self.mayaMainWindow.children():
            if widget.objectName() == 'RigTools':
                # close the child window                
                widget.close()
                widget.deleteLater()
                break
        

        #Set the object name     
        self.setObjectName('RigTools')
        self.setWindowTitle('RigTools')

        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window)

        self.root_path = root_path

    def initUI(self):
        
        loader = QUiLoader()
        file = QFile(self.root_path+"/mx_rig_tools.ui")
        file.open(QFile.ReadOnly) 
        self.ui = loader.load(file, parentWidget=self)
        file.close()
  
        # 设置窗口标志，只保留关闭按钮
        self.setWindowFlags(Qt.Window | Qt.WindowCloseButtonHint)

        # Call function if user click button

        self.ui.pushButton.clicked.connect(self.collide_deformer)
        self.ui.pushButton_1.clicked.connect( self.transfer_weight )
        self.ui.pushButton_2.clicked.connect( self.metahuman_motionbuilder )        
        self.ui.pushButton_3.clicked.connect(self.fit_ground)
        self.ui.pushButton_4.clicked.connect(self.create_ctrl)
        self.ui.pushButton_4.setToolTip(u"open create controller window")
        self.ui.pushButton_6.clicked.connect(self.mx_puppet)
        self.ui.pushButton_7.clicked.connect(self.create_rivet)
        self.ui.pushButton_8.clicked.connect(self.closest_point_on_surface)
        self.ui.pushButton_8.setToolTip(u"create a nurbs surface and a locator, select surface first and then locator")
        self.ui.pushButton_9.clicked.connect(self.show_hide_joint)


        self.show()


    @Slot()
    def mx_puppet(self):
        
        unload_pkgs.unload_packages(True, ['rig.scripts.mx_puppet.mx_puppet'])
        from rig.scripts.mx_puppet.mx_puppet import MX_Puppet
        puppet = MX_Puppet(self.root_path+"/scripts/mx_puppet")
        puppet.initUI()


    @Slot()
    def transfer_weight(self):
        unload_pkgs.unload_packages(True, ['rig.scripts.transfer_weight'])
        from rig.scripts import mx_transfer_weight
        mtw = mx_transfer_weight.MX_TransferWeight()

    @Slot()
    def metahuman_motionbuilder(self):
        
        unload_pkgs.unload_packages(True, ['rig.scripts.metahuman_mobu'])
        from rig.scripts import mx_metahuman_mobu
        mm = mx_metahuman_mobu.MX_MHtoMB()

    @Slot()
    def collide_deformer(self):
        
        unload_pkgs.unload_packages(True, ['rig.scripts.mx_collide_deformer'])
        from rig.scripts import mx_collide_deformer                

        mx_collide_deformer.create_collider_deformer()


    @Slot()
    def fit_ground(self):
        
        unload_pkgs.unload_packages(True, ['rig.scripts.mx_auto_fit_fit_ground'])
        from rig.scripts import mx_auto_fit_ground
        mx_auto_fit_ground.auto_fit_ground()


    @Slot()
    def create_ctrl(self):

        unload_pkgs.unload_packages(True, ['rig.scripts.mx_auto_fit_fit_ground'])
        from rig.scripts import mx_create_ctrl
        mcc = mx_create_ctrl.MX_CreateCtrl()

    @Slot()
    def create_rivet(self):

        mel_path = os.path.join(self.root_path, "scripts", "rivet.mel")
        mel_path = mel_path.replace("\\","/")

        mel.eval( "source " +'"' + mel_path + '"' )

    @Slot()
    def closest_point_on_surface(self):

        unload_pkgs.unload_packages(True, ['rig.scripts.mx_closest_locator_on_surface'])

        from rig.scripts import mx_closest_locator_on_surface
        mx_closest_locator_on_surface.closest_locator_on_surface()

    @Slot()
    def show_hide_joint(self):

        unload_pkgs.unload_packages(True,['rig.scripts.mx_show_hide_joints'])
        from rig.scripts import mx_show_hide_joints
        mx_show_hide_joints.create_ui()

