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

class MX_AssetTools(QWidget):

    def __init__(self,root_path):
        
        super(MX_AssetTools,self).__init__()
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()
        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier
               
                
        for widget in self.mayaMainWindow.children():
            if widget.objectName() == 'AssetTools':
                # close the child window                
                widget.close()
                widget.deleteLater()
                break
        
        #Set the object name     
        self.setObjectName('AssetTools')
        self.setWindowTitle('AssetTools')

        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window)

        self.root_path = root_path


    def initUI(self):       
        
        loader = QUiLoader()
        file = QFile(self.root_path+"/mx_asset_tools.ui")
        file.open(QFile.ReadOnly) 
        self.ui = loader.load(file, parentWidget=self)
        file.close()

        
        # 设置窗口标志，只保留关闭按钮
        self.setWindowFlags(Qt.Window | Qt.WindowCloseButtonHint)

        # Call function if user click button
        self.ui.pushButton_1.clicked.connect(self.poly_haven)
        self.ui.pushButton_2.clicked.connect(self.texture_haven)

        self.ui.pushButton_4.clicked.connect(self.reduce_mesh)

        self.ui.pushButton_5.clicked.connect(self.move_vtx)
        self.ui.pushButton_6.clicked.connect(self.multi_loop_to_curve)
        self.ui.pushButton_7.clicked.connect(self.separate_by_mtl)
        self.ui.pushButton_8.clicked.connect(self.mov_uv_to_first)
        
        self.ui.pushButton_9.clicked.connect(self.grow_ring)
        self.ui.pushButton_10.clicked.connect(self.transfer_uv)

        self.show()



    @Slot()
    def poly_haven(self):
        
        unload_pkgs.unload_packages(True, ['assets.scripts.mx_poly_haven.MX_PolyHaven'])

        from asset.scripts import mx_poly_haven
        ph = mx_poly_haven.MX_PolyHaven(os.path.join(self.root_path,"assets"))

    @Slot()
    def texture_haven(self):
        
        unload_pkgs.unload_packages(True, ['assets.scripts.mx_texture_haven.MX_TextureHaven'])

        from asset.scripts import mx_texture_haven
        th = mx_texture_haven.MX_TextureHaven(os.path.join(self.root_path,"assets"))    

    @Slot()
    def reduce_mesh(self):
        from asset.scripts import mx_reduce_mesh
        mx_reduce_mesh.reduce_mesh()
    
    @Slot()
    def move_vtx(self):
        from asset.scripts import mx_move_vtx
        mx_move_vtx.move_vtx()
    
    @Slot()
    def multi_loop_to_curve(self):
        from asset.scripts import mx_multi_loop_to_curve
        mx_multi_loop_to_curve.multi_loop_to_curve()

    @Slot()
    def separate_by_mtl(self):
        from asset.scripts import mx_separate_by_mtl
        mx_separate_by_mtl.separate_by_mtl()

    @Slot()
    def mov_uv_to_first(self):

        from asset.scripts import mx_move_uv_to_first_uv
        mx_move_uv_to_first_uv.move_uv_to_first_uv()

    @Slot()
    def grow_ring(self):

        from asset.scripts import mx_select_next_ring
        mx_select_next_ring.select_next_ring()

    @Slot()
    def transfer_uv(self):
        from asset.scripts import mx_transferUV
        mx_transferUV.transferUV()