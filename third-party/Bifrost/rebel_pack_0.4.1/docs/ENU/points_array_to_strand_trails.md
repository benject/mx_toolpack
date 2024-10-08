# `points_array_to_strand_trails`

Creates strands trails from an array of points geometries. Trails will connect the first point of each geometry to each other. 

If the point geometries have the property, `point_id`, then `point_id` will be used to identify which points should be connected. It's expected that each point in a geometry has a unique ID - if two points in a single geometry share an ID, results may be unexpected. 

See also: `create_particle_trails`. 

## Inputs

### `points_array` 

The point-based geometries are supplied here, which will be connected together into strands. 

### `properties` 

Allows specifying custom user properties to copy to the strands. By default this is point_position and point_size - meaning the strands will have the sizes and postions of the particles they are emitted from. 

## Point ID

`point_id` data produced by particles tend to be low-numbered. This will allocate an array with the size of the lartest point ID. Point IDs based on hashes are therefore unsuitable for use with this node. 