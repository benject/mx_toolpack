# `catmull_rom_strands`

Implementation of the Centripetal Catmull-Rom spline algorithm. 
Generates a smooth strand traversing all the input `control_points`.

Source: https://en.wikipedia.org/wiki/Centripetal_Catmull-Rom_spline

## Inputs

### `control_points`
The control points in which the strand passes through.

### `parameterization`
Controls the tension of the curve, or knot parameterization.

- `0.0` = `Uniform`.
- `0.5` = `Centripetal`.
- `1.0` = `Chordal`.

### `samples`
Defines the number of points generated for each segments of the strand.

### `is_closed`
Close the strand.

## Outputs

### `strands`
The output strands.

### `positions`
The point_position of the strands.