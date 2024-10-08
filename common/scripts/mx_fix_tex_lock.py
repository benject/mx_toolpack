# -*- coding: utf-8 -*-

from maya import cmds

def fix_tex_lock():
    cmds.lockNode('defaultTextureList1', l=False, lockUnpublished=False)