
import maya.cmds as cmds

def transferUV():
    sel = cmds.ls(sl=True)
    src=sel[0]
    trg = sel[-1]
    cmds.polyTransfer( trg, uv=1, ao=src )