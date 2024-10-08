# `create_particle_trails`

Creates strands trails behind particles. 

If the particles have IDs (the `point_id` property), it can leave trails behind particles as they are emitted or die. This option is on particles solver settings as `label_point_id`. 

## Inputs

### `particles` 

Specifies the density property which Arnold will use to render. By default this is automatic and does not need to be specified manually. The automatic behavior is based on what the attached Arnold Standard Volume shader specifies as its density channel. However, if there is a different volume shader, or no shader is not applied, this allows it to be specified manually. 

### `start_frame` 

Which frame is the start of the simulation. Will accumulate particle clouds starting from this frame. 

### `num_frames` 

The length of the trails, in frames. 

### `properties` 

Allows specifying custom user properties to copy to the strands. By default this is point_position and point_size - meaning the strands will have the sizes and postions of the particles they are emitted from. 
