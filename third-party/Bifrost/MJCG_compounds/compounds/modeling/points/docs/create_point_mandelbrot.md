# `create_point_mandelbrot`

Creates a mandelbrot made of points. 

## Inputs

### `iterations`
The number of iterations used to compute the mandelbrot shape. 

### `resolution`
Defines how many points are generated. This value is the square root of the total point count. 

### `color`
Defines the color of the mandelbrot.

### `Display`
The point display settings.

### `Transform`
Scales, rotates, and translates the generated object. You can use a matrix by enabling `use_transform_matrix` and use the input `transform` port.

## Outputs

### `points`
The points object.
