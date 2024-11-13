# -*- coding: utf-8 -*-

from maya import mel

def generate_allUV():
    mel.eval("generateAllUvTilePreviews;")