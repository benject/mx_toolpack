# `blend_space_solver`

Returns transform matrices interpolated between two different spaces. 

## Inputs

### `blend`

Blend between the two spaces. a value of 0 will constrains the inputs onto the `space_a_ctl`, a value of 1 will constrains the inputs onto the `space_b_ctl`. a value between 0 and 1 will return interpolated transforms between `space_a_ctl` & `space_b_ctl`.

### `inputs`

The input transform matrices. These should be used as world reference transforms, and should not be movable.

## Outputs

### `out_transforms`

The output transformation matrices. These should be used to drive the transformation of your scene objects.



