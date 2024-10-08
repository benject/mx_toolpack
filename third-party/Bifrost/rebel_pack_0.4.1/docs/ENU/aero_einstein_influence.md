# `aero_einstein_influence`

This compound takes the existing velocity field and multiplies it with turbulence to create a turbulent secondary velocity field. That new velocity field is then added back to the original velocity field such as to retain the overall shape and behavior, but with disturbance from the turbulence. This is done twice for fine and coarse turbulence. Finally, vorticity is added relative to the velocity.

### `influence` 
One may optionally connect an influence field out_influence into this port. For example a mask_influence node could be connected to mask the effect of this influence. Any number of influence fields may be added to the daisy chain to build a complex field.

## General

### `enable` 

Enables/disables the influence.

### `master_magnitude` 

Overall multiplier for the entire effect.

## Turbulence

### `fine_turbulence` 

The strength of the fine turbulence.

### `fine_turbulence_speed` 

How fast the fine turbulence changes.

### `coarse_turbulence` 

The strength of the coarse turbulence.

### `coarse_turbulence_speed` 

How fast the coarse turbulence changes.

### `frequency_scale` 

Use this to scale the size of both frequencies when adjusting the simulation for scene scale.

## Vorticity

### `vorticity` 

The strength of the vorticity.

### `vorticity_threshold` 

The velocity at which you get maximum vorticity.