# `frustum_culling`

Deletes geometry components (points and mesh object) outside the field of view of a camera. It culls geometry that is completely outside of the view. If a geometry is just partially visible inside the frustum, is will not get culled.

## Inputs

### `geometry`
The geometry to cull.

### `camera_transform`
The world matrix of the camera.

### `angle_of_view`
The angle of view of the camera. This value is in degree angles.

### `aspect_ratio`
The aspect ratio of the camera.

### `near_clip_plane`
The near clip plane of the camera.

### `far_clip_plane`
The far clip plane of the camera.

### `frustum_offset`
Increase the width and height size of the frustum. This value is in unit.

## Outputs

### `out_geometry`
The culled geometry.

### `deleted_indices`
The indices of points which are outside the field of view.

### `remaining_indices`
The indices of points which are within the field of view.