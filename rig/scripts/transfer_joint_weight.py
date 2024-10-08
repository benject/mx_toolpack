import maya.cmds as cmds
import math
from collections import Counter #用counter来对dict求和


def get_dist(pos0,pos1):    
    return  math.sqrt( (pos1[0] - pos0[0])**2 + math.pow((pos1[1] - pos0[1]),2)  +math.pow((pos1[2] - pos0[2]),2))

def find_skin_cluster(mesh):
    """
    Find the skin cluster node for a given mesh.
    :param mesh: Name of the mesh object.
    :return: Name of the skin cluster node or None.
    """
    # Get the history of the mesh
    history = cmds.listHistory(mesh)

    # Look for a skinCluster node in the history
    for node in history:
        if cmds.nodeType(node) == 'skinCluster':
            return node

    return None


def swap_weight(sel,joint_pair_dict):
    
    skin_node = find_skin_cluster(sel)

    jnt_list = cmds.skinCluster(skin_node,query=True,inf=True) # find the influence joint 

    cmds.select('{}.vtx[*]'.format(sel))
    vertexs = cmds.ls(sl=True,fl=True)
    
    for i,vtx in enumerate(vertexs):
        
        print("handling: {} / {}".format(i,len(vertexs))) 
       
        wgt_list = cmds.skinPercent( skin_node, vtx, query=True, value=True ) # find the corresponding weight        
        
        jnt_weight_dict_list = [{jnt:wgt} for jnt , wgt in zip(jnt_list,wgt_list)] #make joint weight dict        

        new_wgt_counter = Counter({})
        
        for jnt_wgt_d in jnt_weight_dict_list:
        
            for old_jnt in jnt_wgt_d.keys():
            
                weight = jnt_wgt_d[old_jnt] #find the weight

                if weight == 0:
                    continue

                else:            
                    new_jnt = joint_pair_dict.get(old_jnt)     
                    new_wgt_counter += Counter({new_jnt:weight}) #用counter来对dict求和 相同的key，value相加
                
                    try:
                        cmds.skinCluster(skin_node,edit=True, wt=0, ai = new_jnt)    # add the joint to inf
        
                    except:
                        pass
                
        new_wgt_d = dict(new_wgt_counter)
        
        #print(new_wgt_d)

        new_wgt_list = [item for item in new_wgt_d.items()]
        
        #print(new_wgt_list)
        
        cmds.skinPercent( skin_node, vtx , transformValue=new_wgt_list )


def transfer_joint_weight():    
    """
    select order:
    skinned mesh
    old joint root 
    new joint root
    
    """
    
    sel = cmds.ls(sl=True)
    
    mesh = sel[0]
    
    cmds.select(sel[1],hi=True)    
    src = cmds.ls(sl=True,type="joint")
    
    cmds.select(sel[2],hi=True)    
    tgt = cmds.ls(sl=True,type="joint")
    
       
    
    joint_pair_dict = {}
    
    for jnt_src in src:
        
        dict_temp = {}
        
        for jnt_tgt in tgt:
                
            pos0 = cmds.xform(jnt_src,q=True,t=True,ws=True)
            pos1 = cmds.xform(jnt_tgt,q=True,t=True,ws=True)
            
            dist  = get_dist(pos0,pos1)
            
            dict_temp[jnt_tgt] = dist
            
        joint_pair_dict[jnt_src] =  min(dict_temp,key = dict_temp.get) #find the closest joint 
    
    swap_weight(mesh,joint_pair_dict)
    
    
transfer_joint_weight()