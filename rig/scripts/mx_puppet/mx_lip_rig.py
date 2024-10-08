import maya.cmds as cmds


jaw = "jaw"
group = "grp"
guide = "guide"
joint = "jnt"

#sides
left = "lf"
right = "rt"
center = "mid"

def create_guide_locators(number=4):
    
    locs = []
    fine_locs = []
    close_locs = []
    
    loc1 = cmds.spaceLocator(p=(0,0,0))[0]
    cmds.xform(loc1, t=(5,0,0), ws=True)    
    
    loc2 = cmds.spaceLocator(p=(0,0,0))[0]
    cmds.xform(loc2, t=(0,1,0), ws=True)   
    
    loc3 = cmds.spaceLocator(p=(0,0,0))[0]
    cmds.xform(loc3, t=(-5,0,0), ws=True)   
    
    loc4 = cmds.spaceLocator(p=(0,0,0))[0]
    cmds.xform(loc4, t=(0,-1,0), ws=True)
        
    locs.append(loc1)        
    locs.append(loc2)        
    locs.append(loc3)        
    locs.append(loc4)
    
    for i in range(4): # fine locs
        for j in range(number):
            fine_loc = cmds.spaceLocator()
            pos0 = cmds.xform(locs[i], q=True, ws=True, t=True)
            pos1 = cmds.xform(locs[(i+1)%4], q=True, ws=True, t=True)
            
            if(i==0) : #lf to up_mid
                cmds.xform(fine_loc, t=(pos0[0] - abs(((pos0[0] + pos1[0])/(number + 1) * (j+1))), pos0[1] + abs(((pos0[1] + pos1[1])/(number + 1) * (j+1))), pos0[2] + ((pos0[2] + pos1[2])/number * j)), ws = True)
            if(i==1):  # up_mid to rt
                cmds.xform(fine_loc, t=(pos0[0] - abs(((pos0[0] + pos1[0])/(number + 1) * (j+1))), pos0[1] - abs(((pos0[1] + pos1[1])/(number + 1) * (j+1))), pos0[2] + ((pos0[2] + pos1[2])/number * j)), ws = True)
            if(i==2):  # rt to low_mid
                cmds.xform(fine_loc, t=(pos0[0] + abs(((pos0[0] + pos1[0])/(number + 1) * (j+1))), pos0[1] - abs(((pos0[1] + pos1[1])/(number + 1) * (j+1))), pos0[2] + ((pos0[2] + pos1[2])/number * j)), ws = True)
            if(i==3):  # low_mid to lf
                cmds.xform(fine_loc, t=(pos0[0] + abs(((pos0[0] + pos1[0])/(number + 1) * (j+1))), pos0[1] + abs(((pos0[1] + pos1[1])/(number + 1) * (j+1))), pos0[2] + ((pos0[2] + pos1[2])/number * j)), ws = True)
            
            fine_locs.append(fine_loc)
        
    
                
    for i in range((2 * number) + 1): #close locs
      
        close_loc = cmds.spaceLocator(n="close_loc_{}".format(i))
        
        pos0 = cmds.xform(locs[0], q=True, ws=True, t=True)
        pos1 = cmds.xform(locs[2], q=True, ws=True, t=True)
        
        cmds.xform(close_loc,t=( pos0[0] - ((pos0[0] - pos1[0])/(2 * number + 2))*(i+1), 0,0),ws=True)
        
        close_locs.append(close_loc)
    
    return(locs,fine_locs,close_locs)


def create_guide_groups(guides):    

    grps = [] 
    for i in range(4):
        
        mat = cmds.xform(guides[i], q=True, m=True, ws=True)   
        cmds.select(cl=True)
        grp = cmds.createNode("transform", n="{}_corner_{}".format(left,group))
        cmds.xform(grp, ws=True, m=mat)
        grps.append(grp)
        
    return(grps)
        

def create_constraint(guide_grp, guide_locs, close_locs, fine_locs):
    
    exp_str = ""

    n = len(fine_locs)//4
    
    print(close_locs[n+1])
    
    cmds.parentConstraint( guide_grp[1], close_locs[n], guide_locs[1],mo=True )
    cmds.parentConstraint( guide_grp[3], close_locs[n], guide_locs[3],mo=True )

    for i in range(4):

        loc0 = guide_locs[i]
        loc1 = guide_locs[(i+1)%4]
        
        for j in range(n):         
        
            weight0 = round(1 - ((1 / (n + 1)) * (j + 1)),3) #near constraint
            weight1 = round(1 - weight0,3)
            weight2 = 0.0

            close_loc = ""

            if (i == 0): #get close locator
                close_loc = close_locs[i*n+j]                
            if (i == 1):
                close_loc = close_locs[i*n+j+1] #skip the middle close locator
                    
            if (i==2):
                close_loc = close_locs[-((i-2)*n+j+1)] #reverse the order                
            if (i==3):
                close_loc = close_locs[-((i-2)*n+j+2)] #skip the middle close 

                
                
            constraint = cmds.parentConstraint(loc0,loc1,close_loc,fine_locs[i*n + j],mo=True ,w = 1)[0] # 3 to 1 parent constraint
        
            cmds.parentConstraint(loc0,fine_locs[i*n + j],e=True,w=weight0)
            cmds.parentConstraint(loc1,fine_locs[i*n + j],e=True,w=weight1)
            cmds.parentConstraint(close_loc,fine_locs[i*n + j],e=True,w=weight2)
            
            weight_list = cmds.parentConstraint(constraint,q=True,wal=True)
        
            print(weight_list)
        
            exp_str += "{}.{} = clamp(0,1, {} * (1 - {}.{}));\r\n".format(constraint,weight_list[0],weight0,constraint,weight_list[2]) 
            exp_str += "{}.{} = clamp(0,1, {} * (1 - {}.{}));\r\n".format(constraint,weight_list[1],weight1,constraint,weight_list[2]) 
    
    cmds.expression(s=exp_str)


guide_locs,fine_locs,close_locs = create_guide_locators()
guide_grps = create_guide_groups(guide_locs)
create_constraint(guide_grps, guide_locs, close_locs, fine_locs)
