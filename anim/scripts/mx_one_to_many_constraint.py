import maya.cmds as cmds

def one_to_multi_constraint():
    
    sel_items = cmds.ls(sl=True)
    
    for sel_item in sel_items:
        
        if( sel_item == sel_items[0]):            
            continue
        cmds.parentConstraint(sel_items[0],sel_item,mo=True)
