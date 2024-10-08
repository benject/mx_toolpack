# `ivy_light`

Creates a point light or sunlight to affect the phototropism of ivy generation.

## Inputs

### `position`
The position of the light. This is not when `sunlight` is ON.

### `enable`
Activates the light for ivy growth.

### `kill_occluded`
When ON, buds that fails to receive photons from this light will die.

### `intensity`
The intensity of the point light. This should be a value between 0 and 1. When `quadratic_falloff` is ON, this can be increased further. This is not when `sunlight` is ON.

### `quadratic_falloff`
When ON, the point light's intensity becomes relative to the light's distance to the nodes. The closer the light, the stronger the intensity.  This is not when `sunlight` is ON.

### `sunlight`
When ON, the light will act global sunlight. 

### `sunlight_samples`
The number ofhemispherical sunlight rays to generate.

### `sunlight_seed`
The random seed for the generation of the hemispherical sunlight rays.

### `point_light_color`
The color of the point light, used when debugging point lights in the viewport.

### `point_light_size`
The size of the point light, used when debugging point lights in the viewport.

### `sunlight_ray_length`
The length of the sunlight rays, used when debugging the sunlight in the viewport.

## Outputs

### `light`
The light object.