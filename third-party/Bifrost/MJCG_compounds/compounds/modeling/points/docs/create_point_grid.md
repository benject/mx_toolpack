# `create_point_grid`

Creates a three-dimensional point grid.

## Inputs

### `Dimensions`
The width, height, and depth dimensions.

### `Resolution`
defines how much points are generated for width, height, and depth. If one of the resolution size is set to one or less, it will only populate its coresponding points at the center of the grid. 


### `Transform`
Scales, rotates, and translates the generated object. You can use a matrix by enabling `use_transform_matrix` and use the input `transform` port.

## Outputs

### `points`
The points object.

### `grid_positions`
The grid `point_position` array.