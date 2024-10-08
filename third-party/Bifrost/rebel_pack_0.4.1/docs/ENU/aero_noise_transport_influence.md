# `aero_noise_transport_influence`
This influence randomly displaces (or transports) density using a noise. The direction of displacement is the gradient of either the density or the temperature. This can provide detail without affecting the velocity, though over time can result in some density diffusion.

### `influence` 
One may optionally connect an influence field out_influence into this port. For example a mask_influence node could be connected to mask the effect of this influence. Any number of influence fields may be added to the daisy chain to build a complex field.

### `enable` 

Enables/disables the influence.

### `signed_noise` 
If enabled the absolute value of the noise is used, creating a bumpy look.

### `magnitude` 
The amount of displacement (transport) each step.

### `use_temperature_gradient`
If true then displace along the gradient of `voxel_temperature`, otherwise use the gradient of `voxel_fog_density`.

### `frequency` 
The frequency of the simplex noise to use.

### `offset` 
This is subtracted from the noise before it advects the density. It offsets the resulting displacement.
