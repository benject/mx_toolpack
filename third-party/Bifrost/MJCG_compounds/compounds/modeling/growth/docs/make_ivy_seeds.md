# `ivy_seeds`

Prepares seeds and set required seed properties for ivy generation.

## Inputs

### `positions`
The world positions of the seeds. This is where the ivy will start its growth. Idealy, the seed positions should be placed close to a surface.

### `leaf_geometries`
The leaf instance geometries to be used by the seeds. Leaf geometries should have their base at the origin of the scene pointing in the Z+ direction. If more than one leaf is used, they will get randomly distributed on the ivy. If no geometry can be found on any seeds, the default leaf will be used instead.

### `enable`
Activates the seeds for ivy growth.

### `conform_to_surface`
When ON, leaves will be oriented like they are sitting on the surface. When OFF, leaves will be oriented against the surface.

### `turn_angle`
The turn angle of the leaves. A value of 0 makes the leaves to point in the same direction as their parent stems. This rotates the leaves around their local Y axis.

### `tilt_angle`
The tilt angle of the leaves. This lifts the leaves away from their parent stems

### `roll_angle`
The roll angle of the leaves. This rotates the leaves around their local Z axis.

### `Randomization`
Adds a randomized offset to the leaves turn angle, lilt angle , roll angle and scales. random_offset applies a surface offset directly to the stems.

### `size_profile`
Controls the profile of the stems along their lengths. This should not be used to control the stem size! The stem growth is already made progressive by the solver but this FCurve can be used to adjust the tips of the stems.

### `seed_color`
The color of the seed points, used when debugging seed positions in the viewport.

### `seed_size`
The size of the seed points, used when debugging seed positions in the viewport.

## Outputs

### `seeds`
The seeds objects.