# -*- coding: utf-8 -*-

import os,sys
import maya.cmds as cmds
import maya.mel as mel

# for ui
from maya import OpenMayaUI as omui 
from PySide2.QtCore import * 
from PySide2.QtGui import *
from PySide2.QtWidgets import *

from shiboken2 import wrapInstance 

import unload_pkgs

# --- GENERATED UI CLASS START ---
class Ui_MX_CommonTools(object):
    def setupUi(self, Form):
        Form.setObjectName("CommonTools")
        # remove fixed size to allow auto expand
        # Form.resize(200, 800)
        Form.setSizePolicy(QSizePolicy(QSizePolicy.Fixed, QSizePolicy.Preferred))
        # 主布局随窗口调整
        self.layout = QVBoxLayout(Form)
        self.layout.setContentsMargins(5, 5, 5, 5)
        self.layout.setSpacing(5)

        # 通用控件样式
        btn_font = QFont("Arial", 9)
        btn_policy = QSizePolicy(QSizePolicy.Expanding, QSizePolicy.Preferred)
        lbl_font = QFont("Arial", 9)
        lbl_font.setBold(True)

        # UI 项目顺序：标签和按钮交替
        items = [
            ("label_2", "批量工具", True),
            ("pushButton", "批量打组", False),
            ("pushButton_2", "随机分布", False),
            ("pushButton_6", "批量对齐", False),
            ("pushButton_14", "批量镜像", False),
            ("pushButton_9", "沿曲线复制", False),
            ("label_3", "常用工具", True),
            ("pushButton_3", "查找重名", False),
            ("pushButton_4", "修复重名", False),
            ("pushButton_5", "修复弹窗", False),
            ("pushButton_10", "修复模型消失", False),
            ("label_4", "选择工具", True),
            ("pushButton_11", "选择工具集", False),
            ("pushButton_12", "修复材质锁", False),
            ("pushButton_13", "全贴图显示", False),
            ("label", "场景优化", True),
            ("pushButton_7", "保存信息到文件", False),
            ("pushButton_8", "互换名字", False),
            ("pushButton_15", "移除未加载引用", False),
            ("pushButton_16", "清除显示层", False)
        ]
        for name, text, is_label in items:
            if is_label:
                lbl = QLabel(text, Form)
                lbl.setAlignment(Qt.AlignCenter)
                lbl.setFont(lbl_font)
                self.layout.addWidget(lbl)
                setattr(self, name, lbl)
            else:
                btn = QPushButton(text, Form)
                btn.setObjectName(name)
                btn.setFont(btn_font)
                btn.setSizePolicy(btn_policy)
                self.layout.addWidget(btn)
                setattr(self, name, btn)

        # 推挤按钮到顶部
        self.layout.addStretch()
        # 自动调整窗口高度以适应内容
        Form.adjustSize()

    def retranslateUi(self, Form):
        pass
# --- GENERATED UI CLASS END ---

class MX_CommonTools(QWidget):
    def __init__(self, root_path):
        super(MX_CommonTools, self).__init__()
        ptr = omui.MQtUtil.mainWindow()
        self.mayaMainWindow = wrapInstance(int(ptr), QWidget) if sys.version_info[0] >= 3 else wrapInstance(long(ptr), QWidget)
        for w in self.mayaMainWindow.children():
            if w.objectName() == 'CommonTools':
                w.close(); w.deleteLater(); break
        self.setParent(self.mayaMainWindow)
        self.setWindowFlags(Qt.Window)
        self.setObjectName('CommonTools')
        self.setWindowTitle('CommonTools')
        self.root_path = root_path

        # 初始化 UI
        self.initUI()
        self.setWindowFlags(Qt.Window | Qt.WindowCloseButtonHint)

        # 信号槽连接
        ui = self.ui
        ui.pushButton.clicked.connect(self.multi_groups)
        ui.pushButton_2.clicked.connect(self.scatter_on_mesh)
        ui.pushButton_3.clicked.connect(self.find_same_names)
        ui.pushButton_4.clicked.connect(self.fix_same_names)
        ui.pushButton_5.clicked.connect(self.fix_viewport)
        ui.pushButton_6.clicked.connect(self.multi_align)
        ui.pushButton_7.clicked.connect(self.save_info)
        ui.pushButton_8.clicked.connect(self.swap_name)
        ui.pushButton_9.clicked.connect(self.dup_alone_curve)
        ui.pushButton_10.clicked.connect(self.fix_nopoly)
        ui.pushButton_11.clicked.connect(self.selection)
        ui.pushButton_12.clicked.connect(self.fix_tex_lock)
        ui.pushButton_13.clicked.connect(self.allUVTile)
        ui.pushButton_14.clicked.connect(self.mirror_objects)
        ui.pushButton_15.clicked.connect(self.remove_unload_ref)
        ui.pushButton_16.clicked.connect(self.clear_display_layers)

        self.show()

    def initUI(self):
        """
        初始化界面：应用生成的 UI 布局。
        """
        self.ui = Ui_MX_CommonTools()
        self.ui.setupUi(self)

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
