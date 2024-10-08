# `soften_harden_mesh_normals`

Generates face vertex normals of a mesh and smooth the adjacent faces that differs less than a defined angle.

## Inputs

### `mesh`
The input mesh object.

### `weights`
Acts as a per-point multiplier of the angle value. This can be used to controls where normal softening should be applied.
If nothing is connected, the default weight is 1 for all points. This is an *interpreted auto port* that accepts the following types:
- A single `float` is interpreted as a constant value for all points.
- An `array<float>` is interpreted as values per point. The array gets resized to match the number of points, if necessary.
- A `string` is interpreted as the name of an existing geo property, and its values are used.
- A `ScalarField` is sampled at each position of the geometry's components.
- An `array<long>` specifies the indices to be assigned a value of 1. Other indices are assigned 0.

### `angle`
Controls the soft / hard edge of the face vertex normals. Adjacent face normals greater than this value will be split into different smoothing groups. A value of 0 will returns hard normals, while greater values will result in smoother normals. The value is in degrees.

## Outputs

### `out_mesh`
The modified mesh object.

### `face_vertex_normal`
The `face_vertex_normal` float3 array.
