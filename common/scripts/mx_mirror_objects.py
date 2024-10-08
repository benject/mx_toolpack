# -*- coding: utf-8 -*-

import maya.cmds as cmds


class MX_MirrorObjects():

    def __init__(self):
        if cmds.window('mirrorToolWin', exists=True):
            cmds.deleteUI('mirrorToolWin')
        
        win = cmds.window('mirrorToolWin', title='mirrorToolWin', widthHeight=(400, 100))
        cmds.columnLayout(adj=True)
        
        # 行 1：源字符输入
        cmds.rowLayout(nc=2, adj=2)
        cmds.text(label=' Search For :')
        cmds.textField('srcField', pht='输入源字符')
        cmds.setParent('..')  # 结束 rowLayout
        
        # 行 2：替换字符输入
        cmds.rowLayout(nc=2, adj=2)
        cmds.text(label=' Replace With :')
        cmds.textField('replField', pht='输入替换字符')
        cmds.setParent('..')  # 结束 rowLayout
    
        # 行 3：选择镜像轴
        cmds.radioButtonGrp('axisRadioButton', label=' Mirror Axis', labelArray3=['X ', 'Y ', 'Z '], numberOfRadioButtons=3, select=1, columnAlign=[1, 'left'])

        cmds.text(label=' ')
        # 按钮：执行操作
        cmds.button(label='Mirror Objects', c=lambda _: self.rename_and_mirror())
        
        cmds.window('mirrorToolWin',e=True, widthHeight=(500, 120))

        cmds.showWindow(win)
        

    def mirror_objects(self, source_obj, new_name, axis):
        
            # 复制源物体
            mirrored_obj = cmds.duplicate(source_obj, name=new_name, returnRootsOnly=True)[0]

            # 获取复制物体的世界变换矩阵
            matrix = cmds.xform(mirrored_obj, query=True, matrix=True, worldSpace=True)
            # 根据选中的轴设置镜像向量
            if axis == 1:  # X 轴 
                # 创建X轴镜像矩阵
                mirror_matrix = [-1, 0, 0, 0,
                                0, 1, 0, 0,
                                0, 0, 1, 0,
                                0, 0, 0, 1]
                
            elif axis == 2:  # Y 轴
                mirror_matrix = [ 1, 0, 0, 0,
                                0, -1, 0, 0,
                                0, 0, 1, 0,
                                0, 0, 0, 1]    
                                
            else:  # Z 轴
                mirror_matrix = [1, 0, 0, 0,
                                0, 1, 0, 0,
                                0, 0, -1, 0,
                                0, 0, 0, 1]
                
            
            # 将当前变换矩阵与X轴镜像矩阵相乘
            mirrored_matrix = [
                matrix[0] * mirror_matrix[0], matrix[1] * mirror_matrix[5], matrix[2] * mirror_matrix[10], matrix[3],
                matrix[4] * mirror_matrix[0], matrix[5] * mirror_matrix[5], matrix[6] * mirror_matrix[10], matrix[7],
                matrix[8] * mirror_matrix[0], matrix[9] * mirror_matrix[5], matrix[10] * mirror_matrix[10], matrix[11],
                matrix[12] * mirror_matrix[0], matrix[13]* mirror_matrix[5], matrix[14]* mirror_matrix[10], matrix[15]
            ]

            # 应用新的变换矩阵到镜像对象
            cmds.xform(mirrored_obj, matrix=mirrored_matrix, worldSpace=True)
            
            # 保证镜像后的缩放为正值
            current_scale = cmds.xform(mirrored_obj, query=True, scale=True, worldSpace=True)
            positive_scale = (abs(current_scale[0]), abs(current_scale[1]), abs(current_scale[2]))
            cmds.xform(mirrored_obj, scale=positive_scale)



    def rename_and_mirror(self):
        # 获取输入框的值
        source_str = cmds.textField('srcField', query=True, text=True)
        replace_str = cmds.textField('replField', query=True, text=True)
        
        # 获取选中的镜像轴
        axis = cmds.radioButtonGrp('axisRadioButton', q=True, select=True)
        
        # 获取当前选择的物体列表
        selected_objects = cmds.ls(selection=True)
        
        if not selected_objects:
            cmds.warning('请先选择一个或多个物体。')
            return
        
        # 对选中的每一个物体进行重命名和镜像操作
        for source_object in selected_objects:
            # 获取源物体的名称
            source_name = source_object
            
            # 检查源字符是否存在于物体名中
            if source_str not in source_name:
                cmds.warning('物体 {0} 的名称中不包含 "{1}",Skipping.'.format(source_name,source_str))
                continue
            
            # 替换字符
            new_name = source_name.replace(source_str, replace_str)       

            
            # 执行镜像操作（沿 X 轴镜像）
            self.mirror_objects(source_object, new_name, axis)

            
            # 输出重命名和镜像操作结果
            print(f'object {source_name} has been mirrored as {new_name}.')

