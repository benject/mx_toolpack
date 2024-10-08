# `spherify_deformer`

Deforms point geometry objects (mesh, strands, points) into a spherical shape.

## Inputs

### `in_objects`
The input point geometry objects (mesh, strands, points), to be deformed into a spherical shape.

### `update_normals`
Updates the output object's normals (works only on mesh geometry).

### `weight`
define the weight of the deformer effect. a value of zero means no deformation, while a value of 1 means full deformation.

### `weight_property`
The name of a float property that can be used to vary the deformation weights per point.

## Outputs

### `out_objects`
The array of point geometry objects. The array will contain as many elements as you plug in the `in_objects` port.