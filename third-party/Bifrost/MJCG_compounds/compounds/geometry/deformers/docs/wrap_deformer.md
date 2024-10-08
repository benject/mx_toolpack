# `wrap_deformer`

Wraps point geometry objects (mesh, strands, points) onto another mesh.

## Inputs

### `in_objects`
The input point geometry objects (mesh, strands, points), to be wrapped onto the target mesh.

### `base_mesh`
The world reference target mesh. This should not be moved or deformed.

### `target_mesh`
The moving / deformed target mesh.

### `use_cutoff_distance`
When true, only mesh candidate locations within the cutoff_distance are considered.

### `cutoff_distance`
The distance within which the closest candidate locations are considered.

### `weight`
define the weight of the deformer effect. a value of zero means no deformation, while a value of 1 means full deformation.

### `weight_property`
The name of a float property that can be used to vary the deformation weights per point.
## Outputs

### `out_objects`
The array of point geometry objects, wrapped on the `target_driver`'mesh. The array will contain as many elements as you plug in the `in_objects` port.