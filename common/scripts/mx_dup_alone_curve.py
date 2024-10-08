# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel

class MX_DupAloneCurve():

    def __init__(self):


        # create window

        ui = "dup_ui"
                
        if cmds.window(ui, exists=True):
            cmds.deleteUI(ui)
                
        window = cmds.window(ui,wh=[240,140])

        # create layout
        cmds.columnLayout()

        cmds.text(label = "")
        cmds.text(label = u"首先选曲线，再选复制物体")

        # create input textfield
        cmds.text(label = "")
        cmds.text(label = u"输入复制数量")
        cmds.textField("number_textfield", width=200)

        cmds.checkBox('followChkBox', label='follow')
         # create button
        cmds.button(label= u"复制",command=self.dup_alone_curve, width=200)      
        
        # create button
        cmds.button(label= u"删除链接",command=self.delete_connection, width=200)      
        
        # 设置窗口宽度
        cmds.window(window, edit=True, widthHeight=(240, 140))

        # show window
        cmds.showWindow(window)


    def dup_alone_curve(self,args):
        

        num_objs = int(cmds.textField("number_textfield", q=True, text=True))

        sel = cmds.ls(sl=True)

        if(len(sel)<2):
            cmds.warning("please select at least curve and something!")

        else:
            shape = cmds.listRelatives(sel[0])[0]
            if(not cmds.nodeType(shape)=="nurbsCurve"):
                cmds.warning("first selection must be curve!")

            else:

                form = cmds.getAttr("{}.form".format(shape))

                if(form==0): #open curve
                    for i in range(0,num_objs):
                        space = 1.0 / (num_objs - 1)
                        duplicate = cmds.duplicate(sel[1], name='{}_duplicate{}'.format(sel[1], i+1))[0]
                    
                        if cmds.checkBox('followChkBox', query=True, value=True):
                            #with rotation                            
                            mp = cmds.createNode("motionPath")   #use motionPath node other than pathAnimation to avoid undo bug         
                            
                            cmds.setAttr("{}.uValue".format(mp),i*space)
                            cmds.setAttr("{}.fractionMode".format(mp),1)
                            cmds.setAttr("{}.follow".format(mp),1)
                            cmds.connectAttr("{}.worldSpace[0]".format(shape), "{}.geometryPath".format(mp))
                            cmds.connectAttr("{}.allCoordinates".format(mp), "{}.translate".format(duplicate))
                            cmds.connectAttr("{}.rotate".format(mp), "{}.rotate".format(duplicate))
                            
                            if not cmds.attributeQuery("notes", n = mp, ex = True):
                                cmds.addAttr(mp, ln = "notes", sn="nts", dt="string")
                                cmds.setAttr("{}.notes".format(mp), "mx_toolpack", type="string")

                        else:
                            #only position                        
                            position = cmds.pointOnCurve(shape , pr= i*space,top=True)
                            cmds.move(position[0], position[1], position[2], duplicate)

                elif(form==2): #close curve
                    for i in range(0,num_objs):
                        space = 1.0 / (num_objs)
                        duplicate = cmds.duplicate(sel[1], name='{}_duplicate{}'.format(sel[1], i+1))[0]

                        if cmds.checkBox('followChkBox', query=True, value=True):
                            #with rotation
                            mp = cmds.createNode("motionPath")       #use motionPath node other than pathAnimation to avoid undo bug                     
                            
                            cmds.setAttr("{}.uValue".format(mp),i*space)                            
                            cmds.setAttr("{}.fractionMode".format(mp),1)
                            cmds.setAttr("{}.follow".format(mp),1)
                            cmds.connectAttr("{}.worldSpace[0]".format(shape), "{}.geometryPath".format(mp))
                            cmds.connectAttr("{}.allCoordinates".format(mp), "{}.translate".format(duplicate))
                            cmds.connectAttr("{}.rotate".format(mp), "{}.rotate".format(duplicate))

                            if not cmds.attributeQuery("notes", n = mp, ex = True):
                                cmds.addAttr(mp, ln = "notes", sn="nts", dt="string")
                                cmds.setAttr("{}.notes".format(mp), "mx_toolpack", type="string")

                        else:
                            #only position                        
                            position = cmds.pointOnCurve(shape , pr= i*space,top=True)
                            cmds.move(position[0], position[1], position[2], duplicate)


    def delete_connection(self,args):

        sel = cmds.ls(sl=True)
        sel_shape = cmds.listRelatives(sel[0])[0]
        mps = cmds.listConnections(sel_shape, t="motionPath", d=True)

        for mp in mps:
            if  cmds.attributeQuery("notes", n = mp, ex = True) and (cmds.getAttr("{}.notes".format(mp)) == "mx_toolpack"):
                cmds.delete(mp)
