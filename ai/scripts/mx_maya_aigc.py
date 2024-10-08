# -*- coding: utf-8 -*-

import os
import maya.cmds as cmds
import json
import urllib.request
import webbrowser
import random


class MX_MayaAIGC():
    
    def __init__(self):
        
        self.prompt_id = ""
        self.comfyUI_path = r"D:\workspace\aigc\ComfyUI_windows_portable\ComfyUI\input"

        #图生图的变量
        self.prompt_weight_i2i = 0.8

            
    def initUI(self):
    
            self.ui_name = "ComfyUIWindow"
            #检查窗口是否已存在，如果存在则删除
            if cmds.window(self.ui_name, exists=True):
                cmds.deleteUI(self.ui_name, window=True)
        
            # 创建新窗口
            cmds.window(self.ui_name, title="Maya AIGC Window")
            cmds.window(self.ui_name, e=True, widthHeight=(640, 780)) #manually set width heigh here to avoid user change
            
            # 创建布局
            column_layout0 = cmds.columnLayout(adjustableColumn=True)
            # 创建正反提示词输入框
            cmds.text(label=" Maya Comfy UI Tool",h=35)

            # 创建选项卡布局
            tab_layout = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5, parent=column_layout0)
            # 文生图 tab
            column_layout1 = cmds.columnLayout(adjustableColumn=True, parent=tab_layout)
            
            # 创建正反提示词输入框
            cmds.text(label="Positive Prompt:",h=25,align='left')
            self.pos_prompt_field_t2i = cmds.scrollField(wordWrap=True, h=80, text="1 girl standing in a sunset street, facing to the camera, best quality, master piece")
            cmds.text(label="Negative Prompt:",h=25,align='left')
            self.neg_prompt_field_t2i = cmds.scrollField(wordWrap=True, h=80, text="bad quality, bad hands")

            # 创建按钮并绑定事件
            cmds.button(label="text to image", h=25, command=lambda x: self.queue_prompt('t2i'))
            cmds.button(label="show image", h=25, command=lambda x: self.show_images_window())

            #图生图 tab
            # 创建布局
            column_layout2 = cmds.columnLayout(adjustableColumn=True, columnAlign="center", parent=tab_layout)
            self.image_ui = cmds.image(width=640, height=360)
            
            # 添加分隔符作为空间
            cmds.separator(height=10, style='none')  # 可以调整height值来增加或减少空间

            # 创建正反提示词输入框
            cmds.text(label="Positive Prompt:",h=25,align='left')
            self.pos_prompt_field_i2i = cmds.scrollField(wordWrap=True, h=80, text="1 girl standing in a sunset street, facing to the camera, best quality, master piece")
            cmds.text(label="Negative Prompt:",h=25,align='left')
            self.neg_prompt_field_i2i = cmds.scrollField(wordWrap=True, h=80, text="bad quality, bad hands")
            
            # 创建文本字段
            cmds.text(label="Prompt Weight",h=25,align='left')
            # 添加滑块控件，范围从0.0到1
            self.prompt_weight_slider = cmds.floatSlider(min=0.0, max=1.0, value=0.8, step=0.1, changeCommand=lambda x: self.adjust_prompt_weight())
                
            # 创建按钮并绑定事件
            cmds.button(label="capture view", command=lambda x: self.capture_view())
            cmds.button(label="image to image", command=lambda x: self.queue_prompt('i2i'))
            cmds.button(label="show image", h=25, command=lambda x: self.show_images_window())
            # 添加选项卡的标签
            cmds.tabLayout(tab_layout, edit=True, tabLabel=((column_layout1, 'text to image'), (column_layout2, 'image to image')))
            # 显示窗口
            cmds.showWindow(self.ui_name)   
    
    #文生图
    def set_prompt_t2i(self):
        #read the json path        
        with open(r"C:\Users\chenbing\Downloads\workflow_api_t2i.json") as f:
            self.prompt_json = json.load(f)    
            self.prompt_json["6"]["inputs"]["text"] = cmds.scrollField(self.pos_prompt_field_t2i, query=True, text=True)
            self.prompt_json["7"]["inputs"]["text"] = cmds.scrollField(self.neg_prompt_field_t2i, query=True, text=True)

    def queue_prompt(self,type):

        if(type=='t2i'):
            print("excuting text to image workflow")
            self.set_prompt_t2i()
        else:
            print("excuting image to image workflow")
            self.set_prompt_i2i()

        p = {"prompt": self.prompt_json}

        print(p)
        prompt_data = json.dumps(p).encode('utf-8')
        req =  urllib.request.Request("http://127.0.0.1:8188/prompt", data=prompt_data, headers={'Content-Type': 'application/json'})
        # 发送 POST 请求
        response = urllib.request.urlopen(req)
        
        response_data = response.read()

        # 处理响应
        
        # 将 bytes 数据解码成字符串
        response_str = response_data.decode('utf-8')
        
        # 反序列化字符串到 Python 数据结构（例如，字典或列表）
        data = json.loads(response_str)
    
        self.prompt_id = (data['prompt_id'])

    
    def get_history(self,args):
        with urllib.request.urlopen("http://127.0.0.1:8188/history/{}".format(self.prompt_id)) as response:
            return json.loads(response.read())
    
    def get_images(self):
        
        #获取输出的图片的url /从history json当中获取

        history_data = self.get_history(self.prompt_id)[self.prompt_id]
        
        for node_id in history_data['outputs']:
            
            node_output = history_data["outputs"][node_id]

            if "images" in node_output:
                images_output = []
                for image_out in node_output["images"]:
                    filename = image_out["filename"]
                    subfolder = image_out["subfolder"]
                    folder_type = image_out["type"]
                    data = {"filename": filename, "subfolder": subfolder, "type": folder_type}
                    url_values = urllib.parse.urlencode(data)

                    #print("http://127.0.0.1:8188/view?{}".format(url_values)) 
                    images_output.append("http://127.0.0.1:8188/view?{}".format(url_values))

                return(images_output)
                    
    def download_image(self,image_url,local_file_name):
        
        #从 URL 下载图片并保存到本地文件
        try:
            with urllib.request.urlopen(image_url) as response, open(local_file_name, 'wb') as out_file:
                data = response.read()  # 读取数据
                out_file.write(data)    # 写入文件
            return True
        except Exception as e:
            print(f"下载图片失败: {e}")
            return False
    def open_url(self,url):        
        def callback(*args):
            webbrowser.open(url) #在浏览器里打开
        return callback #返回回调函数

    def show_images_window(self):
        """在 Maya 中创建一个窗口并显示给定 URL 的图片"""
        
        window_title = "Image Gallery"
        window_id = "imageGalleryWindow"
        
        # 如果窗口已经存在，先删除
        if cmds.window(window_id, exists=True):
            cmds.deleteUI(window_id)
        
        # 创建新窗口
        cmds.window(window_id, title=window_title)
        cmds.scrollLayout(horizontalScrollBarThickness=16, verticalScrollBarThickness=16)
        
        cmds.window(window_id,e=True,wh=(520,540))

        # 创建grid layout 指定每行的元素数量，例如每行显示 2 个图片
        cmds.gridLayout(numberOfColumns=2, cellWidthHeight=(256, 256))

        out_image_urls = self.get_images()
        
        # 对于每个 URL，下载图片并在 Maya UI 中显示
        for i, url in enumerate(out_image_urls):
            local_file_name = os.path.join(cmds.internalVar(userTmpDir=True),"maya_comfyUI_image_{}.jpg".format(i))  # 定义图片保存的本地路径
            if self.download_image(url, local_file_name):
                cmds.iconTextButton(style='iconOnly', image1=local_file_name, w=256, h=256, command=self.open_url(url))
            else:
                print(f"无法显示图片: {url}")
        
        # 显示窗口
        cmds.showWindow(window_id)


    #图生图
    def capture_view(self):       
        
        # 创建临时文件路径
        self.capture_file_name = 'maya_capture{}.jpg'.format(random.randint(1,99999999))
        self.capture_file_path = os.path.join(self.comfyUI_path, self.capture_file_name)

        current_frame = cmds.currentTime(q=True)
            # 获取渲染窗口的大小
        width = cmds.getAttr("defaultResolution.width")
        height = cmds.getAttr("defaultResolution.height")

        # 使用playblast捕捉当前视图
        cmds.playblast(completeFilename=self.capture_file_path, format='image', width=width, height=height, showOrnaments=False, startTime=current_frame, endTime=current_frame, viewer=True, framePadding=4, percent=100, quality=100, compression="jpg")
        
        # 捕捉一张缩略图用来显示在窗口里        
        tempDir = os.environ.get("TEMP")
        cmds.playblast(completeFilename=os.path.join(tempDir, self.capture_file_name), format='image', width=width, height=height, showOrnaments=False, startTime=current_frame, endTime=current_frame, viewer=True, framePadding=4, percent=480 / height * 100, quality=100, compression="jpg")
 
        if height > 480:
            #根据捕捉的图片，更新窗口大小
            cmds.window(self.ui_name,e=True,wh=( width * (480 / height), 900))
            # 更新UI上的图像
            cmds.image(self.image_ui, edit=True, image=os.path.join(tempDir, self.capture_file_name), width= width * (480 / height) , height= 480)

    def adjust_prompt_weight(self):
        self.prompt_weight_i2i = cmds.floatSlider(self.prompt_weight_slider, query=True, value=True)

    def set_prompt_i2i(self):
        #read the json path        
        with open(r"C:\Users\chenbing\Downloads\workflow_api_i2i.json") as f:
            self.prompt_json = json.load(f)
            self.prompt_json["6"]["inputs"]["text"] = cmds.scrollField(self.pos_prompt_field_i2i, query=True, text=True)
            self.prompt_json["7"]["inputs"]["text"] = cmds.scrollField(self.neg_prompt_field_i2i, query=True, text=True)
            self.prompt_json["3"]["inputs"]["denoise"] = self.prompt_weight_i2i
            self.prompt_json["10"]["inputs"]["image"] = self.capture_file_name
    

