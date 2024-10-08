# `aero_erode_density_influence`
This influence erodes the density in a range of density values to for example counter diffusion.

### `influence` 
One may optionally connect an influence field out_influence into this port. For example a mask_influence node could be connected to mask the effect of this influence. Any number of influence fields may be added to the daisy chain to build a complex field.

### `enable` 

Enables/disables the influence.

### `fog_density_subtracted` 
The amount subtracted from the fog density every frame.

### `min_fog_density` 
The value of fog density below which the density erosion will have full effect.

### `max_fog_density`
The value of fog density above which the density erosion will have no effect.

