# -*- coding: utf-8 -*-
import maya.cmds as cmds

def clear_display_layers():
    """
    Deletes all display layers in the Maya scene.
    """
    # Get a list of all display layers (excluding the default layer)
    display_layers = cmds.ls(type="displayLayer")
    
    # Exclude the default display layer
    display_layers = [layer for layer in display_layers if layer != "defaultLayer"]

    if display_layers:
        # Delete all custom display layers
        cmds.delete(display_layers)
        print(f"Deleted {len(display_layers)} display layer(s).")
    else:
        print("No display layers to delete.")
