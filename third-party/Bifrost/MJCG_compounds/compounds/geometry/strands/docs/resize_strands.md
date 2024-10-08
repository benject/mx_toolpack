# `resize_strands`

Cuts or extands the length of strands objects.

## Inputs

### `strands`
The input strands object.

### `weights (per strand)`
Controls the amount of scaling applied per strand. The weight values are multiplied over the `scale` or `min_length_offset` / `max_length_offset` values.
If nothing is connected, the default weight is 1 for all strands. This is an *interpreted auto port* that accepts the following types:
- A single `float` is interpreted as a constant value for all strands.
- An `array<float>` is interpreted as values per point. The array gets resized to match the number of strands, if necessary.
- A `string` is interpreted as the name of an existing geo property, and its values are used.
- A `ScalarField` is sampled at each position of the geometry's components.
- An `array<long>` specifies the indices to be assigned a value of 1. Other indices are assigned 0.

- A weight of 0 applies no smoothing.
- A weight between 0 and 1 applies a portion of the smoothing.

### `preserve_positions`
When ON, point position along the strands are preserved. Points that have a length greater than their new strand lengths are deleted. An extra point will be added if the strands gets extanded. When OFF, The point count is preserved and all their positions are shifted along the strands, relative to their new lengths. This is ON by default.

### `length_offset`
The length offset used to resize the strands. Positive values will extand the strands while negative value will cut the strands. This value is in scene unit.

### `use_randomization`
If enable, per-strand random scales between `min_length_offset` & `max_length_offset` will be applied.

### `min_length_offset`
The minmum random length_offset.

### `max_length_offset`
The maximum random length_offset.

### `random_seed`
The seed of the length offset randomizer.

## Outputs

### `out_strands`
The mofified strands object.
