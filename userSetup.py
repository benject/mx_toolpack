# -*- coding: utf-8 -*-

import os
import sys
import maya.cmds as cmds
import install

print("Loading Mx Toolpack")

def initPlugin():

    # 动态获取 root_path 和 icon_path
    try:
        # 如果脚本被正确加载，可以用 inspect 获取
        import inspect
        root_path = os.path.dirname(inspect.getfile(inspect.currentframe()))
    except:
        # 如果 inspect 不可用，使用工作目录作为备用方案
        root_path = os.getcwd()

    # 确保路径正常工作
    sys.path.append(root_path)  # 将此模块路径添加到 Maya 的 Python 搜索路径
    icon_path = os.path.join(root_path, "icons")

    # 调用自定义安装函数
    install.create_mx_shelf(root_path, icon_path)

cmds.evalDeferred(initPlugin)
