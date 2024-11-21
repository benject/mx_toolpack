# -*- coding: utf-8 -*-

import os,sys
import json
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

class MX_Settings(QWidget):

    def __init__(self,root_path):
        
        super(MX_Settings,self).__init__()
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()

        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier
        
        
        for widget in self.mayaMainWindow.children():
            if widget.objectName() == 'Settings':
                # close the child window                
                widget.close()
                widget.deleteLater()
                break
        

        #Set the object name     
        self.setObjectName('Settings')
        self.setWindowTitle('Settings')

        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window)

        self.root_path = root_path

        #load settings
        self.settings = {}



    def initUI(self):
        
        loader = QUiLoader()
        file = QFile(self.root_path+"/mx_settings.ui")
        file.open(QFile.ReadOnly) 
        self.ui = loader.load(file, parentWidget=self)
        file.close()
  
        # 设置窗口标志，只保留关闭按钮
        self.setWindowFlags(Qt.Window | Qt.WindowCloseButtonHint)

        # Call function if user click button

        self.ui.pushButton.clicked.connect(self.show_about)
        self.ui.pushButton_2.clicked.connect(self.browse_comfyui)
        self.ui.pushButton_3.clicked.connect(self.save_settings)

        self.loadSettings()
 
        self.show()

    def loadSettings(self):
        
        #load settings 
        self.settings_file = os.path.join(self.root_path,"mx_settings.json")
        
        if not (os.path.exists(self.settings_file)):
            pass
        else:
            with open(self.settings_file,'r') as f:
                
                self.settings = json.load(f)

                # 获取 comfyui_dir，如果不存在则返回默认值或提示
                comfyui_dir = self.settings.get("comfyui_dir", None)  # 使用字典的 get 方法
                
                if comfyui_dir:                    
                    self.ui.lineEdit.setText(comfyui_dir)
                else:
                    print("comfyui_dir not found in settings.")
                    return None


    def show_about(self):

        pass

    def browse_comfyui(self):

        folder = QFileDialog.getExistingDirectory(
            self.mayaMainWindow,
            "Select Folder",  # 窗口标题
            self.root_path,  # 初始路径
            QFileDialog.ShowDirsOnly  # 只显示文件夹
        )
        
        if folder:  # 如果用户选择了文件夹
            print("Selected folder:", folder)
            self.ui.lineEdit.setText(folder)
        else:  # 如果用户取消了选择
            print("No folder selected.")

    def save_settings(self):
        '''save settings'''

        self.settings["comfyui_dir"] = self.ui.lineEdit.text()
        
        with open(self.settings_file, 'w', encoding='utf-8') as f:

            json.dump(self.settings, f, indent=4)
