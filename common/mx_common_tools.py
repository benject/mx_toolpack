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

class MX_CommonTools(QWidget):

    def __init__(self,root_path):
        
        super(MX_CommonTools,self).__init__()
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()
        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier
        
        for widget in self.mayaMainWindow.children():
            if widget.objectName() == 'CommonTools':
                # close the child window                
                widget.close()
                widget.deleteLater()
                break
        
        #Set the object name     
        self.setObjectName('CommonTools')
        self.setWindowTitle('CommonTools')

        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window)

        self.root_path = root_path


    def initUI(self):
        
        loader = QUiLoader()
        file = QFile(self.root_path+"/mx_common_tools.ui")
        file.open(QFile.ReadOnly) 
        self.ui = loader.load(file, parentWidget=self)
        file.close()
  
        # 设置窗口标志，只保留关闭按钮
        self.setWindowFlags(Qt.Window | Qt.WindowCloseButtonHint)

        # Call function if user click button

        self.ui.pushButton.clicked.connect(self.multi_groups)
        self.ui.pushButton_2.clicked.connect(self.scatter_on_mesh)   
        self.ui.pushButton_3.clicked.connect(self.find_same_names)
        self.ui.pushButton_4.clicked.connect(self.fix_same_names)      
        self.ui.pushButton_5.clicked.connect(self.fix_viewport)     
        self.ui.pushButton_6.clicked.connect(self.multi_align)
        self.ui.pushButton_7.clicked.connect(self.save_info)
        self.ui.pushButton_8.clicked.connect(self.swap_name)
        self.ui.pushButton_9.clicked.connect(self.dup_alone_curve)
        self.ui.pushButton_10.clicked.connect(self.fix_nopoly)
        self.ui.pushButton_11.clicked.connect(self.selection)
        self.ui.pushButton_12.clicked.connect(self.fix_tex_lock)
        self.ui.pushButton_13.clicked.connect(self.allUVTile)
        self.ui.pushButton_14.clicked.connect(self.mirror_objects)
        self.ui.pushButton_15.clicked.connect(self.remove_unload_ref)
        self.ui.pushButton_16.clicked.connect(self.clear_display_layers)
        self.show()


    @Slot()
    def find_same_names(self):
        from common.scripts import mx_same_names
        mx_same_names.find_same_names()
    
    @Slot()
    def fix_same_names(self):
        from common.scripts import mx_same_names
        mx_same_names.fix_same_names()
    
    @Slot()
    def fix_viewport(self):
        from common.scripts import mx_fix_viewport
        mx_fix_viewport.fix_viewport()

    @Slot()
    def multi_groups(self):
        from common.scripts import mx_multi_groups
        mx_multi_groups.multi_groups()

    @Slot()
    def scatter_on_mesh(self):
        from common.scripts import mx_scatter_on_mesh
        mxsc = mx_scatter_on_mesh.MX_Scatter()

    @Slot()
    def multi_align(self):
        from common.scripts import mx_multi_align
        mma = mx_multi_align.MX_MultiAlign()


    @Slot()
    def save_info(self):

        mel_path =  os.path.join(self.root_path, "scripts", "mx_save_info.mel")
        mel_path = mel_path.replace("\\","/")

        mel.eval( "source " +'"' + mel_path + '"')
    
    @Slot()
    def swap_name(self):
        
        mel_path =  os.path.join(self.root_path, "scripts", "mx_swap_name.mel")
        mel_path = mel_path.replace("\\","/")

        mel.eval( "source " +'"' + mel_path + '"')
    
    @Slot()
    def dup_alone_curve(self):

        unload_pkgs.unload_packages(True, ['common.scripts.mx_dup_alone_curve'])

        from common.scripts import mx_dup_alone_curve
        mxdup = mx_dup_alone_curve.MX_DupAloneCurve()
    
    @Slot()
    def fix_nopoly(self):
        
        unload_pkgs.unload_packages(True, ['common.scripts.mx_fix_nopoly'])
        from common.scripts import mx_fix_nopoly
        mx_fix_nopoly.fix_nopoly()

    @Slot()
    def selection(self):
        
        mel_path =  os.path.join(self.root_path, "scripts", "mx_selection.mel")
        mel_path = mel_path.replace("\\","/")
        mel.eval( "source " +'"' + mel_path + '"')

    @Slot()
    def fix_tex_lock(self):
        
        unload_pkgs.unload_packages(True, ['common.scripts.mx_fix_tex_lock'])
        from common.scripts import mx_fix_tex_lock
        mx_fix_tex_lock.fix_tex_lock()
    
    @Slot()
    def mirror_objects(self):
        unload_pkgs.unload_packages(True, ['common.scripts.mx_mirror_objects'])
        from common.scripts import mx_mirror_objects
        mmo = mx_mirror_objects.MX_MirrorObjects()

    @Slot()
    def allUVTile(self):        
        unload_pkgs.unload_packages(True, ['common.scripts.mx_generate_allUV'])
        from common.scripts import mx_generate_allUV
        mx_generate_allUV.generate_allUV()

    @Slot()
    def remove_unload_ref(self):        
        unload_pkgs.unload_packages(True, ['common.scripts.mx_remove_unload_ref'])
        from common.scripts import mx_remove_unload_ref
        mx_remove_unload_ref.remove_unloaded_reference_nodes()

    @Slot()
    def clear_display_layers(self):
        unload_pkgs.unload_packages(True, ['common.scripts.mx_clear_display_layers'])
        from common.scripts import mx_clear_display_layers
        mx_clear_display_layers.clear_display_layers()
