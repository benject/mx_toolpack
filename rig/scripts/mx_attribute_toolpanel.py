# -*- coding: utf-8 -*-

import maya.cmds as cmds

class MX_AttributeToolPanel:
    def __init__(self):
        self.window_name = "MX_AttributeToolPanel"
        self.create_ui()

    # Create the UI for the attribute tool panel vertical layout, if windows already exists, delete it
    def create_ui(self):

        if cmds.window(self.window_name, exists=True):
            cmds.deleteUI(self.window_name)

        # Create the main window
        self.window = cmds.window(self.window_name, title="Attribute Tool Panel", widthHeight=(300, 400))
      
        # Create a vertical layout
        cmds.columnLayout(adjustableColumn=True)
        # add a title
        cmds.text(label="Attribute Tool Panel", align='center', font='boldLabelFont')
        # add a separator   
        cmds.separator(height=5, style='none')     
        # add a button to connect attributes
        cmds.button(label="Batch Attribute Connector", command=self.batch_attr_connector, height=30)
        # add a separator   
        cmds.separator(height=5, style='none')     

        # Show the window
        cmds.showWindow(self.window)
    
    def batch_attr_connector(self, *args):

        #load mx batch attr connect script
        import unload_pkgs
        unload_pkgs.unload_packages(True, ['rig.scripts.mx_batch_attr_connector'])
        from rig.scripts import mx_batch_attr_connector
        mbac = mx_batch_attr_connector.MX_AttrBatchConnector()
        mbac.show_window()
        