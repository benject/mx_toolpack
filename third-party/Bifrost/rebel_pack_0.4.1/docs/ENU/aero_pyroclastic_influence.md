# `aero_pyroclastic_influence`

The `aero_pyroclastic_influence` adds detail to aero simulations that resembles the pyroclastic detail seen in volcanic plumes and large explosions. 
Two separate influences, drag and vorticity, are being output and can each be inspected by the `influence_scope` with an aero object as `probe_geometry`.
To get the full pyroclastic effect, both output influences must be connected to the `simulate_aero` compound's `influences` port.

### `influence` 

One may optionally connect an influence field out_influence into this port. For example a mask_influence node could be connected to mask the effect of this influence. Any number of influence fields may be added to the daisy chain to build a complex field.

### `General` 

### `enable` 

Enables/disables the influence.

### `Drag` 

The drag applies a random drag to the velocity which results in a bumpy smoke look. The drag controls the magnitude of the noise in the direction of the velocity.

### `drag` 

The overall magnitude of the drag. 

### `frequency` 

This is the base frequency of the fractal noise used to control the drag. Higher values give finer detail.

### `num_frequencies` 

This is the total number of noise frequencies to sum. Generally as this number increases there will be more detail or small scale noise. 
The value does not need to be an integer. If one slowly animates `num_frequencies` the finest scale noise will gradually fade in, 
rather than popping on at integer values.

### `Vorticity`

The vorticity adds small scale swirls and gives rise to detail at the level of the resolution.

### `vorticity` 

The overall magnitude of the vorticity. This value can be increased if the pyroclastic look lacks detail. 
This can in turn lead to static noise in areas where the smoke is not moving very fast, see the `noise_dampening` parameter. 
The `vorticity` required for a particular simulation may depend on the `max_steps`, `scene_units_in_meters`, `velocity_smoothness`, 
`kinematic_viscosity` and `simulation_speed` parameters on the `aero_solver_settings`, as well as on the `fluid_detail_size` 
on the `source_air` node and the frames per second. In general, lower values of `vorticity` are required for lower `fluid_detail_size`.

### `noise_dampening` 

If a certain `vorticity` is required to achieve the desired amount of detail in some areas, but creates static noise in other areas where
the flow is moving slowly, the `noise_dampening` can be increased to lower the amount of static noise.

### `min_fog_density` 

The vorticity will only be applied at spatial positions where the fog density values are above the `min_fog_density`. 
This can be used to only apply the vorticity near the edges of a plume. 

### `max_fog_density` 

The vorticity will only be applied at spatial positions where the fog density values are below the `max_fog_density`. 
This can be used to avoid applying the vorticity internally in a plume.
It is desirable to restrict vorticity to the outside
of the plume to avoid large interior velocities that can potentially slow the solver down.

