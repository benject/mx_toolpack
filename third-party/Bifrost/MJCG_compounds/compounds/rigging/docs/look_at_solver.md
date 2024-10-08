# `look_at_solver`

Returns transform matrices aiming to a target's direction.

## Inputs

### `weight`

The weight of the `look_at_solver` constraint.

### `inputs`

The input transform matrices. These should be placed where you want your `out_transforms`'s position to be.

### `target`

The target transform matrix, defining where the `out_transforms` will be aiming at.

### `up_vector`

The up vector transform matrix. defining the up direction of the `out_transforms`. This also serves as a roll controller.

## Outputs

### `out_transforms`

The output transformation matrices. These should be used to drive the transformation of your scene objects.


