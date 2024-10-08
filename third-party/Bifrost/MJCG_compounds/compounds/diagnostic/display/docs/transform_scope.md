# `transform_scope`

Draws the transformation axis for a given matrix array. 

## Inputs

### `transform`
The input float 4x4 transform matrix or matrices.

### `axis_shape`
The axis display shape. (wire, ribbon, or tube display).

### `axis_scale`
The axis scale. This is multiplied by the scale component of the input matrix.

### `axis_size`
The axis width, relative to the axis scale. (not working with the wire shape mode).

## Outputs

### `diagnostic_geo`
The transformation axis.