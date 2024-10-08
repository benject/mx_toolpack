# `update_strands_orientations`

Generates basis vectors `point_tangent`, `point_normal`, `point_binormal`, and a quaternion `point_orientation` geo properties for strands objects.

## Inputs

### `strands`
The input strands object.

### `up_vector`
Defines the strands's first segment normal vector that will be propageted along the strands. 

### `framing_algorithm`
The algorithm used to compute the strand's basis vectors. `Up Vector`, `parallel Transport`, `Double Reflection`, `Vector Projection`.

### `up_vector_property`
If a property with this name is found on the strands object, it will be used instead of the values from the `up_vector` port.

### `rotate_orientations`
Apply a rotation to the `point_orientation` property. This values is in degree angles.

## Outputs

### `out_strands`
The modified strands object.

### `point_tangent`
The `point_tangent` vector3 array.

### `point_normal`
The `point_normal` vector3 array.

### `point_binormal`
The `point_binormal` vector3 array.

### `point_orientation` 
The `point_orientation` vector4 array.

