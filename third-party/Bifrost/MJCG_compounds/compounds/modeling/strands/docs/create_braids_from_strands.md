# `create_braids_from_strands`

Creates 3 Strand Braids from strands. 
You need to compute or update the strands's orientations or basis vectors before this compound!

## Inputs

### `strands`
The input strands object.

### `spacial_segment_length`
Defines the strands segment count per strands. This value is relative to world unit.

### `spacial_frequency`
When enabled, the frequency will be applied per unit instead of per strand.

### `frequency`
The number of waves within the braids.

### `phase`
Offsets the braid's waves.

### `use_point_size`
If enabled, the `size` will me multiplied over the existing `point_size` property values.

### `size`
Controls the overall size of the braid. This values will be multiplied over the other dimension parameters.
It can be modulated using an fCurve.

### `width`
The width of the braids. This scales the braids along the strands's binormals.
It can be modulated by an fCurve.

### `height`
The height of the braids. This scales the braids along the strands's normals.
It can be modulated by an fCurve.

### `rotate`
Rotates the guide strands uniformally. This value is in degree.

### `twist`
Twists the guide strands along their length. This value is in degree.
It can be modulated by an fCurve.

### `up_vector`
Defines the strands's first segment normal vector that will be propageted through the strands's length. (Active only if the  input strands requires orientation update or if "force_update" in ON).

### `up_vector_property`
If a property with this name is found on the strands object, it will be used instead of the values from the `up_vector` port. (Active only if the s input trands requires orientation update or if "force_update" in ON).

### `framing_algorithm`
The algorithm used to compute the strand's normals. `Frenet`, `Up Vector`, `parallel Transport`, `Double Reflection`. (Active only if the  input strands requires orientation update or if "force_update" in ON).

### `force_update`
When ON, forces the orientation and basis update, even if a a `point_orientation` or basis vectors properties are found on the input strands

## Outputs

### `strands`
The generated braids.
