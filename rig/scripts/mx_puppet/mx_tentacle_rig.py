#-*- coding: utf-8 -*-

import maya.cmds as cmds
import maya.mel as mel

class MX_TentacleRig():

    def __init__(self):
                
        self.loc_list = []
        self.deform_plane_list = []

        self.global_grp = ""
        self.global_ctrl = ""        
        self.ctrl_grp = ""

        self.start_pos = 0.0
        self.mid_pos = 0.0
        self.end_pos = 0.0       

        # create window

        ui_name = "TentacleRigWindow"
        #检查窗口是否已存在，如果存在则删除
        if cmds.window(ui_name, exists=True):
            cmds.deleteUI(ui_name, window=True)
    
        # 创建新窗口
        cmds.window(ui_name, title="Rig Tentacle Window")
        cmds.window(ui_name, e=True, widthHeight=(200, 200)) #manually set width heigh here to avoid user change
        
        # 创建布局
        cmds.columnLayout(adjustableColumn=True)
        
        # 创建两个文本字段
        cmds.text(label=" Tentacle Rigging Tool",h=35)
        cmds.text(label=" Controller Count:",h=25,align='left')
        self.text_field1 = cmds.textField(placeholderText="Controller Count",text="10")

        # 创建两个按钮，并为它们设置命令
        button1 = cmds.button(label="create prepare rig", h=25, command=lambda x: self.prepare_rig())
        button2 = cmds.button(label="rig", h=25, command=lambda x: self.rig_tentacle())
        
        # 显示窗口
        cmds.showWindow(ui_name)
            
    def create_ctrl_curve(self, type, name):
        '''
        create ctrl curves
        '''  
        
        if type == 1: #circle
            ctrl = mel.eval("circle -c 0 0 0 -nr 0 1 0 -sw 360 -r 2 -d 3 -ut 0 -tol 0.01 -s 8 -ch 0 -n {};".format(name))[0]
        if type == 2: #cross
            ctrl = mel.eval("curve -d 1 -p -0.5 0 -2.5 -p 0.5 0 -2.5 -p 0.5 0 -0.5 -p 2.5 0 -0.5 -p 2.5 0 0.5 -p 0.5 0 0.5 -p 0.5 0 2.5 -p -0.5 0 2.5 -p -0.5 0 0.5 -p -2.5 0 0.5 -p -2.5 0 -0.5 -p -0.5 0 -0.5 -p -0.5 0 -2.5 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12 -n {};".format(name))
        if type == 3: #cross in cycle       
            ctrl = mel.eval("curve -d 1 -p 0 0 -1 -p 0.309017 0 -0.951057 -p 0.587786 0 -0.809017 -p 0.809018 0 -0.587786 -p 0.951057 0 -0.309017 -p 1 0 0 -p 0.951057 0 0.309017 -p 0.809017 0 0.587785 -p 0.587785 0 0.809017 -p 0.309017 0 0.951057 -p -2.98023e-08 0 1 -p -0.309017 0 0.951057 -p -0.587785 0 0.809017 -p -0.809017 0 0.587785 -p -0.951057 0 0.309017 -p -1 0 0 -p -0.951057 0 -0.309017 -p -0.809017 0 -0.587785 -p -0.587785 0 -0.809017 -p -0.309017 0 -0.951057 -p 0 0 -1 -p 0.309017 0 -0.951057 -p 0.587786 0 -0.809017 -p 0.698402 0 -0.698402 -p -0.698401 0 0.698401 -p -0.809017 0 0.587785 -p -0.951057 0 0.309017 -p -1 0 0 -p -0.951057 0 -0.309017 -p -0.809017 0 -0.587785 -p -0.698401 0 -0.698401 -p 0.698401 0 0.698401 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12 -k 13 -k 14 -k 15 -k 16 -k 17 -k 18 -k 19 -k 20 -k 21 -k 22 -k 23 -k 24 -k 25 -k 26 -k 27 -k 28 -k 29 -k 30 -k 31 -n {};".format(name))
        if type == 4: #cube
            ctrl = mel.eval("curve -d 1 -p 0.5 0.5 0.5 -p 0.5 0.5 -0.5 -p -0.5 0.5 -0.5 -p -0.5 0.5 0.5 -p 0.5 0.5 0.5 -p 0.5 -0.5 0.5 -p -0.5 -0.5 0.5 -p -0.5 0.5 0.5 -p -0.5 0.5 -0.5 -p -0.5 -0.5 -0.5 -p -0.5 -0.5 0.5 -p 0.5 -0.5 0.5 -p 0.5 -0.5 -0.5 -p -0.5 -0.5 -0.5 -p -0.5 0.5 -0.5 -p 0.5 0.5 -0.5 -p 0.5 -0.5 -0.5 -p 0.5 -0.5 0.5 -p 0.5 0.5 0.5 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12 -k 13 -k 14 -k 15 -k 16 -k 17 -k 18 -n {};".format(name)) 
        if type == 5: #pramid
            ctrl = mel.eval("curve -d 1 -p 1 0 -1 -p -1 0 -1 -p -1 0 1 -p 1 0 1 -p 1 0 -1 -p 0 1.414214 0 -p -1 0 -1 -p -1 0 1 -p 0 1.414214 0 -p 1 0 1 -p 1 0 -1 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -n {};".format(name))
        if type == 6: #sphere
            ctrl = mel.eval("curve -d 1 -p 0 1 0 -p 0.258819 0.965926 0 -p 0.5 0.866025 0 -p 0.707107 0.707107 0 -p 0.866025 0.5 0 -p 0.965926 0.258819 0 -p 1 0 0 -p 0.965926 -0.258819 0 -p 0.866025 -0.5 0 -p 0.707107 -0.707107 0 -p 0.5 -0.866025 0 -p 0.258819 -0.965926 0 -p 0 -1 0 -p -0.258819 -0.965926 0 -p -0.5 -0.866025 0 -p -0.707107 -0.707107 0 -p -0.866025 -0.5 0 -p -0.965926 -0.258819 0 -p -1 0 0 -p -0.965926 0.258819 0 -p -0.866025 0.5 0 -p -0.707107 0.707107 0 -p -0.5 0.866025 0 -p -0.258819 0.965926 0 -p 0 1 0 -p 0 0.965926 0.258819 -p 0 0.866025 0.5 -p 0 0.707107 0.707107 -p 0 0.5 0.866025 -p 0 0.258819 0.965926 -p 0 0 1 -p 0 -0.258819 0.965926 -p 0 -0.5 0.866025 -p 0 -0.707107 0.707107 -p 0 -0.866025 0.5 -p 0 -0.965926 0.258819 -p 0 -1 0 -p 0 -0.965926 -0.258819 -p 0 -0.866025 -0.5 -p 0 -0.707107 -0.707107 -p 0 -0.5 -0.866025 -p 0 -0.258819 -0.965926 -p 0 0 -1 -p 0 0.258819 -0.965926 -p 0 0.5 -0.866025 -p 0 0.707107 -0.707107 -p 0 0.866025 -0.5 -p 0 0.965926 -0.258819 -p 0 1 0 -p 0 0.965926 0.258819 -p 0 0.866025 0.5 -p 0 0.707107 0.707107 -p 0 0.5 0.866025 -p 0 0.258819 0.965926 -p 0 0 1 -p -0.5 0 0.866025 -p -0.866025 0 0.5 -p -1 0 0 -p -0.866025 0 -0.5 -p -0.5 0 -0.866025 -p 0 0 -1 -p 0.5 0 -0.866025 -p 0.866025 0 -0.5 -p 1 0 0 -p 0.866025 0 0.5 -p 0.5 0 0.866025 -p 0 0 1 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12 -k 13 -k 14 -k 15 -k 16 -k 17 -k 18 -k 19 -k 20 -k 21 -k 22 -k 23 -k 24 -k 25 -k 26 -k 27 -k 28 -k 29 -k 30 -k 31 -k 32 -k 33 -k 34 -k 35 -k 36 -k 37 -k 38 -k 39 -k 40 -k 41 -k 42 -k 43 -k 44 -k 45 -k 46 -k 47 -k 48 -k 49 -k 50 -k 51 -k 52 -k 53 -k 54 -k 55 -k 56 -k 57 -k 58 -k 59 -k 60 -k 61 -k 62 -k 63 -k 64 -k 65 -k 66 -n {};".format(name))
        if type == 7: #eye
            ctrl = mel.eval("curve -d 1 -p 0.000308717 0.262495 0 -p -0.158626 0.246005 0 -p -0.309329 0.193761 0 -p -0.442149 0.105046 0 -p -0.562035 0 0 -p -0.442149 -0.105046 0 -p -0.309329 -0.193761 0 -p -0.158626 -0.246005 0 -p 0.000308717 -0.262495 0 -p 0.158626 -0.246005 0 -p 0.309329 -0.193761 0 -p 0.442149 -0.105046 0 -p 0.562035 0 0 -p 0.442149 0.105046 0 -p 0.309329 0.193761 0 -p 0.158626 0.246005 0 -p 0.000308717 0.262495 0 -p 0 0.211555 0 -p -0.0817853 0.197981 0 -p -0.151302 0.151184 0 -p -0.197447 0.082473 0 -p -0.213973 -0.0001517 0 -p -0.197447 -0.0817518 0 -p -0.151302 -0.151309 0 -p -0.0817853 -0.197446 0 -p 0 -0.213974 0 -p 0.0817853 -0.197447 0 -p 0.151302 -0.151302 0 -p 0.197447 -0.081784 0 -p 0.213973 -5.74644e-06 0 -p 0.197447 0.0818113 0 -p 0.151302 0.14819 0 -p 0.0817853 0.197981 0 -p 0 0.211555 0 -k 0 -k 1 -k 2 -k 3 -k 4 -k 5 -k 6 -k 7 -k 8 -k 9 -k 10 -k 11 -k 12 -k 13 -k 14 -k 15 -k 16 -k 17 -k 18 -k 19 -k 20 -k 21 -k 22 -k 23 -k 24 -k 25 -k 26 -k 27 -k 28 -k 29 -k 30 -k 31 -k 32 -k 33 -n {};".format(name))
        
        return ctrl         

            
    
    def create_follicle(self,fol_plane,count):
        
        fols = []
         
        #delete the cluster by clear history of fol nurbs plane
        nurbsShape = cmds.listRelatives(fol_plane, shapes=True)[0]
        
        # 沿着V方向创建100个均匀分布的follicles
        for i in range(count):
            # 计算v参数，确保follicles均匀分布
            vParam = i / float(count-1)
            
            # 创建follicle节点
            follicleShape = cmds.createNode('follicle')        
            
            # 连接NURBS平面到follicle
            cmds.connectAttr(nurbsShape + '.local', follicleShape + '.inputSurface')
            cmds.connectAttr(nurbsShape + '.worldMatrix[0]', follicleShape + '.inputWorldMatrix')
            
            # 设置follicle参数
            cmds.setAttr(follicleShape + '.parameterU', 0.5) # U方向中心
            cmds.setAttr(follicleShape + '.parameterV', vParam) # V方向均匀分布
            
            # 将follicle连接到其变换节点
            transformNode = cmds.listRelatives(follicleShape, parent=True)[0]
            cmds.connectAttr(follicleShape + '.outTranslate', transformNode + '.translate')
            cmds.connectAttr(follicleShape + '.outRotate', transformNode + '.rotate')
            
            fols.append(transformNode)
            
        return fols                

    
    def place_joint_under_fol(self,fol_list):
        '''
        create joint under each follicle
        '''    
        for i, fol in enumerate(fol_list):
            
            cmds.select(cl=True)
            pos = cmds.xform(fol,ws=True,q=True,t=True)
            jnt = cmds.joint(n= "{}_jnt_{}".format(fol,i), p=pos)
            cmds.parent(jnt,fol)
    
    def prepare_rig(self):

        #create global group
        self.global_grp = cmds.group(em=True,n="Tentacle_GRP")

        #create global ctrl
        self.global_ctrl = self.create_ctrl_curve(1,name="tentacle_ctrl")
        self.ctrl_grp = cmds.group(em=True, n="Ctrl_GRP")

        cmds.parent(self.global_ctrl, self.ctrl_grp)
        cmds.parent(self.ctrl_grp, self.global_grp)
        
        #create 3 locator for back middle front anchors
        for i in range(3):
            loc = cmds.spaceLocator()
            cmds.xform(loc[0],t=(0,0,(i-1)*5))
            cmds.CenterPivot()
            self.loc_list.append(loc[0])
        
        #把z轴负方向的locator 关联到 z轴正方向的locator的负值
        reverse_node = cmds.createNode("multiplyDivide")
        cmds.connectAttr("{}.tx".format(self.loc_list[2]), "{}.input1X".format(reverse_node))
        cmds.connectAttr("{}.ty".format(self.loc_list[2]), "{}.input1Y".format(reverse_node))
        cmds.connectAttr("{}.tz".format(self.loc_list[2]), "{}.input1Z".format(reverse_node))

        cmds.setAttr("{}.input2X".format(reverse_node),-1)
        cmds.setAttr("{}.input2Y".format(reverse_node),-1)
        cmds.setAttr("{}.input2Z".format(reverse_node),-1)

        cmds.connectAttr("{}.outputX".format(reverse_node),"{}.tx".format(self.loc_list[0]))
        cmds.connectAttr("{}.outputY".format(reverse_node),"{}.ty".format(self.loc_list[0]))
        cmds.connectAttr("{}.outputZ".format(reverse_node),"{}.tz".format(self.loc_list[0]))

            
        #create 2 nurbsplane for adding follicles. 这里一个是变形ffd的毛囊平面，一个是占位ffd的毛囊平面 0是占位，1是变形
        for i in range(2):       
            
            deform_plane = cmds.nurbsPlane(ax=(0,1,0),d=1,n="deform_nurbsPlane_{}".format(i))
            
            cmds.select(deform_plane[0] + ".cv[0:1][1]")
            edge_cluster1 = cmds.cluster()
            
            cmds.select(deform_plane[0] + ".cv[0:1][0]")
            edge_cluster2 = cmds.cluster()
            
            cmds.pointConstraint(self.loc_list[i],edge_cluster1,mo=False)    
            cmds.pointConstraint(self.loc_list[i+1],edge_cluster2,mo=False)
            
            self.deform_plane_list.append(deform_plane[0])        
    
    def create_exp(self , fun_ctrl, roll_grp , swing_grp):
        
        #沿路径行进 表达式        
        exp_str = ""
        exp_str = "{}.translateZ = {} + -({} * {}.follow_path / 10.0);\r\n".format(self.deform_plane_list[1], self.start_pos[2], self.start_pos[2], fun_ctrl)
        cmds.expression(s=exp_str)

        #roll expression
        exp_str = ""
        for grp in roll_grp:
            if(grp==roll_grp[0]):
                continue
            exp_str += "{}.rx = {}.roll_angle;\r\n".format(grp,fun_ctrl)
        cmds.expression(s=exp_str)

        #swing expression
        exp_str = ""
        for i, grp in enumerate(swing_grp):
            
            if(grp==swing_grp[0]):
                continue
            exp_str += "{}.rx = (sin(time*{}.swing_speed+{}.swing_step*{})*{}.swing_amplitude*pow({}.swing_falloff,{}))*{}.swing_onoff;\r\n".format(grp, fun_ctrl, fun_ctrl, i*(-0.1),fun_ctrl, fun_ctrl, i, fun_ctrl )
        cmds.expression(s=exp_str)


    def rig_tentacle(self):
        '''        
        create a tentacle rig
        '''
    
        ctrl_count = int(cmds.textField(self.text_field1, query=True, text=True))
        #div_count = int(cmds.textField(self.text_field2, query=True, text=True))
        div_count = 100
     
            
        #now rebuild the deform nurbs plane
        cmds.delete(self.deform_plane_list,ch=True)
        cmds.rebuildSurface( self.deform_plane_list[1], ch=False, su=0, du=1, sv = div_count-1, dv=3)
        
        #create a ffd from nurbs plane  / ** ffd is used for path follow , the ffd's length is 2*tentacle long, so we need 2 planes 
        cmds.select(self.deform_plane_list)
        lattice_list = cmds.lattice(divisions=[2, 2, 200], objectCentered=True, name='fol_plane_lattice')
        
        sx = cmds.getAttr(lattice_list[1] + '.sx')           
        sz = cmds.getAttr(lattice_list[1] + '.sz')
        sy = sz/50.0 
        
        cmds.setAttr((lattice_list[1] + '.sy'), sy)
        cmds.setAttr((lattice_list[2] + '.sy'), sy)
        
        cmds.setAttr((lattice_list[1] + '.sx'), sx*1.05)
        cmds.setAttr((lattice_list[2] + '.sx'), sx*1.05)
        cmds.setAttr((lattice_list[1] + '.sz'), sz*1.05)
        cmds.setAttr((lattice_list[2] + '.sz'), sz*1.05)        
        
        #记录三个locator的位置，作为路径驱动的最起点、变形骨骼的起点和终点
        self.start_pos = cmds.xform(self.loc_list[0],q=True,t=True,ws=True)

        #create the deform rig structure
        self.mid_pos = cmds.xform(self.loc_list[1],q=True,t=True,ws=True)
        self.end_pos = cmds.xform(self.loc_list[2],q=True,t=True,ws=True)   
        
        #delete locator        
        cmds.delete(self.loc_list)
        
        ctrl_jnt_list = []  
        cmds.select(cl=True)     

        #创建驱动骨骼链
        for i in range(ctrl_count):
            cmds.select(cl=True)
            pos = ((self.end_pos[0]-self.mid_pos[0])/(ctrl_count - 1)*i, (self.end_pos[1]-self.mid_pos[1])/(ctrl_count - 1)*i, (self.end_pos[2]-self.mid_pos[2])/(ctrl_count - 1) * i)
            jnt = cmds.joint(p=pos,n="ctrl_jnt_{}".format(i))            
            ctrl_jnt_list.append(jnt)


        major_fk_grp = cmds.group(em=True,n="major_fk_grp")
        cmds.setAttr("{}.overrideEnabled".format(major_fk_grp),True)
        cmds.setAttr('{}.overrideRGBColors'.format(major_fk_grp), 1)
        # 设置RGB颜色值
        cmds.setAttr("{}.overrideColorRGB".format(major_fk_grp), 0, 1, 1, type='double3')

        major_ik_grp = cmds.group(em=True,n="major_ik_grp")
        cmds.setAttr ("{}.overrideEnabled".format(major_ik_grp),True)
        cmds.setAttr('{}.overrideRGBColors'.format(major_ik_grp), 1)
        # 设置RGB颜色值
        cmds.setAttr("{}.overrideColorRGB".format(major_ik_grp), 1, 1, 0, type='double3')

        roll_grp =[]
        swing_grp = []
        #创建控制器
        for i in range(ctrl_count):
            pos =  ((self.end_pos[0]-self.mid_pos[0])/(ctrl_count - 1)*i, (self.end_pos[1]-self.mid_pos[1])/(ctrl_count - 1)*i, (self.end_pos[2]-self.mid_pos[2])/(ctrl_count - 1) * i)
            #fk 控制器
            major_fk_ctrl = self.create_ctrl_curve(4,"major_fk_ctrl{}".format(i+1)) 
            cmds.xform(major_fk_ctrl, t = pos)
            cmds.scale(2,2,0.2, major_fk_ctrl)
            cmds.makeIdentity(major_fk_ctrl,a=True)

            grp = cmds.group(major_fk_ctrl,n="major_fk_ctrl_swing_grp{}".format(i+1))
            swing_grp.append(grp)
            grp = cmds.group(grp,n="major_fk_ctrl_roll_grp{}".format(i+1))
            roll_grp.append(grp)
            grp = cmds.group(grp,n="major_fk_ctrl_grp{}".format(i+1))
            
            if i == 0:
                cmds.parent(grp,major_fk_grp)
            else:
                cmds.parent("major_fk_ctrl_grp{}".format(i+1),"major_fk_ctrl{}".format(i)) # establish fk hirarachy


            #ik 控制器
            major_ik_ctrl = self.create_ctrl_curve(3, "major_ik_ctrl{}".format(i+1))
            cmds.xform(major_ik_ctrl, t = pos)
            cmds.rotate('90deg', 0, 0, major_ik_ctrl)
            cmds.makeIdentity(major_ik_ctrl,a=True)

            cmds.parent(ctrl_jnt_list[i],major_ik_ctrl)

            grp = cmds.group(major_ik_ctrl, n="major_ik_ctrl_grp{}".format(i+1)) 

            cmds.parent(grp, major_ik_grp)                
            cmds.parentConstraint(major_fk_ctrl, grp) #make constraint / use fk controller to control the ik group


            if(i==ctrl_count-1):
                #add a functional ctrl            
                fun_ctrl = self.create_ctrl_curve(2,"fun_ctrl")
                cmds.xform(fun_ctrl, t = (pos[0],pos[1],pos[2]+1))
                cmds.rotate('90deg', 0, 0, fun_ctrl)
                cmds.scale(0.3,0.3,0.3,fun_ctrl)
                cmds.makeIdentity(fun_ctrl,a=True)
                cmds.parent(fun_ctrl,"major_ik_ctrl{}".format(i+1))
                
                #添加属性
                #separator
                cmds.addAttr(fun_ctrl,ln="path", at ="double" )
                cmds.setAttr("{}.path".format(fun_ctrl) ,e=True,l=True, keyable=True )

                #follow path
                cmds.addAttr(fun_ctrl,ln="follow_path",at="double",min=0, max=10,dv=10 )
                cmds.setAttr("{}.follow_path".format(fun_ctrl), e=True, keyable=True)

                #separator
                cmds.addAttr(fun_ctrl,ln="roll", at ="double" )
                cmds.setAttr("{}.roll".format(fun_ctrl) ,e=True,l=True, keyable=True )

                #roll
                cmds.addAttr(fun_ctrl, ln="roll_angle", at="double", min = -90, max = 90, dv = 0)
                cmds.setAttr("{}.roll_angle".format(fun_ctrl), e=True, keyable=True)
                
                #separator
                cmds.addAttr(fun_ctrl,ln="swing", at ="double" )
                cmds.setAttr("{}.swing".format(fun_ctrl) ,e=True,l=True, keyable=True )

                #swing
                cmds.addAttr(fun_ctrl,ln="swing_onoff", at ="double", min=0,max=1,dv=0) #开关
                cmds.setAttr("{}.swing_onoff".format(fun_ctrl), e=True, keyable=True)

                cmds.addAttr(fun_ctrl,ln="swing_speed", at ="double",dv=1) #速度
                cmds.setAttr("{}.swing_speed".format(fun_ctrl), e=True, keyable=True)

                cmds.addAttr(fun_ctrl,ln="swing_amplitude", at ="double",dv=5) #幅度
                cmds.setAttr("{}.swing_amplitude".format(fun_ctrl), e=True, keyable=True)

                cmds.addAttr(fun_ctrl,ln="swing_step", at ="double",dv=4) #步长
                cmds.setAttr("{}.swing_step".format(fun_ctrl), e=True, keyable=True)

                cmds.addAttr(fun_ctrl,ln="swing_falloff", at ="double",dv=1, min=0,max=1.2) #衰减
                cmds.setAttr("{}.swing_falloff".format(fun_ctrl), e=True, keyable=True)

                self.create_exp(fun_ctrl, roll_grp , swing_grp)
        
        # duplicate the nurbs plane for skin the lattice      
        skin_lattice_plane_list = []        
        for deform_plane in self.deform_plane_list:  

            skin_lattice_plane = cmds.duplicate(deform_plane,rr=True,n="lattice_fol_plane")[0]
            cmds.rebuildSurface(skin_lattice_plane, ch= False, su=0, du=1, sv=ctrl_count-1, dv=3)
            skin_lattice_plane_list.append(skin_lattice_plane)
            
            if(i==0):                
                #skin the fol nurbs plane
                cmds.select(ctrl_jnt_list[0], r=True)
                cmds.select(skin_lattice_plane,add=True)                
                cmds.skinCluster(tsb=True,maximumInfluences=1)                
            else:
                #skin the fol nurbs plane
                cmds.select(ctrl_jnt_list, hi=True, r=True)
                cmds.select(skin_lattice_plane,add=True)                
                cmds.skinCluster(tsb=True,maximumInfluences=1)
        
        fol_list = []
        fol_grp = cmds.group(n="fol_group",em=True)
        #create follicles 并且连接global ctrl 和 follicle 的缩放，

        for i,skin_lattice_plane in enumerate(skin_lattice_plane_list):

            fol_list.extend(self.create_follicle(skin_lattice_plane, div_count))

        for  fol in fol_list:
            cmds.connectAttr("{}.sx".format(self.global_ctrl) , "{}.sx".format(fol))
            cmds.connectAttr("{}.sy".format(self.global_ctrl) , "{}.sy".format(fol))
            cmds.connectAttr("{}.sz".format(self.global_ctrl) , "{}.sz".format(fol))

        cmds.parent(fol_list,fol_grp)
        
        #create joint under fols , this is joint to skin lattice
        self.place_joint_under_fol(fol_list)
        
        cmds.select(fol_grp,hi=True)
        ffd_skin_jnt_list = cmds.ls(sl=True,type="joint")
        
        cmds.select(ffd_skin_jnt_list,r=True)
        cmds.select(lattice_list[1],add=True)
        
        cmds.skinCluster()
        
        #create sub ctrl follicle        
        fol_list = self.create_follicle(self.deform_plane_list[1], ctrl_count*2 - 1)
        cmds.parent(fol_list,fol_grp)

        #create sub controllers
        sub_ctrl_grp = cmds.group(em=True, n="sub_ctrl_grp")
        cmds.setAttr("{}.overrideEnabled".format(sub_ctrl_grp),True)
        cmds.setAttr('{}.overrideRGBColors'.format(sub_ctrl_grp), 1)
        # 设置RGB颜色值
        cmds.setAttr("{}.overrideColorRGB".format(sub_ctrl_grp), 1, 0.7, 0.5, type='double3')
        
        #create deform joints
        deform_jnt_list = []
        
        fol_list.reverse()  #reverse the follicle list to make the order incresing
                
        for i, fol in enumerate(fol_list):
            cmds.select(cl=True)
    
            jnt = cmds.joint(n="deform_jnt_{}".format(i))

            #create sub ctrl curve                        
            sub_ctrl = self.create_ctrl_curve(1,"sub_ctrl{}".format(i+1))
            temp_grp = cmds.group(sub_ctrl,p=sub_ctrl_grp,n="sub_ctrl_grp{}".format(i))

            cmds.scale(0.3,0.3,0.3,sub_ctrl)
            cmds.makeIdentity(sub_ctrl,a=True)
            cmds.connectAttr("{}.worldMatrix".format(fol),"{}.offsetParentMatrix".format(temp_grp))            
            cmds.parentConstraint(sub_ctrl,jnt,mo=False) #drive the deform joint

            cmds.scaleConstraint(self.global_ctrl,temp_grp,mo=True)

            deform_jnt_list.append(jnt)

        cmds.select(cl=True)
        
        deform_grp = cmds.group(em=True,n="Deform_Joint_GRP",p=self.global_grp) #变形组
        cmds.parent(deform_jnt_list,deform_grp)
        cmds.scaleConstraint(self.global_ctrl,deform_grp) #做缩放约束
        
        for i in range(len(deform_jnt_list)):
            if(i== len(deform_jnt_list) -1 ):                
                break                 
            cmds.parent(deform_jnt_list[i+1],deform_jnt_list[i])
        
        #整理到组里
        grp = cmds.group(em=True,n="Fixed_GRP",p=self.global_grp)
        
        cmds.parent(major_fk_grp,self.global_ctrl)
        cmds.parent(major_ik_grp,self.global_ctrl)
        cmds.parent(sub_ctrl_grp,self.ctrl_grp)
        
        cmds.parent(fol_grp,grp)
        cmds.parent(self.deform_plane_list,grp)
        cmds.parent(skin_lattice_plane_list,grp)
        cmds.parent(lattice_list,grp)

        cmds.setAttr("{}.v".format(grp),0)
