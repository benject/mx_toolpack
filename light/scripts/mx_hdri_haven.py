# -*- coding: utf-8 -*-

import os,sys
from PySide2 import QtCore, QtGui, QtWidgets
import maya.cmds as cmds
import maya.OpenMayaUI as omui
from shiboken2 import wrapInstance


import maya.utils as utils
from functools import partial

import urllib.request
import urllib.parse
import json

import mtoa.utils as mutils


# 创建主窗口
class MX_HdriHaven(QtWidgets.QDialog):
    def __init__(self,asset_path):

        super(MX_HdriHaven, self).__init__()
        # 获取Maya主窗口的指针
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()

        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QtWidgets.QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QtWidgets.QWidget)  #for maya2020 and earlier     
              
        # 检查窗口是否存在
        for widget in self.mayaMainWindow.children():
            
            if widget.objectName() == "hdriHavenUI":
                widget.close()
                widget.deleteLater()
                break
                
        self.setWindowTitle("hdri haven")
        self.setObjectName("hdriHavenUI")
                
        self.asset_path = asset_path
        
        # 图像路径列表
        self.image_paths =  []

        #asset id list
        self.asset_ids = []
        
        # 创建图像列表
        self.images = []

        thumbs = os.listdir(os.path.join(self.asset_path,"thumbs"))
        
        if(len(thumbs))>0:            
            # 设置窗口最小大小
            self.setMinimumSize(900, 500)

        for thumb in thumbs:
            self.image_paths.append(os.path.join(self.asset_path,"thumbs",thumb))
            self.asset_ids.append(thumb.split(".")[0])         

        for path in self.image_paths:            
            image = QtGui.QPixmap(path)
            image = image.scaledToWidth(147)
            self.images.append(image)
        
        upd_button = QtWidgets.QPushButton("update",self)                     
        upd_button.clicked.connect(self.update)
        
        # 创建图像按钮列表
        self.image_buttons = []
        for i, path in enumerate(self.image_paths):
            image = QtGui.QPixmap(path)
            image = image.scaledToWidth(147)
            button = QtWidgets.QPushButton(self)
            button.setIcon(QtGui.QIcon(image))
            button.setIconSize(QtCore.QSize(147, 110))
            button.clicked.connect(partial(self.add_to_scene, self.asset_ids[i]))
            self.image_buttons.append(button)

        
        # 创建图像按钮网格
        self.layout = QtWidgets.QGridLayout(self)
        

        # 添加垂直滚动条
        if len(self.image_buttons) > 15:
            scroll_area = QtWidgets.QScrollArea(self)
            scroll_area.setWidgetResizable(True)
            
            scroll_widget = QtWidgets.QWidget()
            scroll_layout = QtWidgets.QGridLayout(scroll_widget)            
            scroll_layout.addWidget(upd_button, 0, 4, 1, 1)  # 添加顶部按钮到第一行
            for i in range(len(self.image_buttons)):
                row = i // 5 + 2
                col = i % 5
                scroll_layout.addWidget(self.image_buttons[i], row, col)
            
            
            scroll_area.setWidget(scroll_widget)
            self.layout.addWidget(scroll_area, 1, 0, 1, 1)
            
        else:

            self.layout.addWidget(upd_button, 0, 4, 1, 1)  # 添加顶部按钮到第一行
            
            row_count = len(self.image_paths)//5 + 2
        
            for i in range(1, row_count):
                for j in range(5): #每行5列
                    index = (i - 1) * 5 + j
                    if index < len(self.image_buttons):
                        self.layout.addWidget(self.image_buttons[index], i, j)

        
        self.setLayout(self.layout)
        self.show()
        

    def add_to_scene(self,asset_id):
        """
        download the hdri from polyhaven
        """

        headers = {'User-Agent':'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'}  
        requests = urllib.request.Request("https://api.polyhaven.com/files/{}".format(asset_id),headers=headers)

        response = urllib.request.urlopen(requests) #get hdri info

        content = json.loads(response.read().decode())

        hdri_url = content["hdri"]["8k"]["hdr"]["url"]

        
        project_path = cmds.workspace( q=True, rd=True)
        source_image_path = os.path.join(project_path,"sourceimages")
        if not os.path.exists(source_image_path):
            os.mkdir(source_image_path)        

        hdri_path = os.path.join(source_image_path,"{0}.hdr".format(asset_id)) #download to project source image
        
        if not os.path.exists(hdri_path):
            self.download(hdri_path, hdri_url)
        
        light = mutils.createLocator("aiSkyDomeLight", asLight=True)
        file_node = cmds.shadingNode("file", name="fileTexture", asTexture=True)

        cmds.connectAttr("{}.outColor".format(file_node), "{}.color".format(light[0]), f=True)
        cmds.setAttr("{}.fileTextureName".format(file_node), hdri_path, type="string")
        
        
    def download(self, file_path, url):

        if not (os.path.exists(file_path)): #download
                
            print("downloading {}".format(file_path))

            headers = {'User-Agent':'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'}  
            requests = urllib.request.Request(url,headers=headers)
            img_data = urllib.request.urlopen(requests)
            

            with open(file_path, "wb") as handler:
                handler.write(img_data.read())
        
        
    def update(self):

        self.image_paths.clear()
        self.asset_ids.clear()

        #use header to avoid 403 error
        headers = {'User-Agent':'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'}  

        kw = {'type':'textures'}
        requests = urllib.request.Request('https://api.polyhaven.com/assets'+'?'+ urllib.parse.urlencode(kw),headers=headers)
        response = urllib.request.urlopen(requests)

        content = json.loads(response.read().decode())


        for key in content.keys():

            thumb_path = os.path.join(self.asset_path,"thumbs/{}.png".format(key))
            
            thumb_url = "https://cdn.polyhaven.com/asset_img/thumbs/{}.png?height=110".format(key)       # get thumb

            self.download(key, thumb_path, thumb_url)                           
                
            self.image_paths.append(thumb_path)
            self.asset_ids.append(key)
        
        new_win = MX_HdriHaven(self.asset_path) 
