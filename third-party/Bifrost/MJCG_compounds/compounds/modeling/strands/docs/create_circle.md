# `create_circle`

Create a circle strands object.

## Inputs

### `sides`
The number of segments of the circle. This also defines the number of generated points.

### `radius`
The radius of the circle

### `axis`
Defines the direction which the circle faces.

### `Transform`
Scales, rotates, and translates the generated object. You can use a matrix by enabling `use_transform_matrix` and use the input `transform` port.

## Outputs

### `strands`
The output strands.

### `positions`
The point_position of the strands.