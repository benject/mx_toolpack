# -*- coding: utf-8 -*-

import os,sys
import maya.cmds as cmds
import maya.mel as mel

# for ui
from maya import OpenMayaUI as omui 
from PySide2.QtCore import * 
from PySide2.QtGui import *
from PySide2.QtWidgets import *
## QUiLoader not needed after switching to programmatic UI

from shiboken2 import wrapInstance 

import unload_pkgs

# --- GENERATED UI CLASS START ---
class Ui_MX_AssetTools(object):
    def setupUi(self, Form):
        Form.setObjectName("AssetTools")
        Form.setSizePolicy(QSizePolicy(QSizePolicy.Fixed, QSizePolicy.Preferred))

        self.layout = QVBoxLayout(Form)
        self.layout.setContentsMargins(5, 5, 5, 5)
        self.layout.setSpacing(5)

        btn_font = QFont("Arial", 9)
        btn_policy = QSizePolicy(QSizePolicy.Expanding, QSizePolicy.Preferred)

        # 保持对象名一致，便于复用下方信号连接
        buttons = [
            ("pushButton_1", "Poly Haven"),
            ("pushButton_2", "Texture Haven"),
            ("pushButton_3", "Asset Library"),
            ("pushButton_4", "降面"),
            ("pushButton_5", "移动点"),
            ("pushButton_6", "环转曲线"),
            ("pushButton_7", "按材质分离"),
            ("pushButton_8", "UV工具"),
            ("pushButton_9", "增长选环"),
            ("pushButton_10", "Transfer UV"),
            ("pushButton_11", "Poly工具"),
        ]

        for obj_name, text in buttons:
            btn = QPushButton(text, Form)
            btn.setObjectName(obj_name)
            btn.setFont(btn_font)
            btn.setSizePolicy(btn_policy)
            self.layout.addWidget(btn)
            setattr(self, obj_name, btn)

        self.layout.addStretch()
        Form.adjustSize()

    def retranslateUi(self, Form):
        pass
# --- GENERATED UI CLASS END ---

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
        # 使用程序化 UI
        self.ui = Ui_MX_AssetTools()
        self.ui.setupUi(self)

        # 设置窗口标志，只保留关闭按钮
        self.setWindowFlags(Qt.Window | Qt.WindowCloseButtonHint)

        # Call function if user click button
        self.ui.pushButton_1.clicked.connect(self.poly_haven)
        self.ui.pushButton_2.clicked.connect(self.texture_haven)

        self.ui.pushButton_3.clicked.connect(self.asset_library)
        self.ui.pushButton_4.clicked.connect(self.reduce_mesh)

        self.ui.pushButton_5.clicked.connect(self.move_vtx)
        self.ui.pushButton_6.clicked.connect(self.multi_loop_to_curve)
        self.ui.pushButton_7.clicked.connect(self.separate_by_mtl)
        self.ui.pushButton_8.clicked.connect(self.uv_tools)
        
        self.ui.pushButton_9.clicked.connect(self.grow_ring)
        self.ui.pushButton_10.clicked.connect(self.transfer_uv)

        self.ui.pushButton_11.clicked.connect(self.poly_tools)
        self.show()



    @Slot()
    def poly_haven(self):        
        unload_pkgs.unload_packages(True, ['asset.scripts.mx_poly_haven'])
        from asset.scripts import mx_poly_haven
        ph = mx_poly_haven.MX_PolyHaven(os.path.join(self.root_path, "assets"))

    @Slot()
    def texture_haven(self):        
        unload_pkgs.unload_packages(True, ['asset.scripts.mx_texture_haven'])
        from asset.scripts import mx_texture_haven
        th = mx_texture_haven.MX_TextureHaven(os.path.join(self.root_path, "assets"))    

    @Slot()
    def asset_library(self):
        unload_pkgs.unload_packages(True, ['asset.scripts.mx_asset_library'])
        from asset.scripts import mx_asset_library
        # 保持实例引用，避免被 GC 回收导致窗口不显示或事件无效
        self._asset_library_win = mx_asset_library.MX_AssetLibrary(os.path.join(self.root_path, "assets"))

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
    def grow_ring(self):
        from asset.scripts import mx_select_next_ring
        mx_select_next_ring.select_next_ring()

    @Slot()
    def transfer_uv(self):
        from asset.scripts import mx_transferUV
        mx_transferUV.transferUV()

    @Slot()
    def uv_tools(self):
        mel_path =  os.path.join(self.root_path, "scripts", "mx_uv_tools.mel")
        mel_path = mel_path.replace("\\","/")
        mel.eval( "source " +'"' + mel_path + '"')
    
    @Slot()
    def poly_tools(self):
        mel_path =  os.path.join(self.root_path, "scripts", "mx_poly_tools.mel")
        mel_path = mel_path.replace("\\","/")
        mel.eval( "source " +'"' + mel_path + '"')