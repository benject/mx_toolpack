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

from functools import partial

import urllib.request
import urllib.parse
import json


# 创建主窗口
class MX_PolyHaven(QWidget):
    def __init__(self,asset_path):

        super(MX_PolyHaven, self).__init__()
        # 获取Maya主窗口的指针
        self.mayaMainWindowPtr = omui.MQtUtil.mainWindow()

        if(sys.version>"3"):        
            self.mayaMainWindow = wrapInstance(int(self.mayaMainWindowPtr), QWidget)  #for maya2022 and later long has been change to int
        else:
            self.mayaMainWindow = wrapInstance(long(self.mayaMainWindowPtr), QWidget)  #for maya2020 and earlier     


        #Parent widget under Maya main window        
        self.setParent(self.mayaMainWindow) 
        self.setWindowFlags(Qt.Window)

        # 检查窗口是否存在
        for widget in self.mayaMainWindow.children():
            
            if widget.objectName() == "polyHavenUI":
                widget.close()
                widget.deleteLater()
                break
                
                       
        self.setObjectName("polyHavenUI")                      
        self.setWindowTitle("poly haven")

        self.asset_path = asset_path
        
        # 图像路径列表
        self.image_paths =  []

        #asset id list
        self.asset_ids = []
        
        # 创建图像列表
        self.images = []

        thumbs = os.listdir(os.path.join(self.asset_path,"poly_thumbs"))
        
        self.setMinimumSize(200, 100)

        # 创建图像按钮列表
        
        upd_button = QPushButton("update",self)                     
        upd_button.clicked.connect(self.update)

        # 创建图像按钮网格
        self.layout = QGridLayout(self)        


        if(len(thumbs))>0:            
            # 设置窗口最小大小
            self.setMinimumSize(900, 500)

            for thumb in thumbs:
                self.image_paths.append(os.path.join(self.asset_path,"poly_thumbs",thumb))
                self.asset_ids.append(thumb.split(".")[0])         

            for path in self.image_paths:            
                image = QPixmap(path)
                image = image.scaledToWidth(147)
                self.images.append(image)

            self.image_buttons = []
            for i, path in enumerate(self.image_paths):
                image = QPixmap(path)
                image = image.scaledToWidth(147)
                button = QPushButton(self)
                button.setIcon(QIcon(image))
                button.setIconSize(QSize(147, 110))
                button.clicked.connect(partial(self.add_to_scene, self.asset_ids[i]))
                self.image_buttons.append(button)
             # 添加垂直滚动条
            if len(self.image_buttons) > 15:
                scroll_area = QScrollArea(self)
                scroll_area.setWidgetResizable(True)
                
                scroll_widget = QWidget()
                scroll_layout = QGridLayout(scroll_widget)            
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
        download the poly from polyhaven
        """

        headers = {'User-Agent':'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'}  
        requests = urllib.request.Request("https://api.polyhaven.com/files/{}".format(asset_id),headers=headers)
        print(requests.full_url)

        response = urllib.request.urlopen(requests) #get assets info

        content = json.loads(response.read().decode())

        fbx_url = content["fbx"]["4k"]["fbx"]["url"]
        
        project_path = cmds.workspace( q=True, rd=True)
        assets_path = os.path.join(project_path,"assets")

        if not os.path.exists(assets_path):
            os.mkdir(assets_path)

        fbx_path = os.path.join(assets_path,"{0}.fbx".format(asset_id)) #download to project assets folder
        
        if not os.path.exists(fbx_path):
            self.download(fbx_path, fbx_url)      

         #import
        cmds.file(fbx_path, i=True, typ="FBX", iv=True, ra=True, mnc=False, pr=True, ns="" )

        # Create an Arnold shader
        new_shader = cmds.shadingNode('aiStandardSurface', asShader=True)

        #get textures, structure is proj_path/sourceimages/asset_id/tex_4k.png
        source_image_path = os.path.join(project_path,"sourceimages")
        if not os.path.exists(source_image_path):
            os.mkdir(source_image_path)  

        for key in content.keys():
            if(key in ['blend','gltf','usd','fbx']):
                continue            

            tex_url = content[key]["4k"]["png"]["url"]
            asset_id_path = os.path.join(source_image_path,asset_id)      

            if not os.path.exists(asset_id_path):
                os.mkdir(asset_id_path)
            
            tex_path = os.path.join(asset_id_path,"{}_4k.png".format(key))            

            if not os.path.exists(tex_path):
                self.download(tex_path, tex_url)

            if(key=="Diffuse"):
                # Create a file texture node
                file_node = cmds.shadingNode('file', asTexture=True)

                place_2d = cmds.shadingNode( 'place2dTexture', asUtility =True)
                cmds.connectAttr( place_2d + ".outUV", file_node + ".uvCoord")

                # Set the filenode's texture path
                cmds.setAttr(file_node + '.fileTextureName', tex_path, type="string")
                # Connect the file texture to the base color attribute of the shader
                cmds.connectAttr(file_node + '.outColor', new_shader + '.baseColor')

            if(key=="Rough"):
                # Create a file texture node
                file_node = cmds.shadingNode('file', asTexture=True)

                place_2d = cmds.shadingNode( 'place2dTexture', asUtility =True)
                cmds.connectAttr( place_2d + ".outUV", file_node + ".uvCoord")

                # Set the filenode's texture path
                cmds.setAttr(file_node + '.fileTextureName', tex_path, type="string")
                cmds.setAttr(file_node + '.colorSpace', 'Raw', type="string")
                # Connect the file texture to the roughness color attribute of the shader
                cmds.connectAttr(file_node + '.outColorR', new_shader + '.specularRoughness')
                
            if(key=="spec"):                   
                # Create a file texture node
                file_node = cmds.shadingNode('file', asTexture=True)

                place_2d = cmds.shadingNode( 'place2dTexture', asUtility =True)
                cmds.connectAttr( place_2d + ".outUV", file_node + ".uvCoord")

                # Set the filenode's texture path
                cmds.setAttr(file_node + '.fileTextureName', tex_path, type="string")
                cmds.setAttr(file_node + '.colorSpace', 'Raw', type="string")
                cmds.connectAttr(file_node + '.outColor', new_shader + '.specularColor')

            if(key=="nor_gl"):
                # Create a file texture node
                file_node = cmds.shadingNode('file', asTexture=True)

                place_2d = cmds.shadingNode( 'place2dTexture', asUtility =True)
                cmds.connectAttr( place_2d + ".outUV", file_node + ".uvCoord")

                # Set the filenode's texture path
                cmds.setAttr(file_node + '.fileTextureName', tex_path, type="string")
                cmds.setAttr(file_node + '.colorSpace', 'Raw', type="string")

                normal_map = cmds.createNode("aiNormalMap") 
                cmds.connectAttr(file_node + '.outColor',  normal_map + '.input')

                # Connect the file texture to the normal attribute of the shader
                cmds.connectAttr(normal_map + '.outValue', new_shader + '.normalCamera')

            

        # Assign the shader to selected objects 
        cmds.select(asset_id)
        cmds.hyperShade(assign=new_shader)
        cmds.rename(asset_id,asset_id + "_1")


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

        kw = {'type':'models'}
        requests = urllib.request.Request('https://api.polyhaven.com/assets'+'?'+ urllib.parse.urlencode(kw),headers=headers)
        response = urllib.request.urlopen(requests)

        content = json.loads(response.read().decode())

        for key in content.keys():

            thumb_path = os.path.join(self.asset_path,"poly_thumbs/{}.png".format(key))
            
            thumb_url = "https://cdn.polyhaven.com/asset_img/thumbs/{}.png?height=110".format(key)       # get thumb

            self.download(thumb_path, thumb_url)                           
                
            self.image_paths.append(thumb_path)
            self.asset_ids.append(key)
        
        new_win = MX_PolyHaven(self.asset_path) 
