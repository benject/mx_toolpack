# `closest_point_to_line_ratio`

Returns the ratios on a line defining its closest locations from a point.

## Inputs

### `position`
The point position to find the closest location on the line.

### `line_start`
The start position of the line.

### `line_end`
The end position of the line.

### `proximity_method`
The proximity method to determinate how the shortest distance between the point and the line should be calculated.

* `line` finds the closest location on an infinite line. 
* `segment` finds the closest location on a line exceeding its bounds.

## Outputs

### `ratio`
The ratio defining where on the line is the closest location from the `position`.