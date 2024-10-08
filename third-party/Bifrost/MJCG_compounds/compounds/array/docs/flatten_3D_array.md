# `flatten_3D_array`

Converts a three-dimensional array into a one-dimensional array. 

**The compound will be in a yellow error state until you plug a valid 3D array in the `array` input port.**

## Inputs

### `array`

The input two-dimensional array.

### `mode`

The conversion mode used to flatten the array:

1. Automatic: Choose the best conversion mode automatically, at the expense an extra computational cost prior to the flattening.

1. Constant Subsize: Flattens the array using parallel. Use this mode only if your sub-dimension array all have the same sizes.

1. Variable Subsize: Flattens the array using an iterative approach. You must use this mode if your sub-dimension array have variable sizes!
	
## Outputs

### `out_array`

The output one-dimensional array.
