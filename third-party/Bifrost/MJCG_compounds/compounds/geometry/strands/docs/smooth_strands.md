# `smooth_strands`

Smooth a strands by averaging the points between its neighbors.

## Inputs

### `strands`
The input strands object.

### `iterations`
The number of smoothing iterations. Higher values will make the strands smoother.

### `smooth_boundaries`
When enabled, also applies the smoothing to the strands start and end points.

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

## Outputs

### `out_strands`
The modified strands object.
