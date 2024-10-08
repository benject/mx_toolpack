# `eyelid_solver`

Returns a set of bezier interpolated `out_transforms` between internal control points. This solver is meant to automate human eyelid movements.

Disclamer: Although this solver runs at very reasonable speed, the solver is subject to a lot of performance optimization.

## Rig Settings

### `elevation_inheritance` 

The global elevation delta weight, based on eyeball's local X rotation angle.

### `medial_elevation_weight` 

The elevation delta weight of the medial side only.

### `lateral_elevation_weight` 

The elevation delta weight of the lateral side only.

### `azimuthal_inheritance` 

The global azimuthal delta weight, based on eyeball's local Y rotation angle.

### `medial_azimuthal_weight` 

The azimuthal delta weight of the medial side only.

### `lateral_azimuthal_weight` 

The azimuthal delta weight of the lateral side only.

### `use_fcurve` 

Wheather to use the `blink_edge_fcurve` or not.

### `blink_edge_fcurve` 

the Fcurve to tweak the closed eyelid's shape.

## Rig Setup

### `deformer_count` 

Defines the numbers of `out_transforms` for the eyelid.

### `is_low_side` 

Enable it if the solver is controlling a lower eyelid.

### `is_right_side` 

Enable it if the solver is controlling a right-sided eyelid.

## Rig Objects

### `eyeball_npo` 

The eyeball neutral position transform. This object should be parented such as it follows the head's movements.

### `eyeball_ctl` 

The eyeball controller, defining the orientation of the eyeball. This object should be parented to the `eyeball_npo`, sharing the same position.
 
### `lid_inward_npo` 

The inward transform. This should be placed where the upper and lower eyelid meets, on the nose's side. This object should be parented such as it follows the head's movements.

### `lid_medial_npo` 

The medial neutral position transform. This object should be parented such as it follows the head's movements.

### `lid_center_npo` 

The center neutral position transform. This object should be parented such as it follows the head's movements.

### `lid_center_npo` 

The center controller. This object should be parented to the `lid_center_npo`.

### `lid_lateral_npo` 

The lateral neutral position transform. This object should be parented such as it follows the head's movements.

### `lid_outward_npo` 

The outward transform. This should be placed where the upper and lower eyelid meets, on the ear's side. This object should be parented such as it follows the head's movements.

## Outputs

### `out_transforms`

The output transformation matrices. These should be used to drive the transformation of your scene objects.


