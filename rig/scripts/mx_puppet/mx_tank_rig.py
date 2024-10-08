#-*- coding: utf-8 -*-

import maya.api.OpenMaya as om
import maya.cmds as cmds


class MX_TankRig():

    def __init__(self):        

        #履带板
        self.track_meshes = []
        #驱动骨骼
        self.drive_jnts = []

        self.global_grp = ""
        self.global_ctrl = ""

        # create window
        ui_name = "TankTrackRigWindow"
        if cmds.window(ui_name, exists=True):
            cmds.deleteUI(ui_name)

        cmds.window(ui_name, title="Tank Track Rig Window")
        cmds.window(ui_name, e=True, widthHeight=(300, 400)) #manually set width heigh here to avoid user change

        # create layout
        cmds.columnLayout(adjustableColumn=True)

        # 创建两个文本字段
        cmds.text(label=" Tank Track Tool",h=35,align="center")

        cmds.text(label = "")
        cmds.text(label = u"1.生成曲线（可选）")
        cmds.text(label = u"选择全部履带片（旋转轴），并输入旋转轴心点")

        # create input textfield
        cmds.textField('tank_rig_ui_vtx_textfield', width=200)

        # create button
        cmds.button(label= u"生成附着曲线",command=self.create_curve, width=200)

        cmds.text(label = "")
        cmds.text(label = u"2.驱动骨骼")
        cmds.text(label = u"请选择曲线，输入履带的片数（不输入则为现有段数）")

        # create input textfield
        cmds.textField('tank_rig_ui_textfield', width=200)

        # create button
        cmds.button(label= u"创建履带驱动", command=self.create_track)


        #----------绑定
        
        cmds.text(label = "")
        cmds.text(label = u"3.绑定骨骼")

        # create button
        cmds.button(label=u"绑定", command=self.bind_skin)
        
        
        # show window
        cmds.showWindow(ui_name)
        
    def create_rig_hirarchy(self):

        self.global_grp = cmds.group(em=True,n="Track_GRP")
        self.global_ctrl = cmds.circle(r=3,ch=0,nr=[0,1,0],n="track_ctrl")[0]
        cmds.addAttr(self.global_ctrl, ln="drive",at="double", dv=0, k=True)
        cmds.parent(self.global_ctrl,self.global_grp)

        

    #Returns normal, tangent, at a given point on a curve, given the curve and a position in space.
    #result as a list of openmaya MVector()
    def getCurveNormal(self,curve_node):

        cvs = cmds.getAttr(curve_node + ".spans") + 1
        # Select the curve (replace "curve1" with the name of your curve)
        pos0 = cmds.pointPosition(curve_node + '.cv[0]')
        pos1 = cmds.pointPosition(curve_node + '.cv[%d]'%(cvs/2))
        pos2 = cmds.pointPosition(curve_node + '.cv[%d]'%cvs)
        
        # Create two vectors
        vec1 = om.MVector(pos1[0] - pos0[0],pos1[1] - pos0[1],pos1[2] - pos0[2])
        vec2 = om.MVector(pos2[0] - pos0[0],pos2[1] - pos0[1],pos2[2] - pos0[2])
        
        # Calculate the cross product
        norm = vec1 ^ vec2        
        norm = norm.normal()
        
        for i,value in enumerate(norm):
            if abs(value) < 0.00001:
                norm[i] = 0.0

        # Print the result
        return(norm)


    
    def create_curve(self,args):

        vtx_no = str(cmds.textField('tank_rig_ui_vtx_textfield', q=True, text=True))
        
        objs = cmds.ls(sl=True)

        self.track_meshes = objs

        segment = len(objs) 
        
        drv_curve = cmds.circle(center = (0,0,0),d=3, s = segment , n="drive_curve",ch=False)


        for i,obj in enumerate(objs):

            pos = cmds.pointPosition(obj + ".vtx[%s]"%vtx_no)

            cmds.move(pos[0],pos[1],pos[2],(drv_curve[0] + ".cv[%d]"%((i+1) % segment )))
        
    
    def bind_skin(self,args):

        for mesh,jnt in zip(self.track_meshes,self.drive_jnts):
            cmds.skinCluster(mesh,jnt,tsb=True)


    def create_jnts(self,name,segment):

        jnts = []

        for i in range(segment):
            cmds.select(cl=True)
            jnt = cmds.joint( n = name + "_jnt%03d"%i , p = (0,0,0))
            jnts.append(jnt)
        
        self.drive_jnts = sorted(jnts)

        
    def drive_jnt(self,nurbs,jnts):

        '''drive jnt alone the surface'''

        exp_str = ""

        oNurbs = cmds.listRelatives(nurbs)[0]
    
        maxU = cmds.getAttr(oNurbs + ".minMaxRangeU")[0][1]

        uPos = 0
        vPos = 0.5

        for i,jnt in enumerate(jnts):
            
            uPos = i * maxU / len(jnts) 
        
            '''make a nurbs surface and attach the joint to it'''

            pointOnSurface = cmds.createNode('pointOnSurfaceInfo')

            cmds.setAttr(pointOnSurface + ".parameterU",uPos)
            cmds.setAttr(pointOnSurface + ".parameterV",vPos)

            exp_str += "%s.parameterU = (%d + sign(%s.drive) * abs(%s.drive) %% %d + %f) %% %d;\n"%(pointOnSurface, maxU,self.global_ctrl,self.global_ctrl,maxU,uPos,maxU) #expression string

            cmds.connectAttr(oNurbs + ".worldSpace", pointOnSurface + ".inputSurface")
            # Compose a 4x4 matrix
            mtx = cmds.createNode('fourByFourMatrix')


            cmds.connectAttr(mtx+".output",jnt + ".offsetParentMatrix")            
            
            '''
            https://forums.cgsociety.org/t/rotations-by-surface-normal/1228039/4
            # Normalize these vectors
            [tanu.x, tanu.y, tanu.z, 0]
            [norm.x, norm.y, norm.z, 0]
            [tanv.x, tanv.y, tanv.z, 0]
            # World space position
            [pos.x, pos.y, pos.z, 1]
            '''

            cmds.connectAttr( pointOnSurface +".normalizedTangentUX", mtx+".in00")
            cmds.connectAttr( pointOnSurface +".normalizedTangentUY", mtx+".in01")
            cmds.connectAttr(pointOnSurface +".normalizedTangentUZ", mtx+".in02")
            cmds.setAttr(mtx + ".in03",0)

            cmds.connectAttr(pointOnSurface +".normalizedNormalX", mtx+".in10")
            cmds.connectAttr(pointOnSurface +".normalizedNormalY", mtx+".in11")
            cmds.connectAttr(pointOnSurface +".normalizedNormalZ", mtx+".in12")
            cmds.setAttr(mtx + ".in13",0)

            cmds.connectAttr(pointOnSurface +".normalizedTangentVX", mtx+".in20")
            cmds.connectAttr(pointOnSurface +".normalizedTangentVY", mtx+".in21")
            cmds.connectAttr(pointOnSurface +".normalizedTangentVZ", mtx+".in22")
            cmds.setAttr(mtx + ".in23",0)

            cmds.connectAttr(pointOnSurface +".positionX", mtx+".in30")
            cmds.connectAttr(pointOnSurface +".positionY", mtx+".in31")
            cmds.connectAttr(pointOnSurface +".positionZ", mtx+".in32")
            cmds.setAttr(mtx + ".in33",1)

        cmds.expression(s = exp_str)


    def create_track(self,args):

        curves = cmds.ls(sl=True)

        self.create_rig_hirarchy()
                
        segment = 3

        #从输入框获取文本
        segment_value = cmds.textField('tank_rig_ui_textfield', q=True, text=True)
        
        for curve_node in curves:

            curve_node_shape = cmds.listRelatives(curve_node)[0]

            if segment_value:
                segment = int(segment_value)         
                #rebuild rail curve      
                cmds.rebuildCurve(curve_node, ch = False, rpo = True, rt = False, end = True, kr = 2, kcp = 0, kep = True, kt = False, s = segment, d = 3, tol = 0.01)
            else:
                segment = cmds.getAttr(curve_node_shape + ".spans")

            #duplicate a new curve and offset
            new_curve = cmds.duplicate(curve_node)
            normal = self.getCurveNormal(curve_node)     

            cmds.move(-normal[0],-normal[1],-normal[2],new_curve)

            #give new curve a blendshape
            cmds.blendShape(curve_node,new_curve, w=(0,1.0))

            #create a nurbs surface
            surf = cmds.loft(new_curve, curve_node, ch=True, u = 1, c = 0, ar = 1, d = 3, ss = 1, rn = 0, po = 0, rsn = True)[0]

            #drive joints
            self.create_jnts("drive_jnt",segment)
            self.drive_jnt(surf,self.drive_jnts)