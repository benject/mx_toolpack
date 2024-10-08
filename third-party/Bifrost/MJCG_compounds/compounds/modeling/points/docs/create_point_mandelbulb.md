# `create_point_mandelbulb`

Creates a mandelbulb using points. 

## Inputs

### `iterations`
The number of iterations used to compute the mandelbulb shape. 

### `power`
The power value. Higher value will make more bulbs appear. The typical mandelbulb shape uses a power value of 8.

### `Resolution`
Defines how many points are generated per grid axis. 

### `Display`
The point display settings.

### `point_size_multiplier`
Multiplies the point size over the resolution dependent calculated size.

### `Transform`
Scales, rotates, and translates the generated object. You can use a matrix by enabling `use_transform_matrix` and use the input `transform` port.

## Outputs

### `points`
The points object.