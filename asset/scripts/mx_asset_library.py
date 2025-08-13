# -*- coding: utf-8 -*-

import os
import sys
import json
import urllib.request
import urllib.parse

import maya.cmds as cmds

from maya import OpenMayaUI as omui
from PySide2.QtCore import *
from PySide2.QtGui import *
from PySide2.QtWidgets import *
from shiboken2 import wrapInstance


class MX_AssetLibrary(QWidget):
    """
    统一资产库：整合 PolyHaven 模型与贴图。
    左/右两个标签页：Models 与 Textures。
    """

    def __init__(self, assets_root_path: str) -> None:
        super(MX_AssetLibrary, self).__init__()

        # 绑定 Maya 主窗口
        maya_main_ptr = omui.MQtUtil.mainWindow()
        self.mayaMainWindow = wrapInstance(int(maya_main_ptr), QWidget) if sys.version_info[0] >= 3 else wrapInstance(long(maya_main_ptr), QWidget)
        self.setParent(self.mayaMainWindow)
        self.setWindowFlags(Qt.Window)

        # 关闭已存在窗口
        for w in self.mayaMainWindow.children():
            if w.objectName() == "AssetLibraryUI":
                w.close(); w.deleteLater(); break

        self.setObjectName("AssetLibraryUI")
        self.setWindowTitle("Asset Library - 优化版")

        self.assets_root_path = assets_root_path  # 包含 poly_thumbs / tex_thumbs

        # UI 结构
        self.resize(1000, 600)
        self.main_layout = QVBoxLayout(self)
        self.tabs = QTabWidget(self)
        # 左侧垂直标签
        self.tabs.setTabPosition(QTabWidget.West)
        # 让标签文字竖排显示更清晰（Qt 会自动旋转）
        self.main_layout.addWidget(self.tabs)

        # 模型页
        self.models_tab = QWidget()
        self.models_layout = QVBoxLayout(self.models_tab)
        self.models_toolbar = QHBoxLayout()
        self.btn_update_models = QPushButton("更新缩略图", self.models_tab)
        # 模型页状态标签
        self.models_status_label = QLabel("准备就绪", self.models_tab)
        self.models_toolbar.addWidget(self.models_status_label)
        self.models_toolbar.addStretch(1)
        self.models_toolbar.addWidget(self.btn_update_models)
        self.models_layout.addLayout(self.models_toolbar)
        # 直接创建（原始做法）
        self.poly_embed = _PolyHavenEmbed(self.assets_root_path, parent=self.models_tab)
        self.models_layout.addWidget(self.poly_embed)
        self.btn_update_models.clicked.connect(self.update_models_with_progress)

        # 贴图页
        self.textures_tab = QWidget()
        self.textures_layout = QVBoxLayout(self.textures_tab)
        self.textures_toolbar = QHBoxLayout()
        self.btn_update_textures = QPushButton("更新缩略图", self.textures_tab)
        # 贴图页状态标签
        self.textures_status_label = QLabel("准备就绪", self.textures_tab)
        self.textures_toolbar.addWidget(self.textures_status_label)
        self.textures_toolbar.addStretch(1)
        self.textures_toolbar.addWidget(self.btn_update_textures)
        self.textures_layout.addLayout(self.textures_toolbar)
        # 贴图页
        self.tex_embed = _TextureHavenEmbed(self.assets_root_path, parent=self.textures_tab)
        self.textures_layout.addWidget(self.tex_embed)
        self.btn_update_textures.clicked.connect(self.update_textures_with_progress)

        self.tabs.addTab(self.models_tab, "Models")
        self.tabs.addTab(self.textures_tab, "Textures")

        # 初始填充由嵌入控件完成

        self.show()

    # 兼容旧方法名（按钮已直接绑定到嵌入控件）
    def update_models(self):
        self.poly_embed.update()

    def update_textures(self):
        self.tex_embed.update()

    def update_models_with_progress(self):
        """带进度显示的模型更新"""
        from PySide2.QtWidgets import QApplication
        
        self.models_status_label.setText("正在获取模型列表...")
        QApplication.processEvents()
        
        import urllib.request
        import urllib.parse
        import json
        import os
        
        # 确保目录存在
        thumbs_dir = os.path.join(self.assets_root_path, "poly_thumbs")
        if not os.path.exists(thumbs_dir):
            os.makedirs(thumbs_dir)
        
        try:
            headers = {'User-Agent': 'Mozilla/5.0'}
            kw = {'type': 'models'}
            requests = urllib.request.Request('https://api.polyhaven.com/assets' + '?' + urllib.parse.urlencode(kw), headers=headers)
            response = urllib.request.urlopen(requests)
            content = json.loads(response.read().decode())
            
            total_assets = len(content)
            self.models_status_label.setText(f"找到 {total_assets} 个模型，开始下载...")
            QApplication.processEvents()
            
            for i, key in enumerate(content.keys()):
                thumb_path = os.path.join(self.assets_root_path, "poly_thumbs/{}.png".format(key))
                thumb_url = "https://cdn.polyhaven.com/asset_img/thumbs/{}.png?height=110".format(key)
                
                # 更新下载进度
                progress = int((i / total_assets) * 100)
                self.models_status_label.setText(f"下载模型: {i+1}/{total_assets} ({progress}%) - {key}")
                QApplication.processEvents()
                
                # 下载缩略图
                self._download_thumb(thumb_path, thumb_url)
                
            self.models_status_label.setText(f"模型更新完成 - 共 {total_assets} 个，正在刷新界面...")
            QApplication.processEvents()
            
            # 重建模型页面
            old_widget = self.poly_embed
            self.poly_embed = _PolyHavenEmbed(self.assets_root_path, parent=self.models_tab)
            self.models_layout.replaceWidget(old_widget, self.poly_embed)
            old_widget.deleteLater()
            
            self.models_status_label.setText("准备就绪")
            
        except Exception as e:
            self.models_status_label.setText(f"更新失败: {str(e)}")
            print(f"更新模型失败: {e}")

    def update_textures_with_progress(self):
        """带进度显示的贴图更新"""
        from PySide2.QtWidgets import QApplication
        
        self.textures_status_label.setText("正在获取贴图列表...")
        QApplication.processEvents()
        
        import urllib.request
        import urllib.parse
        import json
        import os
        
        # 确保目录存在
        thumbs_dir = os.path.join(self.assets_root_path, "tex_thumbs")
        if not os.path.exists(thumbs_dir):
            os.makedirs(thumbs_dir)
        
        try:
            headers = {'User-Agent': 'Mozilla/5.0'}
            kw = {'type': 'textures'}
            requests = urllib.request.Request('https://api.polyhaven.com/assets' + '?' + urllib.parse.urlencode(kw), headers=headers)
            response = urllib.request.urlopen(requests)
            content = json.loads(response.read().decode())
            
            total_assets = len(content)
            self.textures_status_label.setText(f"找到 {total_assets} 个贴图，开始下载...")
            QApplication.processEvents()
            
            for i, key in enumerate(content.keys()):
                thumb_path = os.path.join(self.assets_root_path, "tex_thumbs/{}.png".format(key))
                thumb_url = "https://cdn.polyhaven.com/asset_img/thumbs/{}.png?height=110".format(key)
                
                # 更新下载进度
                progress = int((i / total_assets) * 100)
                self.textures_status_label.setText(f"下载贴图: {i+1}/{total_assets} ({progress}%) - {key}")
                QApplication.processEvents()
                
                # 下载缩略图
                self._download_thumb(thumb_path, thumb_url)
                
            self.textures_status_label.setText(f"贴图更新完成 - 共 {total_assets} 个，正在刷新界面...")
            QApplication.processEvents()
            
            # 重建贴图页面
            old_widget = self.tex_embed
            self.tex_embed = _TextureHavenEmbed(self.assets_root_path, parent=self.textures_tab)
            self.textures_layout.replaceWidget(old_widget, self.tex_embed)
            old_widget.deleteLater()
            
            self.textures_status_label.setText("准备就绪")
            
        except Exception as e:
            self.textures_status_label.setText(f"更新失败: {str(e)}")
            print(f"更新贴图失败: {e}")

    def _download_thumb(self, file_path, url):
        """下载缩略图"""
        if not os.path.exists(file_path):
            import urllib.request
            headers = {'User-Agent': 'Mozilla/5.0'}
            requests = urllib.request.Request(url, headers=headers)
            img_data = urllib.request.urlopen(requests)
            with open(file_path, "wb") as handler:
                handler.write(img_data.read())

    # 取消分类功能：不包含分类相关方法


# ========= 移植自原脚本（不修改原文件）：嵌入版 ========= #
class _PolyHavenEmbed(QWidget):
    def __init__(self, asset_path, parent=None):
        super(_PolyHavenEmbed, self).__init__(parent)
        self.asset_path = asset_path
        self.image_paths = []
        self.asset_ids = []
        self.image_buttons = []
        self.asset_btn_map = {}

        # 扫描缩略图
        thumbs = []
        thumbs_dir = os.path.join(self.asset_path, "poly_thumbs")
        if os.path.isdir(thumbs_dir):
            thumbs = [f for f in os.listdir(thumbs_dir) if f.lower().endswith('.png')]

        self.setMinimumSize(200, 100)
        
        # 主布局
        main_layout = QVBoxLayout(self)

        if len(thumbs) > 0:
            self.setMinimumSize(900, 500)
            for thumb in thumbs:
                self.image_paths.append(os.path.join(self.asset_path, "poly_thumbs", thumb))
                self.asset_ids.append(thumb.split(".")[0])

        # 创建滚动区域
        self.scroll_area = QScrollArea(self)
        self.scroll_area.setWidgetResizable(True)
        self.scroll_widget = QWidget()
        self.layout = QGridLayout(self.scroll_widget)
        self.scroll_area.setWidget(self.scroll_widget)
        main_layout.addWidget(self.scroll_area)
        
        # 底部状态栏
        bottom_status = QHBoxLayout()
        self.progress_label = QLabel("准备加载...", self)
        if len(thumbs) > 0:
            self.progress_label.setText(f"找到 {len(thumbs)} 个资产")
        bottom_status.addWidget(self.progress_label)
        bottom_status.addStretch()
        main_layout.addLayout(bottom_status)

        # 延迟加载图片
        if self.image_paths:
            self._create_placeholder_buttons()
            self.loading_index = 0
            self.loading_timer = QTimer(self)
            self.loading_timer.timeout.connect(self._load_next_image)
            self.loading_timer.start(5)  # 5ms间隔

    def _create_placeholder_buttons(self):
        """创建占位按钮"""
        from functools import partial
        
        for i, asset_id in enumerate(self.asset_ids):
            button = QPushButton(f"加载中...\n{asset_id[:10]}", self)
            button.setMinimumSize(147, 110)
            button.setMaximumSize(147, 110)
            button.clicked.connect(partial(self.add_to_scene, asset_id))
            
            self.image_buttons.append(button)
            self.asset_btn_map[asset_id] = button
            
            # 添加到网格布局
            row = i // 5
            col = i % 5
            self.layout.addWidget(button, row, col)

    def _load_next_image(self):
        """延迟加载图片"""
        if self.loading_index < len(self.image_paths):
            path = self.image_paths[self.loading_index]
            
            try:
                if os.path.exists(path):
                    pixmap = QPixmap(path)
                    if not pixmap.isNull():
                        scaled_pixmap = pixmap.scaledToWidth(147, Qt.SmoothTransformation)
                        
                        button = self.image_buttons[self.loading_index]
                        button.setIcon(QIcon(scaled_pixmap))
                        button.setIconSize(QSize(147, 110))
                        button.setText("")
                        
            except Exception as e:
                print(f"加载图片失败: {path}, 错误: {e}")
            
            self.loading_index += 1
            
            # 更新进度
            progress = int((self.loading_index / len(self.image_paths)) * 100)
            self.progress_label.setText(f"加载进度: {progress}% ({self.loading_index}/{len(self.image_paths)})")
            
        else:
            # 加载完成
            self.loading_timer.stop()
            self.loading_timer.deleteLater()
            self.progress_label.setText(f"加载完成 - {len(self.image_paths)} 个资产")

    def apply_visible_ids(self, visible_ids):
        # None 表示全部显示
        if not self.asset_btn_map:
            return
        if visible_ids is None:
            for btn in self.asset_btn_map.values():
                btn.setVisible(True)
        else:
            for aid, btn in self.asset_btn_map.items():
                btn.setVisible(aid in visible_ids)

    def add_to_scene(self, asset_id):
        headers = {'User-Agent': 'Mozilla/5.0'}
        requests = urllib.request.Request("https://api.polyhaven.com/files/{}".format(asset_id), headers=headers)
        response = urllib.request.urlopen(requests)
        content = json.loads(response.read().decode())

        fbx_url = content["fbx"]["4k"]["fbx"]["url"]
        project_path = cmds.workspace(q=True, rd=True)
        assets_path = os.path.join(project_path, "assets")
        if not os.path.exists(assets_path):
            os.mkdir(assets_path)
        fbx_path = os.path.join(assets_path, "{0}.fbx".format(asset_id))
        if not os.path.exists(fbx_path):
            self.download(fbx_path, fbx_url)
        cmds.file(fbx_path, i=True, typ="FBX", iv=True, ra=True, mnc=False, pr=True, ns="")

        new_shader = cmds.shadingNode('aiStandardSurface', asShader=True)
        source_image_path = os.path.join(project_path, "sourceimages")
        if not os.path.exists(source_image_path):
            os.mkdir(source_image_path)

        for key in content.keys():
            if (key in ['blend', 'gltf', 'usd', 'fbx']):
                continue
            tex_url = content[key]["4k"]["png"]["url"]
            asset_id_path = os.path.join(source_image_path, asset_id)
            if not os.path.exists(asset_id_path):
                os.mkdir(asset_id_path)
            tex_path = os.path.join(asset_id_path, "{}_4k.png".format(key))
            if not os.path.exists(tex_path):
                self.download(tex_path, tex_url)

            if (key == "Diffuse"):
                file_node = cmds.shadingNode('file', asTexture=True)
                place_2d = cmds.shadingNode('place2dTexture', asUtility=True)
                cmds.connectAttr(place_2d + ".outUV", file_node + ".uvCoord")
                cmds.setAttr(file_node + '.fileTextureName', tex_path, type="string")
                cmds.connectAttr(file_node + '.outColor', new_shader + '.baseColor')

            if (key == "Rough"):
                file_node = cmds.shadingNode('file', asTexture=True)
                place_2d = cmds.shadingNode('place2dTexture', asUtility=True)
                cmds.connectAttr(place_2d + ".outUV", file_node + ".uvCoord")
                cmds.setAttr(file_node + '.fileTextureName', tex_path, type="string")
                cmds.setAttr(file_node + '.colorSpace', 'Raw', type="string")
                cmds.connectAttr(file_node + '.outColorR', new_shader + '.specularRoughness')

            if (key == "spec"):
                file_node = cmds.shadingNode('file', asTexture=True)
                place_2d = cmds.shadingNode('place2dTexture', asUtility=True)
                cmds.connectAttr(place_2d + ".outUV", file_node + ".uvCoord")
                cmds.setAttr(file_node + '.fileTextureName', tex_path, type="string")
                cmds.setAttr(file_node + '.colorSpace', 'Raw', type="string")
                cmds.connectAttr(file_node + '.outColor', new_shader + '.specularColor')

            if (key == "nor_gl"):
                file_node = cmds.shadingNode('file', asTexture=True)
                place_2d = cmds.shadingNode('place2dTexture', asUtility=True)
                cmds.connectAttr(place_2d + ".outUV", file_node + ".uvCoord")
                cmds.setAttr(file_node + '.fileTextureName', tex_path, type="string")
                cmds.setAttr(file_node + '.colorSpace', 'Raw', type="string")
                normal_map = cmds.createNode("aiNormalMap")
                cmds.connectAttr(file_node + '.outColor', normal_map + '.input')
                cmds.connectAttr(normal_map + '.outValue', new_shader + '.normalCamera')

        cmds.select(asset_id)
        cmds.hyperShade(assign=new_shader)
        cmds.rename(asset_id, asset_id + "_1")

    def download(self, file_path, url):
        if not (os.path.exists(file_path)):
            headers = {'User-Agent': 'Mozilla/5.0'}
            requests = urllib.request.Request(url, headers=headers)
            img_data = urllib.request.urlopen(requests)
            with open(file_path, "wb") as handler:
                handler.write(img_data.read())

    def update(self):
        self.progress_label.setText("正在获取资产列表...")
        
        self.image_paths[:] = []
        self.asset_ids[:] = []
        headers = {'User-Agent': 'Mozilla/5.0'}
        kw = {'type': 'models'}
        requests = urllib.request.Request('https://api.polyhaven.com/assets' + '?' + urllib.parse.urlencode(kw), headers=headers)
        response = urllib.request.urlopen(requests)
        content = json.loads(response.read().decode())
        
        total_assets = len(content)
        self.progress_label.setText(f"找到 {total_assets} 个资产，开始下载...")
        
        for i, key in enumerate(content.keys()):
            thumb_path = os.path.join(self.asset_path, "poly_thumbs/{}.png".format(key))
            thumb_url = "https://cdn.polyhaven.com/asset_img/thumbs/{}.png?height=110".format(key)
            
            # 更新下载进度
            progress = int((i / total_assets) * 100)
            self.progress_label.setText(f"下载进度: {i+1}/{total_assets} ({progress}%) - {key}")
            
            # 强制刷新UI
            from PySide2.QtWidgets import QApplication
            QApplication.processEvents()
            
            self.download(thumb_path, thumb_url)
            self.image_paths.append(thumb_path)
            self.asset_ids.append(key)
            
        self.progress_label.setText(f"更新完成 - 共 {total_assets} 个资产")
        
        # 重建自身
        parent = self.parent()
        idx = parent.layout().indexOf(self)
        parent.layout().takeAt(idx)
        self.setParent(None)
        self.deleteLater()
        parent.layout().addWidget(_PolyHavenEmbed(self.asset_path, parent=parent))


class _TextureHavenEmbed(QWidget):
    def __init__(self, asset_path, parent=None):
        super(_TextureHavenEmbed, self).__init__(parent)
        self.asset_path = asset_path
        self.image_paths = []
        self.asset_ids = []
        self.image_buttons = []
        self.asset_btn_map = {}

        # 扫描缩略图
        thumbs = []
        thumbs_dir = os.path.join(self.asset_path, "tex_thumbs")
        if os.path.isdir(thumbs_dir):
            thumbs = [f for f in os.listdir(thumbs_dir) if f.lower().endswith('.png')]

        self.setMinimumSize(200, 100)
        
        # 主布局
        main_layout = QVBoxLayout(self)

        if len(thumbs) > 0:
            self.setMinimumSize(900, 500)
            for thumb in thumbs:
                self.image_paths.append(os.path.join(self.asset_path, "tex_thumbs", thumb))
                self.asset_ids.append(thumb.split(".")[0])

        # 创建滚动区域
        self.scroll_area = QScrollArea(self)
        self.scroll_area.setWidgetResizable(True)
        self.scroll_widget = QWidget()
        self.layout = QGridLayout(self.scroll_widget)
        self.scroll_area.setWidget(self.scroll_widget)
        main_layout.addWidget(self.scroll_area)
        
        # 底部状态栏
        bottom_status = QHBoxLayout()
        self.progress_label = QLabel("准备加载...", self)
        if len(thumbs) > 0:
            self.progress_label.setText(f"找到 {len(thumbs)} 个资产")
        bottom_status.addWidget(self.progress_label)
        bottom_status.addStretch()
        main_layout.addLayout(bottom_status)

        # 延迟加载图片
        if self.image_paths:
            self._create_placeholder_buttons()
            self.loading_index = 0
            self.loading_timer = QTimer(self)
            self.loading_timer.timeout.connect(self._load_next_image)
            self.loading_timer.start(5)  # 5ms间隔

    def _create_placeholder_buttons(self):
        """创建占位按钮"""
        from functools import partial
        
        for i, asset_id in enumerate(self.asset_ids):
            button = QPushButton(f"加载中...\n{asset_id[:10]}", self)
            button.setMinimumSize(147, 110)
            button.setMaximumSize(147, 110)
            button.clicked.connect(partial(self.add_to_scene, asset_id))
            
            self.image_buttons.append(button)
            self.asset_btn_map[asset_id] = button
            
            # 添加到网格布局
            row = i // 5
            col = i % 5
            self.layout.addWidget(button, row, col)

    def _load_next_image(self):
        """延迟加载图片"""
        if self.loading_index < len(self.image_paths):
            path = self.image_paths[self.loading_index]
            
            try:
                if os.path.exists(path):
                    pixmap = QPixmap(path)
                    if not pixmap.isNull():
                        scaled_pixmap = pixmap.scaledToWidth(147, Qt.SmoothTransformation)
                        
                        button = self.image_buttons[self.loading_index]
                        button.setIcon(QIcon(scaled_pixmap))
                        button.setIconSize(QSize(147, 110))
                        button.setText("")
                        
            except Exception as e:
                print(f"加载图片失败: {path}, 错误: {e}")
            
            self.loading_index += 1
            
            # 更新进度
            progress = int((self.loading_index / len(self.image_paths)) * 100)
            self.progress_label.setText(f"加载进度: {progress}% ({self.loading_index}/{len(self.image_paths)})")
            
        else:
            # 加载完成
            self.loading_timer.stop()
            self.loading_timer.deleteLater()
            self.progress_label.setText(f"加载完成 - {len(self.image_paths)} 个资产")

    def apply_visible_ids(self, visible_ids):
        if not self.asset_btn_map:
            return
        if visible_ids is None:
            for btn in self.asset_btn_map.values():
                btn.setVisible(True)
        else:
            for aid, btn in self.asset_btn_map.items():
                btn.setVisible(aid in visible_ids)

    def add_to_scene(self, asset_id):
        sel = cmds.ls(sl=True)
        if (len(sel) > 0):
            headers = {'User-Agent': 'Mozilla/5.0'}
            requests = urllib.request.Request("https://api.polyhaven.com/files/{}".format(asset_id), headers=headers)
            response = urllib.request.urlopen(requests)
            content = json.loads(response.read().decode())

            project_path = cmds.workspace(q=True, rd=True)
            source_image_path = os.path.join(project_path, "sourceimages")
            if not os.path.isdir(source_image_path):
                os.mkdir(source_image_path)

            new_shader = cmds.shadingNode('aiStandardSurface', asShader=True, n=asset_id + "_shader")
            source_image_path = os.path.join(project_path, "sourceimages")
            if not os.path.exists(source_image_path):
                os.mkdir(source_image_path)

            for key in content.keys():
                if (key in ['blend', 'gltf']):
                    continue
                tex_url = content[key]["4k"]["png"]["url"]
                asset_id_path = os.path.join(source_image_path, asset_id)
                if not os.path.exists(asset_id_path):
                    os.mkdir(asset_id_path)
                tex_path = os.path.join(asset_id_path, "{}_4k.png".format(key))
                if not os.path.exists(tex_path):
                    self.download(tex_path, tex_url)

                if (key == "Diffuse"):
                    file_node = cmds.shadingNode('file', asTexture=True)
                    place_2d = cmds.shadingNode('place2dTexture', asUtility=True)
                    cmds.connectAttr(place_2d + ".outUV", file_node + ".uvCoord")
                    cmds.setAttr(file_node + '.fileTextureName', tex_path, type="string")
                    cmds.connectAttr(file_node + '.outColor', new_shader + '.baseColor')

                if (key == "Rough"):
                    file_node = cmds.shadingNode('file', asTexture=True)
                    place_2d = cmds.shadingNode('place2dTexture', asUtility=True)
                    cmds.connectAttr(place_2d + ".outUV", file_node + ".uvCoord")
                    cmds.setAttr(file_node + '.fileTextureName', tex_path, type="string")
                    cmds.setAttr(file_node + '.colorSpace', 'Raw', type="string")
                    cmds.connectAttr(file_node + '.outColorR', new_shader + '.specularRoughness')

                if (key == "spec"):
                    file_node = cmds.shadingNode('file', asTexture=True)
                    place_2d = cmds.shadingNode('place2dTexture', asUtility=True)
                    cmds.connectAttr(place_2d + ".outUV", file_node + ".uvCoord")
                    cmds.setAttr(file_node + '.fileTextureName', tex_path, type="string")
                    cmds.setAttr(file_node + '.colorSpace', 'Raw', type="string")
                    cmds.connectAttr(file_node + '.outColor', new_shader + '.specularColor')

                if (key == "nor_gl"):
                    file_node = cmds.shadingNode('file', asTexture=True)
                    place_2d = cmds.shadingNode('place2dTexture', asUtility=True)
                    cmds.connectAttr(place_2d + ".outUV", file_node + ".uvCoord")
                    cmds.setAttr(file_node + '.fileTextureName', tex_path, type="string")
                    cmds.setAttr(file_node + '.colorSpace', 'Raw', type="string")
                    normal_map = cmds.createNode("aiNormalMap")
                    cmds.connectAttr(file_node + '.outColor', normal_map + '.input')
                    cmds.connectAttr(normal_map + '.outValue', new_shader + '.normalCamera')

            cmds.select(sel)
            cmds.hyperShade(assign=new_shader)
        else:
            cmds.warning("you have to select at least one geometry!")

    def download(self, file_path, url):
        if not (os.path.exists(file_path)):
            headers = {'User-Agent': 'Mozilla/5.0'}
            requests = urllib.request.Request(url, headers=headers)
            img_data = urllib.request.urlopen(requests)
            with open(file_path, "wb") as handler:
                handler.write(img_data.read())

    def update(self):
        self.progress_label.setText("正在获取资产列表...")
        
        self.image_paths[:] = []
        self.asset_ids[:] = []
        headers = {'User-Agent': 'Mozilla/5.0'}
        kw = {'type': 'textures'}
        requests = urllib.request.Request('https://api.polyhaven.com/assets' + '?' + urllib.parse.urlencode(kw), headers=headers)
        response = urllib.request.urlopen(requests)
        content = json.loads(response.read().decode())
        
        total_assets = len(content)
        self.progress_label.setText(f"找到 {total_assets} 个资产，开始下载...")
        
        for i, key in enumerate(content.keys()):
            thumb_path = os.path.join(self.asset_path, "tex_thumbs/{}.png".format(key))
            thumb_url = "https://cdn.polyhaven.com/asset_img/thumbs/{}.png?height=110".format(key)
            
            # 更新下载进度
            progress = int((i / total_assets) * 100)
            self.progress_label.setText(f"下载进度: {i+1}/{total_assets} ({progress}%) - {key}")
            
            # 强制刷新UI
            from PySide2.QtWidgets import QApplication
            QApplication.processEvents()
            
            self.download(thumb_path, thumb_url)
            self.image_paths.append(thumb_path)
            self.asset_ids.append(key)
            
        self.progress_label.setText(f"更新完成 - 共 {total_assets} 个资产")
        
        parent = self.parent()
        idx = parent.layout().indexOf(self)
        parent.layout().takeAt(idx)
        self.setParent(None)
        self.deleteLater()
        parent.layout().addWidget(_TextureHavenEmbed(self.asset_path, parent=parent))


