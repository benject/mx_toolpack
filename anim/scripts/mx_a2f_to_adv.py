# -*- coding: utf-8 -*-

import json
import maya.cmds as cmds
import pymel.core as pm


#audio to face mapping to arkit 52 bs

bs_name_list = [
    "eyeBlinkLeft",
    "eyeLookDownLeft",
    "eyeLookInLeft",
    "eyeLookOutLeft",
    "eyeLookUpLeft",
    "eyeSquintLeft",
    "eyeWideLeft",
    "eyeBlinkRight",
    "eyeLookDownRight",
    "eyeLookInRight",
    "eyeLookOutRight",
    "eyeLookUpRight",
    "eyeSquintRight",
    "eyeWideRight",
    "jawForward",
    "jawLeft",
    "jawRight",
    "jawOpen",
    "mouthClose",
    "mouthFunnel",
    "mouthPucker",
    "mouthLeft",
    "mouthRight",
    "mouthSmileLeft",
    "mouthSmileRight",
    "mouthFrownLeft",
    "mouthFrownRight",
    "mouthDimpleLeft",
    "mouthDimpleRight",
    "mouthStretchLeft",
    "mouthStretchRight",
    "mouthRollLower",
    "mouthRollUpper",
    "mouthShrugLower",
    "mouthShrugUpper",
    "mouthPressLeft",
    "mouthPressRight",
    "mouthLowerDownLeft",
    "mouthLowerDownRight",
    "mouthUpperUpLeft",
    "mouthUpperUpRight",
    "browDownLeft",
    "browDownRight",
    "browInnerUp",
    "browOuterUpLeft",
    "browOuterUpRight",
    "cheekPuff",
    "cheekSquintLeft",
    "cheekSquintRight",
    "noseSneerLeft",
    "noseSneerRight",
    "tongueOut"
]


def process(bs_weight_filename):

    namespace = pm.selected()[0].namespace()  #get namespace here
    weight_factor = 10.0 

    with open(bs_weight_filename, "r") as f:
        a2f_json = json.load(f)
    num_frames = a2f_json["numFrames"]

    for frame in range(num_frames):

        weights = a2f_json["weightMat"][frame] # get each frames weight value list , weights  = [0.x , ... , 0.x]

        for j in range(51): #no tongue out , so index in range 0 - 50

            bs_name=bs_name_list[j] #get bs name , bs name = "eyeBlinkLeft" ....
            bs_weight = weights[j] 
            
            cmds.setKeyframe( "{}ctrlARKit_M.{}".format(namespace,bs_name), v = bs_weight * weight_factor, t= frame )

