# `update_strands_neighbors`

Updates the neighbor indices for each points of a strands object. The result is a 2D array containing the neighbors indices of each points.

## Inputs

### `strands`
The input strands object.

### `indices`
The indices to be diagnosticed. When the diagnostic terminal is ON, arrows will be displayed between the selected point indices and their point neighbors. Multiple indices can be diagnosticed together by separating them with comma like `0, 2, 4, 6`. Inputing `*` will draw all point neighbors.

## Outputs

### `out_strands`
The modified strands object.

### `point_neighbors`
A 2D array containing the point neighbors indices of each points.
