# `check_strands_orientations`

Checks if a `point_orientation` exists on a strands object, If it doesn't, also checks for existing `point_tangent`, `point_normal`, `point_binormal` properties, and compute the `point_orientation` from the basis vectors. If none of the previous properties are found, update the strands `point_orientation` and basis vectors according to the `Framing` settings.

## Inputs

### `strands`
The input strands object.

### `update_framing`
When enabled, forces the `point_orientation` and basis vectors update, according to the `Framing` settings.

### `up_vector`
Defines the strands's first segment normal vector that will be propageted through the strands's length.

### `up_vector_property`
If a property with this name is found on the strands object, it will be used instead of the values from the `up_vector` port.

### `framing_algorithm`
The algorithm used to compute the strand's normals. `Up Vector`, `parallel Transport`, `Double Reflection`.

## Outputs

### `out_strands`
The modified strands object.
