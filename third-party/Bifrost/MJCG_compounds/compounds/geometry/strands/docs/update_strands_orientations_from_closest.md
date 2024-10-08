# `update_strands_orientations_from_closest`

Calculate the basis vectors of a strands object, around the closest location of a given geometry object.
The `point_normal` component of the strands will face the opposite direction of the closest location.
For exemple, This could be used to generate bandages around an arm.

## Inputs

### `strands`
The input strands object.

### `geometry`
The geometry which will be used to query the closest location.

### `use_cutoff_distance`
When true, only mesh candidate locations within the cutoff_distance are considered.

### `cutoff_distance`
The distance within which the closest candidate locations are considered.

### `rotate_orientations`
Apply a rotation to the point orientation property. This values is in degrees.

## Outputs

### `out_strands`
The modified strands object.
