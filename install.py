#-*- coding: utf-8 -*-

import os,sys
import inspect
import maya.cmds as cmds
import maya.mel as mel

def reload_pkg(pkg):

    if (sys.version > "3"):    
        
        import importlib
        importlib.reload(pkg)

    else:        
        reload(pkg)



class Commands():

    def __init__(self):        
        self.commands = []
    
    def add_commands(self,new_command):
        self.commands.append(new_command)
    
cmds_list = Commands()



class Shelf(object):
    '''A simple class to build shelves in maya. Since the build method is empty,
    it should be extended by the derived class to build the necessary shelf elements.
    By default it creates an empty shelf called "customShelf".'''

    def __init__(self, name="", iconPath=""):
        self.name = name

        self.iconPath = iconPath

        self.labelBackground = (0, 0, 0, 0)
        self.labelColour = (.9, .9, .9)
        
        # Clean old shelf if it exists
        self._cleanOldShelf()

        # Delay shelf creation until Maya's UI is fully initialized
        self._initializeShelf()


    def _initializeShelf(self):
        """Initialize the shelf by creating a new tab and setting its parent."""
        try:
            self._addNewShelf()
            # Set parent to the new shelf for further customization      
            cmds.setParent(self.name)
            # Build the shelf contents
            self.build()
        except RuntimeError as e:
            pass

    def _addNewShelf(self):        

        """Add a new shelf tab with the specified name."""
        try:      
            main_shelf = mel.eval('global string $gShelfTopLevel;$tempMelVar=$gShelfTopLevel;')
            cmds.shelfLayout(self.name, parent=main_shelf)    
        except  RuntimeError as e:
            print("Error: failed to add new shelf{}:{}".format(main_shelf,e))


    def _null(self):
        pass

    def build(self):
        '''This method should be overwritten in derived classes to actually build the shelf
        elements. Otherwise, nothing is added to the shelf.'''
        pass

    def addButon(self, label, icon="commandButton.png", command=_null, doubleCommand=_null, toolTip = ""):
        '''Adds a shelf button with the specified label, command, double click command and image.'''
        cmds.setParent(self.name)
        if icon:
            icon = self.iconPath + '/' + icon
        cmds.shelfButton(label, annotation=toolTip, width=32, height=32, image=icon, l=label, command=command, style = "iconOnly", dcc=doubleCommand, olb=self.labelBackground, olc=self.labelColour)

    def addMenuItem(self, parent, label, command=_null, icon=""):
        '''Adds a shelf button with the specified label, command, double click command and image.'''
        if icon:
            icon = self.iconPath + icon
        return cmds.menuItem(p=parent, l=label, c=command, i="")

    def addSubMenu(self, parent, label, icon=None):
        '''Adds a sub menu item with the specified label and icon to the specified parent popup menu.'''
        if icon:
            icon = self.iconPath + icon
        return cmds.menuItem(p=parent, l=label, i=icon, subMenu=1)

    def _cleanOldShelf(self):

        try:
            '''Checks if the shelf exists and empties it if it does or creates it if it does not.'''
            if cmds.shelfLayout(self.name, ex=1):
                cmds.deleteUI(self.name, layout=True)
        except Exception as e:
            # 捕获所有异常，但不提示用户
            print("Error cleaning old shelf: {}".format(e))

###################################################################################
'''This is an example shelf.'''
class MX_ToolPackShelf(Shelf):

    def __init__(self, name="", iconPath=""):
        super(MX_ToolPackShelf,self).__init__(name, iconPath)


    def build(self):

        self.addButon(label="common tool", command = cmds_list.commands[0],icon="common.png", toolTip="common tool")
        self.addButon(label="asset tool", command = cmds_list.commands[1],icon="asset.png", toolTip="asset tool") 
        self.addButon(label="rigging tool", command = cmds_list.commands[2],icon="rigging.png", toolTip="rigging tool") 
        self.addButon(label="animation tool", command = cmds_list.commands[3],icon="animation.png", toolTip="animation tool") 

        self.addButon(label="lighting tool", command = cmds_list.commands[4],icon="lighting.png", toolTip="lighting tool") 
        self.addButon(label="render tool", command = cmds_list.commands[5],icon="render.png", toolTip="render tool") 
        self.addButon(label="ai", command = cmds_list.commands[6],icon="ai.png", toolTip="ai tool") 
        self.addButon(label="settings", command = cmds_list.commands[7],icon="settings.png", toolTip="settings") 
        
        '''
        self.addButon("popup")
        p = cmds.popupMenu(b=1)
        self.addMenuItem(p, "popupMenuItem1")
        self.addMenuItem(p, "popupMenuItem2")
        sub = self.addSubMenu(p, "subMenuLevel1")
        self.addMenuItem(sub, "subMenuLevel1Item1")
        sub2 = self.addSubMenu(sub, "subMenuLevel2")
        self.addMenuItem(sub2, "subMenuLevel2Item1")
        self.addMenuItem(sub2, "subMenuLevel2Item2")
        self.addMenuItem(sub, "subMenuLevel1Item2")
        self.addMenuItem(p, "popupMenuItem3")
        self.addButon("button3")
        '''

##################################################################################
def create_mx_shelf(root_path,icon_path):
    
    #========== button1 ==========#
    #the common button command
    command1 = "root_path = r\"%s\"\n"%root_path
    command1 += """
    import os,sys
    sys.path.append("%s"%root_path)
    common_path = os.path.join(root_path,'common')
    
    import unload_pkgs
    unload_pkgs.unload_packages(True, ['common'])

    import common    
    import common.mx_common_tools

    common_tools = common.mx_common_tools.MX_CommonTools("%s"%common_path)
    common_tools.initUI()
    """
    #remove the indent
    command1 = inspect.cleandoc(command1)
    cmds_list.add_commands(command1)
    
    
    #========== button2 ==========#
    #the asset button command
    command2 = "root_path = r\"%s\"\n"%root_path
    command2 += """
    import os,sys
    sys.path.append("%s"%root_path)
    asset_path = os.path.join(root_path,'asset')
    
    import unload_pkgs
    unload_pkgs.unload_packages(True, ['asset'])

    import asset    
    import asset.mx_asset_tools

    asset_tools = asset.mx_asset_tools.MX_AssetTools("%s"%asset_path)
    asset_tools.initUI()
    """
    #remove the indent
    command2 = inspect.cleandoc(command2)
    cmds_list.add_commands(command2)



    #========== button3 ==========#
    #the rig button command
    command3 = "root_path = r\"%s\"\n"%root_path
    command3 += """
    import os,sys
    sys.path.append("%s"%root_path)
    rig_path = os.path.join(root_path,'rig')
    
    import unload_pkgs
    unload_pkgs.unload_packages(True, ['rig'])
    import rig
    import rig.mx_rig_tools

    rig_tools = rig.mx_rig_tools.MX_RigTools("%s"%rig_path)
    rig_tools.initUI()
    """
    #remove the indent
    command3 = inspect.cleandoc(command3)
    cmds_list.add_commands(command3)


    #========== button4 ==========#
    #the anim button command
    command4 = "root_path = r\"%s\"\n"%root_path
    command4 += """
    import os,sys
    sys.path.append("%s"%root_path)
    anim_path = os.path.join(root_path,'anim')

    import unload_pkgs
    unload_pkgs.unload_packages(True, ['anim'])
    
    import anim    
    import anim.mx_anim_tools

    anim_tools = anim.mx_anim_tools.MX_AnimTools("%s"%anim_path)
    anim_tools.initUI()
    """
    #remove the indent
    command4 = inspect.cleandoc(command4)
    cmds_list.add_commands(command4)



    #========== button5 ==========#
    #the light button command
    command5 = "root_path = r\"%s\"\n"%root_path
    command5 += """
    import os,sys
    sys.path.append("%s"%root_path)
    light_path = os.path.join(root_path,'light')

    import unload_pkgs
    unload_pkgs.unload_packages(True, ['light'])
    
    import light    
    import light.mx_light_tools

    light_tools = light.mx_light_tools.MX_LightTools("%s"%light_path)
    light_tools.initUI()
    """
    #remove the indent
    command5 = inspect.cleandoc(command5)
    cmds_list.add_commands(command5)



    #========== button6 ==========#
    #the render button command
    command6 = "root_path = r\"%s\"\n"%root_path
    command6 += """
    import os,sys
    sys.path.append("%s"%root_path)
    render_path = os.path.join(root_path,'render')

    import unload_pkgs
    unload_pkgs.unload_packages(True, ['render'])
    
    import render    
    import render.mx_render_tools

    render_tools = render.mx_render_tools.MX_RenderTools("%s"%render_path)
    render_tools.initUI()
    """
    #remove the indent
    command6 = inspect.cleandoc(command6)
    cmds_list.add_commands(command6)



    #========== button7 ==========#
    #the settings button command
    command7 = "root_path = r\"%s\"\n"%root_path
    command7 += """
    import os,sys
    sys.path.append("%s"%root_path)
    ai_path = os.path.join(root_path,'ai')

    import unload_pkgs
    unload_pkgs.unload_packages(True, ['ai'])
    
    import ai  
    import ai.mx_ai_tools

    ai_tools = ai.mx_ai_tools.MX_AITools("%s"%ai_path)
    ai_tools.initUI()
    """
    #remove the indent
    command7 = inspect.cleandoc(command7)
    cmds_list.add_commands(command7)


    

    #========== button7 ==========#
    #the settings button command
    command8 = "root_path = r\"%s\"\n"%root_path
    command8 += """
    import os,sys
    sys.path.append("%s"%root_path)
    settings_path = os.path.join(root_path,'settings')

    import unload_pkgs
    unload_pkgs.unload_packages(True, ['settings'])
    
    import settings    
    import settings.mx_settings

    settings = settings.mx_settings.MX_Settings("%s"%settings_path)
    settings.initUI()
    """
    #remove the indent
    command8 = inspect.cleandoc(command8)
    cmds_list.add_commands(command8)
    

    MX_ToolPackShelf(name="mx_toolpack", iconPath=icon_path)

def onMayaDroppedPythonFile(*args):

    import unload_pkgs
    unload_pkgs.unload_packages(packages=["install"])

    import install
    reload_pkg(install)
    
    root_path = ''
    icon_path = ''

    if (sys.version > "3"):      

        import pathlib
        root_path = pathlib.Path(__file__).parent
        sys.path.append(root_path) #install this mod to maya

    else:

        root_path = os.path.dirname(os.path.abspath(__file__))
        sys.path.append(root_path) #install this mod to maya

    icon_path = os.path.join(root_path,"icons")

    # write bifrost to maya.env
    
    # 使用inspect.cleandoc去掉多余的缩进和不必要的换行
    bifrost_conf = inspect.cleandoc(""" 
        BIFROST_LIB_CONFIG_FILES={}/third-party/Bifrost/MJCG_compounds/bifrost_lib_config.json;{}/third-party/Bifrost/rebel_pack_0.4.1/bifrost_lib_config.json;{}/third-party/Bifrost/mx_pack/bifrost_lib_config.json
        """.format(root_path, root_path, root_path))

    ver = cmds.about(version=True)

    # Get the Maya preferences directory
    prefs_dir = os.path.expanduser("~/maya")


    # Look for the maya.env file in the preferences directory
    env_file = os.path.join(prefs_dir + "/" + ver + "/maya.env")

    print(env_file)
    
    # 以读写模式打开文件
    with open(env_file,'r+') as file:

        conf = file.read()

        # 检查是否已经包含了需要添加的配置
        if bifrost_conf in conf:
            print("Bifrost configuration already exists in the file. No changes made.")
        else:
            # 配置不存在，追加到文件末尾
            file.seek(0, 2)  # 移动文件指针到文件末尾
            file.write("\n" + bifrost_conf)  # 在文件末尾添加配置，并确保前面有换行
            print("Bifrost configuration added to the file.")

    #creating mod file
    mod_file = os.path.join(prefs_dir, 'modules', 'mx_toolpack.mod')

    # 检查文件是否存在
    if os.path.exists(mod_file):
        os.remove(mod_file)
    # 创建新的 mx_toolpack.mod 文件
    mod_content = """+ Mx Toolpack 1.0 {}\r\nscripts: {}""".format(root_path,root_path)

    try:
        # 写入 .mod 文件
        with open(mod_file, "w") as file:
            file.write(mod_content)
    except Exception as e:
        print("error creating mod file")

    create_mx_shelf(root_path,icon_path)


