# -*- coding: utf-8 -*-

import maya.cmds as cmds
import maya.mel as mel
from functools import partial

class MX_CreateCtrl:
    def __init__(self):
            self.window = 'CreateCtrlWindow'
            if cmds.window(self.window, exists=True):
                cmds.deleteUI(self.window, window=True)

            self.window = cmds.window(self.window, title='CreateCtrl', widthHeight=(340, 300))
            self.layout = cmds.columnLayout(adjustableColumn=True)

            self.initUI()
        


    def initUI(self):
        buttons = [
            ("Circle", 1),
            ("Cross", 2),
            ("Cross in Circle", 3),
            ("Cube", 4),
            ("Pyramid", 5),
            ("Sphere", 6),
            ("Eye", 7),
            ("Nail", 8),
            ("Arrow",9),
            ("Global Arrow",10)
        ]

        # 添加整体左右间隔
        cmds.rowLayout(numberOfColumns=3, columnWidth3=(5, 330, 5), adjustableColumn=2)
        cmds.separator(style='none', width=5)
        content_layout = cmds.columnLayout(adjustableColumn=True)

        cmds.text(label = "")
        cmds.text(label = u"Create Controller")
        cmds.text(label = "")

        for i in range(0, len(buttons), 2):
            cmds.rowLayout(numberOfColumns=3, columnWidth3=(150, 5, 150), adjustableColumn=2, parent=content_layout)
            label, ctrl_type = buttons[i]
            cmds.button(label=label, width=150, command=partial(self.create_ctrl, ctrl_type))
            if i + 1 < len(buttons):
                cmds.separator(style='none', width=5)
                label, ctrl_type = buttons[i + 1]
                cmds.button(label=label, width=150, command=partial(self.create_ctrl, ctrl_type))
            else:
                cmds.separator(style='none', width=5)  # 占位符
                cmds.separator(style='none', width=150)  # 占位符
            cmds.setParent('..')  # 结束rowLayout
            cmds.separator(style='none', height=5, parent=content_layout)

        cmds.separator(style='none', height=10, parent=content_layout)  # 确保最后一个rowLayout与下面的控件有间隔

        # Add color selection slider
        cmds.text(label = "")
        cmds.text(label = u"Change Controller Color")

        self.colorIndexSliderGrp = cmds.colorIndexSliderGrp(min=0, max=32, value=1, width=280, height=40, parent=content_layout)

        cmds.separator(style='none', height=10, parent=content_layout)  # 确保slider和按钮之间有间隔

        # Add Set Color button
        cmds.button(label="Set Color", width=150, command=self.changeColor_fun, parent=content_layout)

        cmds.setParent('..')  # 结束columnLayout
        cmds.separator(style='none', width=5)
        cmds.setParent('..')  # 结束rowLayout

        cmds.showWindow(self.window)

        # 设置窗口宽度
        cmds.window(self.window, edit=True, widthHeight=(340, 300))

    def create_ctrl(self, type, *args):
        if type == 1: # Circle
            mel.eval("circle -c 0 0 0 -nr 0 1 0 -sw 360 -r 2 -d 3 -ut 0 -tol 0.01 -s 8 -ch 0 -n \"Ctrl\";")
        elif type == 2: # Cross
            mel.eval("$ctrl = `curve -d 1 -p -0.5 0 -2.5 -p 0.5 0 -2.5 -p 0.5 0 -0.5 -p 2.5 0 -0.5 -p 2.5 0 0.5 -p 0.5 0 0.5 -p 0.5 0 2.5 -p -0.5 0 2.5 -p -0.5 0 0.5 -p -2.5 0 0.5 -p -2.5 0 -0.5 -p -0.5 0 -0.5 -p -0.5 0 -2.5 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12`; rename $ctrl \"ctrl\";")
        elif type == 3: # Cross in Circle
            mel.eval("$ctrl = `curve -d 1 -p 0 0 -1 -p 0.309017 0 -0.951057 -p 0.587786 0 -0.809017 -p 0.809018 0 -0.587786 -p 0.951057 0 -0.309017 -p 1 0 0 -p 0.951057 0 0.309017 -p 0.809017 0 0.587785 -p 0.587785 0 0.809017 -p 0.309017 0 0.951057 -p -2.98023e-08 0 1 -p -0.309017 0 0.951057 -p -0.587785 0 0.809017 -p -0.809017 0 0.587785 -p -0.951057 0 0.309017 -p -1 0 0 -p -0.951057 0 -0.309017 -p -0.809017 0 -0.587785 -p -0.587785 0 -0.809017 -p -0.309017 0 -0.951057 -p 0 0 -1 -p 0.309017 0 -0.951057 -p 0.587786 0 -0.809017 -p 0.698402 0 -0.698402 -p -0.698401 0 0.698401 -p -0.809017 0 0.587785 -p -0.951057 0 0.309017 -p -1 0 0 -p -0.951057 0 -0.309017 -p -0.809017 0 -0.587785 -p -0.698401 0 -0.698401 -p 0.698401 0 0.698401 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12 -k 13 -k 14 -k 15 -k 16 -k 17 -k 18 -k 19 -k 20 -k 21 -k 22 -k 23 -k 24 -k 25 -k 26 -k 27 -k 28 -k 29 -k 30 -k 31`; rename $ctrl \"ctrl\";")
        elif type == 4: # Cube
            mel.eval("$ctrl = `curve -d 1 -p 0.5 0.5 0.5 -p 0.5 0.5 -0.5 -p -0.5 0.5 -0.5 -p -0.5 0.5 0.5 -p 0.5 0.5 0.5 -p 0.5 -0.5 0.5 -p -0.5 -0.5 0.5 -p -0.5 0.5 0.5 -p -0.5 0.5 -0.5 -p -0.5 -0.5 -0.5 -p -0.5 -0.5 0.5 -p 0.5 -0.5 0.5 -p 0.5 -0.5 -0.5 -p -0.5 -0.5 -0.5 -p -0.5 0.5 -0.5 -p 0.5 0.5 -0.5 -p 0.5 -0.5 -0.5 -p 0.5 -0.5 0.5 -p 0.5 0.5 0.5 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12 -k 13 -k 14 -k 15 -k 16 -k 17 -k 18`; rename $ctrl \"ctrl\";")
        elif type == 5: # Pyramid
            mel.eval("$ctrl = `curve -d 1 -p 1 0 -1 -p -1 0 -1 -p -1 0 1 -p 1 0 1 -p 1 0 -1 -p 0 1.414214 0 -p -1 0 -1 -p -1 0 1 -p 0 1.414214 0 -p 1 0 1 -p 1 0 -1 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10`;  rename $ctrl \"ctrl\";")
        elif type == 6: # Sphere
            mel.eval("$ctrl = `curve -d 1 -p 0 1 0 -p 0.258819 0.965926 0 -p 0.5 0.866025 0 -p 0.707107 0.707107 0 -p 0.866025 0.5 0 -p 0.965926 0.258819 0 -p 1 0 0 -p 0.965926 -0.258819 0 -p 0.866025 -0.5 0 -p 0.707107 -0.707107 0 -p 0.5 -0.866025 0 -p 0.258819 -0.965926 0 -p 0 -1 0 -p -0.258819 -0.965926 0 -p -0.5 -0.866025 0 -p -0.707107 -0.707107 0 -p -0.866025 -0.5 0 -p -0.965926 -0.258819 0 -p -1 0 0 -p -0.965926 0.258819 0 -p -0.866025 0.5 0 -p -0.707107 0.707107 0 -p -0.5 0.866025 0 -p -0.258819 0.965926 0 -p 0 1 0 -p 0 0.965926 0.258819 -p 0 0.866025 0.5 -p 0 0.707107 0.707107 -p 0 0.5 0.866025 -p 0 0.258819 0.965926 -p 0 0 1 -p 0 -0.258819 0.965926 -p 0 -0.5 0.866025 -p 0 -0.707107 0.707107 -p 0 -0.866025 0.5 -p 0 -0.965926 0.258819 -p 0 -1 0 -p 0 -0.965926 -0.258819 -p 0 -0.866025 -0.5 -p 0 -0.707107 -0.707107 -p 0 -0.5 -0.866025 -p 0 -0.258819 -0.965926 -p 0 0 -1 -p 0 0.258819 -0.965926 -p 0 0.5 -0.866025 -p 0 0.707107 -0.707107 -p 0 0.866025 -0.5 -p 0 0.965926 -0.258819 -p 0 1 0 -p 0 0.965926 0.258819 -p 0 0.866025 0.5 -p 0 0.707107 0.707107 -p 0 0.5 0.866025 -p 0 0.258819 0.965926 -p 0 0 1 -p -0.5 0 0.866025 -p -0.866025 0 0.5 -p -1 0 0 -p -0.866025 0 -0.5 -p -0.5 0 -0.866025 -p 0 0 -1 -p 0.5 0 -0.866025 -p 0.866025 0 -0.5 -p 1 0 0 -p 0.866025 0 0.5 -p 0.5 0 0.866025 -p 0 0 1 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12 -k 13 -k 14 -k 15 -k 16 -k 17 -k 18 -k 19 -k 20 -k 21 -k 22 -k 23 -k 24 -k 25 -k 26 -k 27 -k 28 -k 29 -k 30 -k 31 -k 32 -k 33 -k 34 -k 35 -k 36 -k 37 -k 38 -k 39 -k 40 -k 41 -k 42 -k 43 -k 44 -k 45 -k 46 -k 47 -k 48 -k 49 -k 50 -k 51 -k 52 -k 53 -k 54 -k 55 -k 56 -k 57 -k 58 -k 59 -k 60 -k 61 -k 62 -k 63 -k 64 -k 65 -k 66`; rename $ctrl \"ctrl\";")
        elif type == 7: # Eye
            mel.eval("$ctrl = `curve -d 1 -p 0.000308717 0.262495 0 -p -0.158626 0.246005 0 -p -0.309329 0.193761 0 -p -0.442149 0.105046 0 -p -0.562035 0 0 -p -0.442149 -0.105046 0 -p -0.309329 -0.193761 0 -p -0.158626 -0.246005 0 -p 0.000308717 -0.262495 0 -p 0.158626 -0.246005 0 -p 0.309329 -0.193761 0 -p 0.442149 -0.105046 0 -p 0.562035 0 0 -p 0.442149 0.105046 0 -p 0.309329 0.193761 0 -p 0.158626 0.246005 0 -p 0.000308717 0.262495 0 -p 0 0.211555 0 -p -0.0817853 0.197981 0 -p -0.151302 0.151184 0 -p -0.197447 0.082473 0 -p -0.213973 -0.0001517 0 -p -0.197447 -0.0817518 0 -p -0.151302 -0.151309 0 -p -0.0817853 -0.197446 0 -p 0 -0.213974 0 -p 0.0817853 -0.197447 0 -p 0.151302 -0.151302 0 -p 0.197447 -0.081784 0 -p 0.213973 -5.74644e-06 0 -p 0.197447 0.0818113 0 -p 0.151302 0.14819 0 -p 0.0817853 0.197981 0 -p 0 0.211555 0 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12 -k 13 -k 14 -k 15 -k 16 -k 17 -k 18 -k 19 -k 20 -k 21 -k 22 -k 23 -k 24 -k 25 -k 26 -k 27 -k 28 -k 29 -k 30 -k 31 -k 32 -k 33`;  rename $ctrl \"ctrl\";")
        elif type == 8: # Nail
            mel.eval("$ctrl = `curve -d 1 -p 0 0 0 -p 0 1.2 0 -p -0.4 1.30718 0 -p -0.69282 1.6 0 -p -0.8 2 0 -p -0.69282 2.4 0 -p -0.4 2.69282 0 -p 0 2.8 0 -p 0.4 2.69282 0 -p 0.69282 2.4 0 -p 0.8 2 0 -p 0.69282 1.6 0 -p 0.4 1.30718 0 -p 0 1.2 0 -p 0 2 0 -p 0.8 2 0 -p 0 2 0 -p 0 2.8 0 -p 0 2 0 -p -0.8 2 0 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12 -k 13 -k 14 -k 15 -k 16 -k 17 -k 18 -k 19`;  rename $ctrl \"ctrl\";")
        elif type == 9: # Arrow
            mel.eval("$ctrl = `curve -d 1 -p -1 0 -1 -p 1 0 -1 -p 1 0 -2 -p 3 0 0 -p 1 0 2 -p 1 0 1 -p -1 0 1 -p -1 0 -1 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7`; rename $ctrl \"ctrl\" ;")
        elif type == 10: # Global Arrow
            mel.eval("$ctrl = `curve -d 1 -p 0 0 -7 -p -1.377778 0 -5 -p -0.688889 0 -5 -p -0.688889 0 -4.11103 -p -1.08752 0 -4.058679 -p -2.100927 0 -3.638911 -p -2.97116 0 -2.971159 -p -3.638912 0 -2.100926 -p -4.058679 0 -1.087519 -p -4.11103 0 -0.74918 -p -5 0 -0.74918 -p -5 0 -1.377778 -p -7 0 0 -p -5 0 1.377778 -p -5 0 0.688889 -p -4.11103 0 0.688889 -p -4.058679 0 1.08752 -p -3.638912 0 2.100927 -p -2.971159 0 2.971159 -p -2.100926 0 3.638912 -p -1.08752 0 4.058679 -p -0.74918 0 4.11103 -p -0.74918 0 5 -p -1.377778 0 5 -p 0 0 7 -p 1.377778 0 5 -p 0.688889 0 5 -p 0.688889 0 4.11103 -p 1.08752 0 4.058679 -p 2.100927 0 3.638912 -p 2.971159 0 2.971159 -p 3.638912 0 2.100926 -p 4.058679 0 1.087519 -p 4.11103 0 0.74918 -p 5 0 0.74918 -p 5 0 1.377778 -p 7 0 0 -p 5 0 -1.377778 -p 5 0 -0.688889 -p 4.11103 0 -0.688889 -p 4.058679 0 -1.08752 -p 3.638911 0 -2.100927 -p 2.971159 0 -2.97116 -p 2.100926 0 -3.638912 -p 1.087519 0 -4.058679 -p 0.74918 0 -4.11103 -p 0.74918 0 -5 -p 1.377778 0 -5 -p 0 0 -7 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12 -k 13 -k 14 -k 15 -k 16 -k 17 -k 18 -k 19 -k 20 -k 21 -k 22 -k 23 -k 24 -k 25 -k 26 -k 27 -k 28 -k 29 -k 30 -k 31 -k 32 -k 33 -k 34 -k 35 -k 36 -k 37 -k 38 -k 39 -k 40 -k 41 -k 42 -k 43 -k 44 -k 45 -k 46 -k 47 -k 48`; rename $ctrl \"ctrl\";")
    def changeColor_fun(self, *args):
        index = cmds.colorIndexSliderGrp(self.colorIndexSliderGrp, query=True, value=True) - 1
        index = max(0, min(32, index))
        sel = cmds.ls(selection=True)
        for obj in sel:
            shapes = cmds.listRelatives(obj, children=True, shapes=True)
            if shapes:
                for shape in shapes:
                    cmds.setAttr("{}.overrideEnabled".format(shape), 1)
                    cmds.setAttr("{}.overrideColor".format(shape), index)
