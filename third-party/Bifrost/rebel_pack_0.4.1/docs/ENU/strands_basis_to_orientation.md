# `strands_basis_to_orientation`

Converts strand basis vectors (point_tangent, point_normal) to the point_orientation property. This allows each point of the strands to be used as the point cloud for isntancing, placing an instance at each point with an orientation derived from the normals and tangents. 

Strands must have point_normals for this to work. `update_strands_basis` will create strand basis vectors. 

Orientations are produced using `normal_and_tangent_to_orientation`. See the documentation for that node for more information. 

## Inputs

### `rotate_radians`

An additional rotation to be specified - for example to rotate the orientations to align to a different vector. 

