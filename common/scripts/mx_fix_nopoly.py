# -*- coding: utf-8 -*-

from maya import cmds

def fix_nopoly():
    cmds.lockNode("initialShadingGroup",l=0, lu=0)