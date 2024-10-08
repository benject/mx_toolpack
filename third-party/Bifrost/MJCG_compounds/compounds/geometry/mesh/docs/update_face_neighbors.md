# `update_face_neighbors`

Updates the neighbor indices for each faces of a mesh object. The result is a 2D array containing the neighbors indices of each faces.

## Inputs

### `mesh`
The input mesh object.

### `indices`
The face neighbors indices to be diagnosticed. When the diagnostic terminal is ON, arrows will be displayed between the selected face indices and their face neighbors. Multiple indices can be diagnosticed together by separating them with comma like `0, 2, 4, 6`. Inputing `*` will draw all face neighbors.

## Outputs

### `out_mesh`
The modified mesh object.

### `face_neighbors`
A 2D array containing the face neighbors indices of each faces.
