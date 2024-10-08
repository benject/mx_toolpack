# -*- coding: utf-8 -*-

import maya.cmds as cmds
import json


# mh_ctl_list is the mapping between metahuman rig and a2f facs rig.
# each entry in the list specifies the mapping of
# [mh_rig_ctrl_name, a2f_facs_name1, a2f_facs_weight1, a2f_facs_name2, a2f_facs_weight2, ...]
mh_ctl_list = [
    ['CTRL_R_brow_down.ty', "browLowerR", 1.0],  
    ['CTRL_L_brow_down.ty', "browLowerL", 1.0], 
    ['CTRL_R_brow_lateral.ty', "browLowerR", 1.0],
    ['CTRL_L_brow_lateral.ty', "browLowerL", 1.0],
    ['CTRL_R_brow_raiseIn.ty', "innerBrowRaiserR", 1.0], 
    ['CTRL_L_brow_raiseIn.ty', "innerBrowRaiserL", 1.0],
    ['CTRL_R_brow_raiseOut.ty', "innerBrowRaiserR", 1.0], 
    ['CTRL_L_brow_raiseOut.ty', "innerBrowRaiserL", 1.0],
    ['CTRL_C_eye.ty', "eyesLookUp", 1.0, "eyesLookDown", -1.0],
    ['CTRL_C_eye.tx', "eyesLookLeft", 1.0, "eyesLookRight", -1.0],
    ['CTRL_R_eye_blink.ty', "eyesCloseR", 1.0, "eyesUpperLidRaiserR", -1.0],
    ['CTRL_L_eye_blink.ty', "eyesCloseL", 1.0, "eyesUpperLidRaiserL", -1.0],
    ['CTRL_R_eye_squintInner.ty', "squintR", 1.0], 
    ['CTRL_L_eye_squintInner.ty', "squintL", 1.0],
    ['CTRL_R_eye_cheekRaise.ty', "cheekRaiserR", 1.0], 
    ['CTRL_L_eye_cheekRaise.ty', "cheekRaiserL", 1.0],
    ['CTRL_R_mouth_suckBlow.ty', "cheekPuffR", 0.5], 
    ['CTRL_L_mouth_suckBlow.ty', "cheekPuffL", 0.5],
    ['CTRL_R_nose.ty', "noseWrinklerR", 1.0], 
    ['CTRL_L_nose.ty', "noseWrinklerL", 1.0],
    ['CTRL_C_jaw.ty', "jawDrop", 1.0, "jawDropLipTowards", 0.6],
    ['CTRL_R_mouth_lipsTogetherU', "jawDropLipTowards", 1.0],
    ['CTRL_L_mouth_lipsTogetherU', "jawDropLipTowards", 1.0],
    ['CTRL_R_mouth_lipsTogetherD', "jawDropLipTowards", 1.0],
    ['CTRL_L_mouth_lipsTogetherD', "jawDropLipTowards", 1.0],
    ['CTRL_C_jaw_fwdBack.ty', "jawThrust", -1.0],
    ['CTRL_C_jaw.tx', "jawSlideLeft", -1.0, "jawSlideRight", 1.0],
    ['CTRL_C_mouth.tx', "mouthSlideLeft", 0.5, "mouthSlideRight", -0.5],
    ['CTRL_R_mouth_dimple.ty', "dimplerR", 1.0], 
    ['CTRL_L_mouth_dimple.ty', "dimplerL", 1.0],
    ['CTRL_R_mouth_cornerPull.ty', "lipCornerPullerR", 1.0], 
    ['CTRL_L_mouth_cornerPull.ty', "lipCornerPullerL", 1.0],
    ['CTRL_R_mouth_cornerDepress.ty', "lipCornerDepressorR", 1.0], 
    ['CTRL_L_mouth_cornerDepress.ty', "lipCornerDepressorL", 1.0],
    ['CTRL_R_mouth_stretch.ty', "lipStretcherR", 1.0], 
    ['CTRL_L_mouth_stretch.ty', "lipStretcherL", 1.0],
    ['CTRL_R_mouth_upperLipRaise.ty', "upperLipRaiserR", 1.0], 
    ['CTRL_L_mouth_upperLipRaise.ty', "upperLipRaiserL", 1.0],
    ['CTRL_R_mouth_lowerLipDepress.ty', "lowerLipDepressorR", 1.0], 
    ['CTRL_L_mouth_lowerLipDepress.ty', "lowerLipDepressorR", 1.0],
    ['CTRL_R_jaw_ChinRaiseD.ty', "chinRaiser", 1.0], 
    ['CTRL_L_jaw_ChinRaiseD.ty', "chinRaiser", 1.0],
    ['CTRL_R_mouth_lipsPressU.ty', "lipPressor", 1.0], 
    ['CTRL_L_mouth_lipsPressU.ty', "lipPressor", 1.0],
    ['CTRL_R_mouth_towardsU.ty', "pucker", 1.0], 
    ['CTRL_L_mouth_towardsU.ty', "pucker", 1.0], 
    ['CTRL_R_mouth_towardsD.ty', "pucker", 1.0], 
    ['CTRL_L_mouth_towardsD.ty', "pucker", 1.0], 
    ['CTRL_R_mouth_purseU.ty', "pucker", 1.0], 
    ['CTRL_L_mouth_purseU.ty', "pucker", 1.0], 
    ['CTRL_R_mouth_purseD.ty', "pucker", 1.0], 
    ['CTRL_L_mouth_purseD.ty', "pucker", 1.0],
    ['CTRL_R_mouth_funnelU.ty', "funneler", 1.0], 
    ['CTRL_L_mouth_funnelU.ty', "funneler", 1.0], 
    ['CTRL_L_mouth_funnelD.ty', "funneler", 1.0], 
    ['CTRL_R_mouth_funnelD.ty', "funneler", 1.0],
    ['CTRL_R_mouth_pressU.ty', "lipSuck", 1.0], 
    ['CTRL_L_mouth_pressU.ty', "lipSuck", 1.0], 
    ['CTRL_R_mouth_pressD.ty', "lipSuck", 1.0], 
    ['CTRL_L_mouth_pressD.ty', "lipSuck", 1.0]
]


def process(bs_weight_filename):
    with open(bs_weight_filename, "r") as f:
        facs_data = json.loads(f.read())
        facsNames = facs_data["facsNames"]
        numPoses = facs_data["numPoses"]
        numFrames = facs_data["numFrames"]    
        weightMat = facs_data["weightMat"]
        cmds.playbackOptions(ast=0, min=0, max=numFrames-1, aet=numFrames-1)
    
        namespace = ''
        for fr in range(numFrames):
            weightMat_fr = weightMat[fr]
            for i in range(len(mh_ctl_list)):
                ctl_value = 0
                numInputs = (len(mh_ctl_list[i])-1) // 2
                for j in range(numInputs):
                    poseIdx = facsNames.index(mh_ctl_list[i][j*2+1])
                    ctl_value += weightMat[fr][poseIdx] * mh_ctl_list[i][j*2+2]
                cmds.setKeyframe(namespace+mh_ctl_list[i][0], v=ctl_value, t=fr)


