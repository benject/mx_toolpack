#-*- coding: utf-8 -*-

import maya.api.OpenMaya as om
import maya.cmds as cmds

class MX_BeltRig():

    def __init__(self):        

        #驱动骨骼
        self.skin_jnts = []

        # create window

        ui_name  = "Belt_Rig"
             
        if cmds.window(ui_name, exists=True):
            cmds.deleteUI(ui_name)
             
        # 创建新窗口
        cmds.window(ui_name, title="Belt Rig Window")
        cmds.window(ui_name, e=True, widthHeight=(300, 200)) #manually set width heigh here to avoid user change
      

        # create layout
        cmds.columnLayout(adjustableColumn=True)

        cmds.text(label=" Belt Rigging Tool",h=35)
        cmds.text(label = "")
        cmds.text(label = u"驱动骨骼")
        cmds.text(label = u"请选择曲面，输入驱动骨骼的个数（不输入则为现有段数）")

        # create input textfield
        cmds.textField('belt_rig_ui_textfield', width=200)

        # create checkbox
        #cmds.checkBox('uv_checkbox', label=u"UV 调换", value=False)

        # create button
        cmds.button(label= u"创建背带驱动", command=self.rig_belt)

        # show window
        cmds.showWindow(ui_name)
    


    def create_jnts(self,name,segment):

        '''create segment number of joints'''

        jnts = []

        for i in range(segment):
            cmds.select(cl=True)
            jnt = cmds.joint( n = name + "_%03d"%i , p = (0,0,0))
            jnts.append(jnt)
        
        self.skin_jnts = sorted(jnts)



        
    def place_jnt(self,nurbs,jnts):

        '''place jnt alone the surface'''
        
        oNurbs = cmds.listRelatives(nurbs)[0]
    
        #maxU = cmds.getAttr(oNurbs + ".minMaxRangeU")[0][1]
        #maxV = cmds.getAttr(oNurbs + ".minMaxRangeV")[0][1]        

        jnt_grp = cmds.group(n= nurbs[0] + "_skin_jnt_grp",em=True)
        fol_grp = cmds.group(n= nurbs[0] + "_drv_fol_grp",em=True)

        cmds.select(cl=True)

        for i,jnt in enumerate(jnts):        
            
            # 创建毛囊节点
            follicle_shape = cmds.createNode('follicle', name= jnt + 'follicleShape')
            fol = cmds.listRelatives(follicle_shape, parent=True)[0]

            # 将毛囊附加到指定的 NURBS 曲面
            cmds.connectAttr(oNurbs + '.worldSpace', follicle_shape + '.inputSurface')

            # 设置 UV 坐标

            #close surface
            if(cmds.getAttr(oNurbs +'.formU')==2): 
                uPos = i / (len(jnts))
            else:
                uPos = i / (len(jnts) - 1)

            vPos = 0.5
            cmds.setAttr(follicle_shape + '.parameterU', uPos)
            cmds.setAttr(follicle_shape + '.parameterV', vPos)


            # 将毛囊的输出连接到毛囊的变换
            cmds.connectAttr(follicle_shape + '.outTranslate', fol + '.translate')
            cmds.connectAttr(follicle_shape + '.outRotate', fol + '.rotate')


            cmds.parent(fol,fol_grp)

            #创建控制器
            ctrl_grp = cmds.group(n= jnt + "_grp" + "_%03d"%i,em=True)
            ctrl = cmds.circle(n = jnt + "_ctrl" + "_%03d"%i)[0]

            cmds.parent(ctrl,ctrl_grp)
            cmds.parent(ctrl_grp,fol)

            cmds.setAttr(ctrl_grp+".tx" ,0)
            cmds.setAttr(ctrl_grp+".ty" ,0)
            cmds.setAttr(ctrl_grp+".tz" ,0)
            cmds.setAttr(ctrl_grp+".rx" ,0)
            cmds.setAttr(ctrl_grp+".ry" ,0)
            cmds.setAttr(ctrl_grp+".rz" ,0)

            cmds.parentConstraint(ctrl,jnt)

            cmds.parent(jnt,jnt_grp)


    #main function
    def rig_belt(self,args): 
                
        segment = 3

        surf_node = cmds.ls(sl=True)

        #从输入框获取文本
        segment_value = cmds.textField('belt_rig_ui_textfield', q=True, text=True)

        surf_node_shape=cmds.listRelatives(surf_node)[0]
                
        if segment_value:
            segment = int(segment_value)    

            #close surface
            if(cmds.getAttr(surf_node_shape + '.formU')==2):    
                #rebuild close curve
                cmds.rebuildSurface(surf_node, ch = False, rpo = True, rt = False, end = True, kr = 2, kcp = 0, sv = 3, su = segment, du = 3, dv = 3, tol = 0.01)
            else:
                #rebuild rail curve
                cmds.rebuildSurface(surf_node, ch = False, rpo = True, rt = False, end = True, kr = 2, kcp = 0, sv = 3, su = segment-1, du = 3, dv = 3, tol = 0.01)

        else:
            segment = cmds.getAttr(surf_node_shape + ".spansUV")[0][1] + cmds.getAttr(surf_node_shape+".degreeUV")[0][1] - 2 #segment = degreeU + spanU

        #drive joints
        self.create_jnts(surf_node_shape + "_skin_jnt", segment)
        self.place_jnt(surf_node, self.skin_jnts)