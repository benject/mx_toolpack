# `linear_interpolate_transform`

Returns a linear interpolated transform between two input transformation matrix.

## Inputs

### `first`
The first transform matrix. 

### `second`
The second transform matrix.

### `fraction`
The interpolation fraction. A value of 0 returns the first transform, a value of 1 returns the second transform. Values between 0 and 1 returns a blended transformation between the first and second input transforms.

## Outputs

### `interpolated`
The interpolated transform matrix.