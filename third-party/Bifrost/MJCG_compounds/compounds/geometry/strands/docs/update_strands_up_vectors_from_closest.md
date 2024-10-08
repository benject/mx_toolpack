# `update_strands_up_vectors_from_closest`

Sets a `strand_up_vector` geo property based on the closest `point_normal` (or other) property from a given geometry object.
The strands roots are used to queries closeset geometry.

## Inputs

### `strands`
The input strands object.

### `geometry`
The geometry which will be used to query the closest geo property.

### `property_to_query`
The name of the geo_property that will be queried on the closest geometry. The default is `point_normal`.

### `use_cutoff_distance`
When true, only mesh candidate locations within the cutoff_distance are considered.

### `cutoff_distance`
The distance within which the closest candidate locations are considered.

## Outputs

### `out_strands`
The modified strands object.
