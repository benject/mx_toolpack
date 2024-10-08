# `smooth_geo_property`

Smooths a mesh or strands object geo property by averaging the adjacent values.
For now, this is limited to properties with `point_component` and `face_component` target.

## Inputs

### `geometry`
The input geometry object (mesh or strands only).

### `iterations`
The number of smoothing iterations. Higher values smooths the property stronger.

### `use_weighted_average`
When on, use a weighted average to smooth the geo property. The weights are defined by the distance between the adjacent components.

### `weights`
Controls the amount of smoothing applied.
If nothing is connected, the default weight is 1 for all points. This is an *interpreted auto port* that accepts the following types:
- A single `float` is interpreted as a constant value for all points.
- An `array<float>` is interpreted as values per point. The array gets resized to match the number of points, if necessary.
- A `string` is interpreted as the name of an existing geo property, and its values are used.
- A `ScalarField` is sampled at each position of the geometry's components.
- An `array<long>` specifies the indices to be assigned a value of 1. Other indices are assigned 0.

- A weight of 0 applies no smoothing.
- A weight between 0 and 1 applies a portion of the smoothing.

### `property`
The name of the geo property to smooth.

### `type`
The data type of the geo property to smooth.

## Outputs

### `out_geometry`
The modified geometry object.
