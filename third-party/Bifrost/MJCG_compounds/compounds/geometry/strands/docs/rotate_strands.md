# `rotate_strands`

Rotate or twist the basis vectors and orientations of strands objects.

## Inputs

### `strands`
The input strands object.

### `weights`
Controls the amount of rotation / twist applied.
If nothing is connected, the default weight is 1 for all points. This is an *interpreted auto port* that accepts the following types:
- A single `float` is interpreted as a constant value for all points.
- An `array<float>` is interpreted as values per point. The array gets resized to match the number of points, if necessary.
- A `string` is interpreted as the name of an existing geo property, and its values are used.
- A `ScalarField` is sampled at each position of the geometry's components.
- An `array<long>` specifies the indices to be assigned a value of 1. Other indices are assigned 0.

- A weight of 0 applies no smoothing.
- A weight between 0 and 1 applies a portion of the smoothing.

### `rotation`
Rotates the strands uniformally. This value is in degree angle.

### `twist`
Twists the strands basis and orientations along their lengths. This value is in degree angle.

### `twist_profile`
fCurve to modulate the twist values along the strands lengths.

### `use_randomization`
If enable, per-point random rotation and twist will be applied.

### `min_rotation`
The minmum random rotation.

### `max_rotation`
The maximum random rotation.

### `min_twist`
The minmum random twist.

### `max_twist`
The maximum random twist.

### `random_seed`
The seed of the rotation and twist randomizer.

### `update_framing`
When enabled, forces the `point_orientation` and basis vectors update, according to the `Framing` settings.

### `up_vector`
Defines the strands's first segment normal vector that will be propageted through the strands's length. (Active only if the input strands requires orientation update or if "force_update" in ON).

### `up_vector_property`
If a property with this name is found on the strands object, it will be used instead of the values from the `up_vector` port. (Active only if the s input trands requires orientation update or if "force_update" in ON).

### `framing_algorithm`
The algorithm used to compute the strand's normals. `Frenet`, `Up Vector`, `parallel Transport`, `Double Reflection`. (Active only if the  input strands requires orientation update or if "force_update" in ON).

## Outputs

### `out_strands`
The mofified strands object.
