# `distance_between_lines`

Returns the shortest distance between two lines.

## Inputs

### `first_line_start`
The start position of the first line.

### `first_line_end`
The end position of the first line.

### `second_line_start`
The start position of the second line.

### `second_line_end`
The end position of the second line.

### `proximity_method`
The proximity method to determinate how the shortest distance between the two lines should be calculated.

* `line` finds the closest locations between infinite lines. 
* `segment` finds the closest locations between lines not exceeding their bounds.

## Outputs

### `distance`
The shortest distance between the two lines.