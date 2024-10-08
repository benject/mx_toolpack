# `scale_strands`

Scale strands objects from their roots.

## Inputs

### `strands`
The input strands object.

### `weights (per strand)`
Controls the amount of scaling applied per strand. The weight values are multiplied over the `scale` or `min_scale` / `max_scale` values.
If nothing is connected, the default weight is 1 for all strands. This is an *interpreted auto port* that accepts the following types:
- A single `float` is interpreted as a constant value for all strands.
- An `array<float>` is interpreted as values per point. The array gets resized to match the number of strands, if necessary.
- A `string` is interpreted as the name of an existing geo property, and its values are used.
- A `ScalarField` is sampled at each position of the geometry's components.
- An `array<long>` specifies the indices to be assigned a value of 1. Other indices are assigned 0.

- A weight of 0 applies no smoothing.
- A weight between 0 and 1 applies a portion of the smoothing.

### `scale`
The scale of the strands.

### `scale_relevant_properties`
When ON, `point_size`, `point_scale`, `point_length` and `strand_length` properties will also get scaled according to the scale values.

### `use_randomization`
If enable, per-strand random scales between `min_scale` & `max_scale` will be applied.

### `min_scale`
The minmum random scale.

### `max_scale`
The maximum random scale.

### `random_seed`
The seed of the scale randomizer.

## Outputs

### `out_strands`
The mofified strands object.
