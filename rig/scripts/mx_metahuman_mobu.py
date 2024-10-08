# -*- coding: utf-8 -*-

import maya.cmds as cmds
import maya.mel as mel

class MX_MHtoMB():
    
    def __init__(self):
        
        self.showUI()

    def make_tpose(self,args):

        mel.eval('setUpAxis "y";')

        mel.eval('setAttr "root_drv.rotateX" -90;')
        mel.eval('setAttr "Lights.rotateX" -90;')
        mel.eval('setAttr "headRig_grp.rotateX" -90;')
        

        cmds.setAttr( "clavicle_l_drv.rotateY", -8)
        cmds.setAttr( "upperarm_l_drv.rotateY", -45)    
        cmds.setAttr( "lowerarm_l_drv.rotateZ", 35)
        cmds.setAttr( "lowerarm_l_drv.rotateX", -15)
        
        
        cmds.setAttr("clavicle_r_drv.rotateY" , -8)
        cmds.setAttr("clavicle_r_drv.rotateX" , 0)
        cmds.setAttr("clavicle_r_drv.rotateZ" , 0)
        cmds.setAttr( "upperarm_r_drv.rotateY", -45)
        cmds.setAttr( "lowerarm_r_drv.rotateZ", 35)
        cmds.setAttr( "lowerarm_r_drv.rotateX", -15)
        
        #left fingers
        cmds.setAttr ("index_01_l_drv.rotateZ", -15)
        cmds.setAttr ("index_02_l_drv.rotateZ", -15)
        cmds.setAttr ("index_03_l_drv.rotateZ", -10)
            
        cmds.setAttr ("middle_01_l_drv.rotateZ", -15)
        cmds.setAttr ("middle_02_l_drv.rotateZ", -25)
        cmds.setAttr ("middle_03_l_drv.rotateZ", -10)
        
        cmds.setAttr ("ring_metacarpal_l_drv.rotateZ", -5)
        cmds.setAttr ("ring_01_l_drv.rotateZ", -5)
        cmds.setAttr ("ring_02_l_drv.rotateZ", -25)
        cmds.setAttr ("ring_03_l_drv.rotateZ", -10)
        
        
        cmds.setAttr ("pinky_metacarpal_l_drv.rotateZ", -5)
        cmds.setAttr ("pinky_01_l_drv.rotateZ", -15)
        cmds.setAttr ("pinky_02_l_drv.rotateZ", -15)
        cmds.setAttr ("pinky_03_l_drv.rotateZ", -10)
        
        cmds.setAttr ("thumb_03_l_drv.rotateZ", -25)
        
        
        #right fingers
        cmds.setAttr ("index_01_r_drv.rotateZ", -15)
        cmds.setAttr ("index_02_r_drv.rotateZ", -15)
        cmds.setAttr ("index_03_r_drv.rotateZ", -10)
            
        cmds.setAttr ("middle_01_r_drv.rotateZ", -15)
        cmds.setAttr ("middle_02_r_drv.rotateZ", -25)
        cmds.setAttr ("middle_03_r_drv.rotateZ", -10)
        
        cmds.setAttr ("ring_metacarpal_r_drv.rotateZ", -5)
        cmds.setAttr ("ring_01_r_drv.rotateZ", -5)
        cmds.setAttr ("ring_02_r_drv.rotateZ", -25)
        cmds.setAttr ("ring_03_r_drv.rotateZ", -10)
        
        
        cmds.setAttr ("pinky_metacarpal_r_drv.rotateZ", -5)
        cmds.setAttr ("pinky_01_r_drv.rotateZ", -15)
        cmds.setAttr ("pinky_02_r_drv.rotateZ", -15)
        cmds.setAttr ("pinky_03_r_drv.rotateZ", -10)
        
        cmds.setAttr ("thumb_03_r_drv.rotateZ", -25)
        
    def create_def(self,args):

        mel.eval('hikCreateDefinition()')
        char_name = mel.eval('hikGetCurrentCharacter()')


        #add joint definition
        mel.eval('''setCharacterObject("root_drv","%s",0,0);'''%char_name)
        mel.eval('''setCharacterObject("pelvis_drv","%s",1,0);'''%char_name)
        mel.eval('''setCharacterObject("spine_01_drv","%s",8,0);'''%char_name)
        mel.eval('''setCharacterObject("spine_02_drv","%s",23,0);'''%char_name)
        mel.eval('''setCharacterObject("spine_03_drv","%s",24,0);'''%char_name)
        mel.eval('''setCharacterObject("spine_04_drv","%s",25,0);'''%char_name)
        mel.eval('''setCharacterObject("spine_05_drv","%s",26,0);'''%char_name)
        mel.eval('''setCharacterObject("neck_01_drv","%s",20,0);'''%char_name)
        mel.eval('''setCharacterObject("neck_02_drv","%s",32,0);'''%char_name)
        mel.eval('''setCharacterObject("head_drv","%s",15,0);'''%char_name)
        mel.eval('''setCharacterObject("clavicle_l_drv","%s",18,0);'''%char_name)
        mel.eval('''setCharacterObject("upperarm_l_drv","%s",9,0);'''%char_name)
        mel.eval('''setCharacterObject("lowerarm_l_drv","%s",10,0);'''%char_name)
        mel.eval('''setCharacterObject("hand_l_drv","%s",11,0);'''%char_name)
        mel.eval('''setCharacterObject("thumb_01_l_drv","%s",50,0);'''%char_name)
        mel.eval('''setCharacterObject("thumb_02_l_drv","%s",51,0);'''%char_name)
        mel.eval('''setCharacterObject("thumb_03_l_drv","%s",52,0);'''%char_name)
        #mel.eval('''setCharacterObject("thumb_04_l_drv1","%s",53,0);'''%char_name)
        mel.eval('''setCharacterObject("index_metacarpal_l_drv","%s",147,0);'''%char_name)
        mel.eval('''setCharacterObject("index_01_l_drv","%s",54,0);'''%char_name)
        mel.eval('''setCharacterObject("index_02_l_drv","%s",55,0);'''%char_name)
        mel.eval('''setCharacterObject("index_03_l_drv","%s",56,0);'''%char_name)
        #mel.eval('''setCharacterObject("index_04_l_drv1","%s",57,0);'''%char_name)
        mel.eval('''setCharacterObject("middle_metacarpal_l_drv","%s",148,0);'''%char_name)
        mel.eval('''setCharacterObject("middle_01_l_drv","%s",58,0);'''%char_name)
        mel.eval('''setCharacterObject("middle_02_l_drv","%s",59,0);'''%char_name)
        mel.eval('''setCharacterObject("middle_03_l_drv","%s",60,0);'''%char_name)
    # mel.eval('''setCharacterObject("middle_04_l_drv1","%s",61,0);'''%char_name)
        mel.eval('''setCharacterObject("ring_metacarpal_l_drv","%s",149,0);'''%char_name)
        mel.eval('''setCharacterObject("ring_01_l_drv","%s",62,0);'''%char_name)
        mel.eval('''setCharacterObject("ring_02_l_drv","%s",63,0);'''%char_name)
        mel.eval('''setCharacterObject("ring_03_l_drv","%s",64,0);'''%char_name)
        #mel.eval('''setCharacterObject("ring_04_l_drv1","%s",65,0);'''%char_name)
        mel.eval('''setCharacterObject("pinky_metacarpal_l_drv","%s",150,0);'''%char_name)
        mel.eval('''setCharacterObject("pinky_01_l_drv","%s",66,0);'''%char_name)
        mel.eval('''setCharacterObject("pinky_02_l_drv","%s",67,0);'''%char_name)
        mel.eval('''setCharacterObject("pinky_03_l_drv","%s",68,0);'''%char_name)
        #mel.eval('''setCharacterObject("pinky_04_l_drv1","%s",69,0);'''%char_name)
        mel.eval('''setCharacterObject("clavicle_r_drv","%s",19,0);'''%char_name)
        mel.eval('''setCharacterObject("upperarm_r_drv","%s",12,0);'''%char_name)
        mel.eval('''setCharacterObject("lowerarm_r_drv","%s",13,0);'''%char_name)
        mel.eval('''setCharacterObject("hand_r_drv","%s",14,0);'''%char_name)
        mel.eval('''setCharacterObject("thumb_01_r_drv","%s",74,0);'''%char_name)
        mel.eval('''setCharacterObject("thumb_02_r_drv","%s",75,0);'''%char_name)
        mel.eval('''setCharacterObject("thumb_03_r_drv","%s",76,0);'''%char_name)
        #mel.eval('''setCharacterObject("thumb_04_r_drv1","%s",77,0);'''%char_name)
        mel.eval('''setCharacterObject("index_metacarpal_r_drv","%s",153,0);'''%char_name)
        mel.eval('''setCharacterObject("index_01_r_drv","%s",78,0);'''%char_name)
        mel.eval('''setCharacterObject("index_02_r_drv","%s",79,0);'''%char_name)
        mel.eval('''setCharacterObject("index_03_r_drv","%s",80,0);'''%char_name)
        #mel.eval('''setCharacterObject("index_04_r_drv1","%s",81,0);'''%char_name)
        mel.eval('''setCharacterObject("middle_metacarpal_r_drv","%s",154,0);'''%char_name)
        mel.eval('''setCharacterObject("middle_01_r_drv","%s",82,0);'''%char_name)
        mel.eval('''setCharacterObject("middle_02_r_drv","%s",83,0);'''%char_name)
        mel.eval('''setCharacterObject("middle_03_r_drv","%s",84,0);'''%char_name)
        #mel.eval('''setCharacterObject("middle_04_r_drv1","%s",85,0);'''%char_name)
        mel.eval('''setCharacterObject("ring_metacarpal_r_drv","%s",155,0);'''%char_name)
        mel.eval('''setCharacterObject("ring_01_r_drv","%s",86,0);'''%char_name)
        mel.eval('''setCharacterObject("ring_02_r_drv","%s",87,0);'''%char_name)
        mel.eval('''setCharacterObject("ring_03_r_drv","%s",88,0);'''%char_name)
        #mel.eval('''setCharacterObject("ring_04_r_drv1","%s",89,0);'''%char_name)
        mel.eval('''setCharacterObject("pinky_metacarpal_r_drv","%s",156,0);'''%char_name)
        mel.eval('''setCharacterObject("pinky_01_r_drv","%s",90,0);'''%char_name)
        mel.eval('''setCharacterObject("pinky_02_r_drv","%s",91,0);'''%char_name)
        mel.eval('''setCharacterObject("pinky_03_r_drv","%s",92,0);'''%char_name)
        #mel.eval('''setCharacterObject("pinky_04_r_drv1","%s",93,0);'''%char_name)
        mel.eval('''setCharacterObject("thigh_l_drv","%s",2,0);'''%char_name)
        mel.eval('''setCharacterObject("thigh_r_drv","%s",5,0);'''%char_name)
        mel.eval('''setCharacterObject("calf_l_drv","%s",3,0);'''%char_name)
        mel.eval('''setCharacterObject("calf_r_drv","%s",6,0);'''%char_name)
        mel.eval('''setCharacterObject("foot_l_drv","%s",4,0);'''%char_name)
        mel.eval('''setCharacterObject("foot_r_drv","%s",7,0);'''%char_name)
        mel.eval('''setCharacterObject("ball_l_drv","%s",16,0);'''%char_name)
        mel.eval('''setCharacterObject("bigtoe_01_l_drv","%s",118,0);'''%char_name)
        mel.eval('''setCharacterObject("bigtoe_02_l_drv","%s",119,0);'''%char_name)
        mel.eval('''setCharacterObject("indextoe_01_l_drv","%s",102,0);'''%char_name)
        mel.eval('''setCharacterObject("indextoe_02_l_drv","%s",103,0);'''%char_name)
        mel.eval('''setCharacterObject("middletoe_01_l_drv","%s",106,0);'''%char_name)
        mel.eval('''setCharacterObject("middletoe_02_l_drv","%s",107,0);'''%char_name)
        mel.eval('''setCharacterObject("ringtoe_01_l_drv","%s",110,0);'''%char_name)
        mel.eval('''setCharacterObject("ringtoe_02_l_drv","%s",111,0);'''%char_name)
        mel.eval('''setCharacterObject("littletoe_01_l_drv","%s",114,0);'''%char_name)
        mel.eval('''setCharacterObject("littletoe_02_l_drv","%s",115,0);'''%char_name)
        mel.eval('''setCharacterObject("ball_r_drv","%s",17,0);'''%char_name)
        mel.eval('''setCharacterObject("littletoe_01_r_drv","%s",138,0);'''%char_name)
        mel.eval('''setCharacterObject("littletoe_02_r_drv","%s",139,0);'''%char_name)
        mel.eval('''setCharacterObject("ringtoe_01_r_drv","%s",134,0);'''%char_name)
        mel.eval('''setCharacterObject("ringtoe_02_r_drv","%s",135,0);'''%char_name)
        mel.eval('''setCharacterObject("middletoe_01_r_drv","%s",130,0);'''%char_name)
        mel.eval('''setCharacterObject("middletoe_02_r_drv","%s",131,0);'''%char_name)
        mel.eval('''setCharacterObject("indextoe_01_r_drv","%s",126,0);'''%char_name)
        mel.eval('''setCharacterObject("indextoe_02_r_drv","%s",127,0);'''%char_name)
        mel.eval('''setCharacterObject("bigtoe_01_r_drv","%s",142,0);'''%char_name)
        mel.eval('''setCharacterObject("bigtoe_02_r_drv","%s",143,0);'''%char_name)

        mel_str = '''hikSetCurrentCharacter( "%s" ); hikCreateControlRig();'''
        mel.eval( mel_str % char_name )

        cmds.setAttr("root_drv.v", 0)
        cmds.setAttr("DHIbody:root.v", 0)
        cmds.setAttr("DHIhead:spine_04.v", 0)

    def select_and_export(self,args): 

        grp = "Export_GRP"

        if not cmds.objExists("Export_GRP"):
            cmds.group(n="Export_GRP",empty=True)

        char_node = cmds.ls(type = "HIKCharacterNode")  
        ctrl_root_node = char_node[0] + "_Ctrl_Reference"

        export_list = ["head_lod2_grp", "body_lod2_grp", "root_drv", "DHIbody:root", "DHIhead:spine_04","Geo_GRP",ctrl_root_node]
        
        for obj in export_list:
            if cmds.listRelatives (obj,parent=True)[0] == grp:
                print("skip parent")
            else:
                cmds.parent(obj,grp)

        export_list.clear()

        cmds.select("Export_GRP",hi=True)
        export_list = cmds.ls(sl=True)

        export_list.extend(char_node)
        export_list.extend(cmds.ls(type = "HIKControlSetNode"))
        

        cmds.select(export_list,r=True)

        print(export_list)    

        filename = cmds.fileDialog2(fileMode = 0)[0]

        fbxOut = r'' + filename    
        
        mel.eval('FBXResetExport')
                
        mel.eval('FBXExportSmoothingGroups -v false')
        mel.eval('FBXExportSmoothMesh -v true')        
        mel.eval('FBXProperty Export|IncludeGrp|Geometry|Triangulate -v true')
        
        mel.eval('FBXProperty Export|IncludeGrp|Animation -v true')

        mel.eval('FBXExportCameras -v false')
        mel.eval('FBXExportLights -v false')

        mel.eval('FBXProperty Export|IncludeGrp|Animation|ConstraintsGrp|Constraint -v true')
        mel.eval('FBXProperty Export|IncludeGrp|Animation|ConstraintsGrp|Character -v true')
        mel.eval('FBXProperty Export|IncludeGrp|InputConnectionsGrp|IncludeChildren -v false')
        mel.eval('FBXProperty Export|IncludeGrp|InputConnectionsGrp|InputConnections -v false')
        
        mel.eval('FBXExport -f "{}" -s'.format(fbxOut))

    def showUI(self):
        
        if (cmds.window("mh_to_mobu_ui",exists = True)):  
            cmds.deleteUI("mh_to_mobu_ui")
            
        win = cmds.window("mh_to_mobu_ui",title="mh_to_mobu", widthHeight = (200,200))
        cmds.columnLayout()
        cmds.button(label="Make Tpose", command = self.make_tpose , w=120)
        cmds.button(label="Create HIK", command = self.create_def,w=120)
        cmds.button(label="Export to Mobu", command = self.select_and_export,w=120)
        cmds.showWindow(win)
    
