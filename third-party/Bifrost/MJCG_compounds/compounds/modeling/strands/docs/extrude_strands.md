# `extrude_strands`

Generates a mesh for a given strands object. 

## Inputs

### `strands`
The input strands object.

### `custom_shape`
The custom point geometry object to be used with the `Custom` extrusion mode.
The shape's points indices must be properly orderer. 

### `extrusion_shape`
Choose between `Ribbon`, `Tube` or `Custom` extrusion mode.

### `reverse_normals`
Flips the normals of the output mesh.

### `create_uvs`
Generates normalized uvs for the mesh extrusions.

### `tube_sides`
The number of sides on each tubes. This value is only used with the `tube` extrusion mode.

### `start_cap`
Add cap faces at the start of each tubes.

### `end_cap`
Add cap faces at the end of each tubes.

### `alignment`
The world axis (X, Y, Z) used to define which axis the custom shape gets extruded from.

### `align_from_center`
When enable, the custom_shape gets aligned based on the center of its bounding box. 
When disable, The scene origin is used as the object's center.

### `close_extrusion`
If enabled, the extrusion gets closed along its length.

### `properties`
Transfer any point geo property from the strands to the extruded mesh. You can transfer multiple properties by separating them with a comma like: `color, point_ratio, point_strand_index`. `*` transfers all valid geo properties.

### `use_point_size`
If enabled, the `size` will me multiplied over the existing `point_size` property values.

### `size`
The uniform size of the extrusions. In case of a ribbon, it defines the width of the ribbon. In case of a custom shape, this will multiply the dimension of the shape.
It can be modulated using an fCurve.

### `width`
The width of the extrusions. This scales the extrusions along the strands's binormals. This value is multoplied on top the the `scale` attribute.
It can be modulated using an fCurve.

### `height`
The height of the extrusions. This scales the extrusions along the strands's normals. This value is multoplied on top the the `scale` attribute.
It can be modulated using an fCurve.

### `rotation`
Rotates the strands uniformally. This value is in degrees.

### `twist`
Twists the strands along their lengths. This value is in degrees.
It can be modulated by an fCurve.

### `update_framing`
When enabled, forces the `point_orientation` and basis vectors update, according to the `Framing` settings.

### `up_vector`
Defines the strands's first segment normal vector that will be propageted through the strands's length. (Active only if the input strands requires orientation update or if "force_update" in ON).

### `up_vector_property`
If a property with this name is found on the strands object, it will be used instead of the values from the `up_vector` port. (Active only if the s input trands requires orientation update or if "force_update" in ON).

### `framing_algorithm`
The algorithm used to compute the strand's normals. `Frenet`, `Up Vector`, `parallel Transport`, `Double Reflection`. (Active only if the  input strands requires orientation update or if "force_update" in ON).

## Outputs

### `mesh`
The generated mesh.