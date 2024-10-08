# `strands_wrap_deformer`

Wraps point geometry objects (mesh, strands, points) along a strands object.

## Inputs

### `in_objects`
The input point geometry objects (mesh, strands, points), to be wrapped onto the target strands.

### `target_strands`
The strands object onto which the `in_objects` will be applied.

### `alignment`
The positive world axis (X, Y, Z) used to define which axis the `in_objects` should face the strands tangents.

### `align_from_center`
When enable, the objects gets aligned based on the center of their bounding boxes. 
When disable, The scene origin is used as the objects's center.

### `keep_length`
When enable, the objects will keep their original length.
When disable, the objects will be stretched or shrinked so that they match the strands lengths.

### `Length_scale`
How to return values between components:
interpolated returns the average value of the property at the nearest components, weighted by distance.
from_closest returns the value of the property at the nearest component.

### `offset`
Use offset to move the objects along the strands. Values greaters than one will move the object in the direction of the last strands tangents. Values less than zero will move the objects in the negative direction of the first strand's tangents.

### `use_point_size`
If enabled, the `size` will me multiplied over the existing `point_size` property values.

### `size`
Controls the scale of the wrapped geometry, relative to its positions along the strands.
It can be modulated by an fCurve.

### `width`
The width of the wrapped geometry, relative to the `size` value. This scales the geometries along the strands's binormals.
It can be modulated by an fCurve.

### `height`
The height of the wrapped geometry, relative to the `size` value. This scales the geometries along the strands's normals.
It can be modulated by an fCurve.

### `rotate`
Rotates the strands orientations. This value is in degree angle.

### `twist`
Twist the strands orientations along their lengths. This value is in degree angle.

### `update_framing`
When enabled, forces the `point_orientation` and basis vectors update, according to the `Framing` settings.

### `up_vector`
Defines the strands's first segment normal vector that will be propageted through the strands's length. (Active only if the  input strands requires orientation update or if "force_update" in ON).

### `up_vector_property`
If a property with this name is found on the strands object, it will be used instead of the values from the `up_vector` port. (Active only if the s input trands requires orientation update or if "force_update" in ON).

### `framing_algorithm`
The algorithm used to compute the strand's normals. `Frenet`, `Up Vector`, `parallel Transport`, `Double Reflection`. (Active only if the  input strands requires orientation update or if "force_update" in ON).

## Outputs

### `out_objects`
The array of point geometry objects, wrapped on the `target_strands`'mesh. The size of the array is the number of `in_objects`, multiplied by the number of sub-strands in the strands object.