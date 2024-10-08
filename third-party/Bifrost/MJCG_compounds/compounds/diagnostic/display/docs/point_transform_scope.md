# `point_transform_scope`

Draws the transformation axis for a given point geometry object. 

## Inputs

### `geometry`
The input point geometry.

### `axis_shape`
The axis strands shape.

### `axis_scale`
The axis scale. This is multiplied over `point_size` or `point_scale` if these properties are found.

### `axis_size`
The axis width, relative to the axis scale. (not working with the wire shape mode).

## Outputs

### `diagnostic_geo`
The transformation Axis.