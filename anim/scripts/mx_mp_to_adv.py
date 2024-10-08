#!/usr/bin/python
# -*- coding: utf-8 -*-


import json
import maya.cmds as cmds
import pymel.core as pm

#mediapipe to advanced skeleton
"""
mediapipe's blendshape order:

'_neutral', 
'browDownLeft', 
'browDownRight', 
'browInnerUp', 
'browOuterUpLeft', 
'browOuterUpRight', 
'cheekPuff', 
'cheekSquintLeft', 
'cheekSquintRight', 
'eyeBlinkLeft', 
'eyeBlinkRight', 
'eyeLookDownLeft', 
'eyeLookDownRight', 
'eyeLookInLeft', 
'eyeLookInRight', 
'eyeLookOutLeft', 
'eyeLookOutRight', 
'eyeLookUpLeft', 
'eyeLookUpRight', 
'eyeSquintLeft', 
'eyeSquintRight', 
'eyeWideLeft', 
'eyeWideRight', 
'jawForward', 
'jawLeft', 
'jawOpen', 
'jawRight', 
'mouthClose', 
'mouthDimpleLeft', 
'mouthDimpleRight', 
'mouthFrownLeft', 
'mouthFrownRight', 
'mouthFunnel', 
'mouthLeft', 
'mouthLowerDownLeft', 
'mouthLowerDownRight', 
'mouthPressLeft', 
'mouthPressRight', 
'mouthPucker', 
'mouthRight', 
'mouthRollLower', 
'mouthRollUpper', 
'mouthShrugLower', 
'mouthShrugUpper', 
'mouthSmileLeft', 
'mouthSmileRight', 
'mouthStretchLeft', 
'mouthStretchRight', 
'mouthUpperUpLeft', 
'mouthUpperUpRight', 
'noseSneerLeft', 
'noseSneerRight'
"""

bs_names = ['_neutral', 'browDownLeft', 'browDownRight', 'browInnerUp', 'browOuterUpLeft', 'browOuterUpRight', 'cheekPuff', 'cheekSquintLeft', 'cheekSquintRight', 'eyeBlinkLeft', 'eyeBlinkRight', 'eyeLookDownLeft', 'eyeLookDownRight', 'eyeLookInLeft', 'eyeLookInRight', 'eyeLookOutLeft', 'eyeLookOutRight', 'eyeLookUpLeft', 'eyeLookUpRight', 'eyeSquintLeft', 'eyeSquintRight', 'eyeWideLeft', 'eyeWideRight', 'jawForward', 'jawLeft', 'jawOpen', 'jawRight', 'mouthClose', 'mouthDimpleLeft', 'mouthDimpleRight', 'mouthFrownLeft', 'mouthFrownRight', 'mouthFunnel', 'mouthLeft', 'mouthLowerDownLeft', 'mouthLowerDownRight', 'mouthPressLeft', 'mouthPressRight', 'mouthPucker', 'mouthRight', 'mouthRollLower', 'mouthRollUpper', 'mouthShrugLower', 'mouthShrugUpper', 'mouthSmileLeft', 'mouthSmileRight', 'mouthStretchLeft', 'mouthStretchRight', 'mouthUpperUpLeft', 'mouthUpperUpRight', 'noseSneerLeft', 'noseSneerRight']


def process(bs_weight_filename):

    namespace = pm.selected()[0].namespace()  #get namespace here    
    weight_factor = 10
    


    with open(bs_weight_filename, "r") as f:
        mp_json = json.load(f)
    
    num_frames = len(mp_json) #get total frame of the json value 
    


    for i in range(num_frames):
        
        print(i)
        print(mp_json[i])

        bs_weight = mp_json[i]["bs"]


        #smooth the bs weight 

        
        
        for j in range(1,52):
            
            cmds.setKeyframe( f"{namespace}ctrlARKit_M.{bs_names[j]}", v = bs_weight[j] * weight_factor, t= i)
            
#process(r"C:\Users\chenbing\Desktop\video.mp4.json")