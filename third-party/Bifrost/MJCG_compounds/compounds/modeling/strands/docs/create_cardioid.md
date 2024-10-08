# `create_cardioid`

Creates a cardioid, that can evolve into abstract shapes. 
This is based on the `modular multiplication table` algorithm: https://demonstrations.wolfram.com/ModularMultiplicationOnACircle/

## Inputs

### `radius`

The radius of the outer circle.

### `modulo`

The number of sides of the outer circle.

### `factor`

The multiplication factor. Each point's index is multiplied by this value in order to find the target point.
A segment will be generated for each points, starting from the current position to the target position. 

### `shift_1,2,3`

Resizes the segement's vectors. This can be used to tweak the abstract's shape even more.

### `shrink_length`

Shrinks the length of the segments.

### `segments`

The number of segment per strand.

### `filter_null_strands`

Deletes strands which have a length equal to 0.

### `Transform`

Scales, rotates, and translates the generated object. Enable `use_matrix` if you want to use the input `matrix` instead of the SRT components.

## Outputs

### `strands`

The generated strands.
