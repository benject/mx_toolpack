# `uv_wrap_deformer`

Deforms point geometry objects (mesh, strands, points) from the closest location to the `target_mesh` uv representation to its world space shape. This is a modified version of Anto Matkovic's "deform_by_uv" : http://www.matkovic.com/anto/fe_deform_by_uv.png 

## Usage
You should first define the `UV Set` to use and set the `UV Transform`. Then, enable the Diagnostic output in order to have a visual feedback of the UV mesh. After that, the `in_objects` should then be placed near the uv_mesh. Once you are done, the `out_objects` will be wrapped on the `target_mesh`'s original shape, relative to their placement on the `uv_mesh`. You can use the `weight` parameter to blend between the rest shape and the deformed shape.

## Inputs

### `in_objects`
The input objects (mesh, strands, points). These objects will get wrapped around the target mesh's original shape.

### `target_mesh`
The mesh where the objects will be wrapped around, relative to the UV mesh.

### `uv_number`
A mesh can contain multiply UV sets. This port specifies which UV set to get.

### `data_type`
The desired data type to get the UVs as. The internal storage type of the UVs will be converted to this type.

### `Transform`
Scales, rotates, and translates the generated object. You can use a matrix by enabling `use_transform_matrix` and use the input `transform` port.

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
The deformed point geometry objects, wrapped around the `target mesh`.


