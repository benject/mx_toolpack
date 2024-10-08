# `create_mesh_from_uv`

Creates a plannar mesh from a given mesh UV channel.

## Inputs

### `mesh`
The input mesh from which the `uv_mesh` will be generated, according to its UV properties.

### `unfold`
Blends the `uv_mesh`'s between the world and uv positions.

### `uv_number`
A mesh can contain multiply UV sets. This port specifies which UV set to get.

### `data_type`
The desired data type to get the UVs as. The internal storage type of the UVs will be converted to this type.

### `Transform`
Scales, rotates, and translates the generated object. You can use a matrix by enabling `use_transform_matrix` and use the input `transform` port.

## Outputs

### `uv_mesh`
the output UV mesh, generated from the input `mesh`, according to its UV properties.