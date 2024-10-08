# `generate_venation`

Generates growing veins from seed points toward attractor points. This tool is base on the Space Colonization Algorithm.

## Inputs

### `attractor_points`
The attractor points. These are the points that influences the growth of the veins. At each step, the veins grow toward the average attractor direction. Once a veins has reach the range of an attractor's kill radius, this attractor will be deleted. 

### `seed_points`
The seed points. These are the points from where the veins will start growing. 

### `processing_mode`
Defines how the growth is processed.
- Simulation: Grows the veins frame by frame until all attractors have been reached by the veins, or if the `end_frame` is reached. This is the default mode and should be used for animation.
- Iteration: Grows veins all at one iteratively until the `max_iterations` is reached. This mode only outputs the final result and should not be used for animation.
- Off: Disables the growth.

### `attraction_radius`
When a node reaches the attraction radius of an attractor point, this node will be attracted toward this attractor. When multiple attractors share the same closest node, the direction of this node is averaged between these attractors.

### `attraction_radius_weights`
Controls the attraction radius value per point.
If nothing is connected, the value set on `attraction_radius` is 1 for all points. This is an *interpreted auto port* that accepts the following types:
- A single `float` is interpreted as a constant value for all points.
- An `array<float>` is interpreted as values per point. The array gets resized to match the number of points, if necessary.
- A `string` is interpreted as the name of an existing geo property, and its values are used.
- A `ScalarField` is sampled at each position of the geometry's components.

### `kill_radius`
When a node reaches the kill radius of an attractor point, this attractor gets deleted an will no longer influcence the venation growth. This value should always be smaller than the `attraction_radius`.

### `kill_radius_weights`
Controls the kill radius values per point.
If nothing is connected, the value set on `kill_radius` is 1 for all points. This is an *interpreted auto port* that accepts the following types:
- A single `float` is interpreted as a constant value for all points.
- An `array<float>` is interpreted as values per point. The array gets resized to match the number of points, if necessary.
- A `string` is interpreted as the name of an existing geo property, and its values are used.
- A `ScalarField` is sampled at each position of the geometry's components.

### `step_length min / max_`
The length by which segments grows.

### `step_length_seed`
Controls the randomness of the step length randomness.

### `seeds`
The seed points. These are the points from where the veins will start growing. 

### `clamp_step_lengh`
When enabled, applies angle clamping along the branches growth.

### `step_angle min / max`
Controls the min and max step angle clamping.

### `clamp_angle_lengh`
When enabled, applies angle clamping on the first segment of newly generated branches.

### `branch_angle min / max`
Controls the min and max branch angle clamping.

### `seed_size`
The size of the seeds. This value is used as the branches's root size, and will be modulated along the strands according to the `size_profile` fcurve.

### `seed_size_weights`
Controls the seed size values per point.
If nothing is connected, the value set on `seed_size` is 1 for all points. This is an *interpreted auto port* that accepts the following types:
- A single `float` is interpreted as a constant value for all points.
- An `array<float>` is interpreted as values per point. The array gets resized to match the number of points, if necessary.
- A `string` is interpreted as the name of an existing geo property, and its values are used.
- A `ScalarField` is sampled at each position of the geometry's components.

### `size_profile`
Modulates the branches sizes along the growth length.

### `display_nodes`
Draws the generated nodes colored by their respective strand indices.

### `display_attraction_radius`
Draws green circles defining the per-attractor attraction radius. 

### `display_kill_radius`
Draws red circles defining the per-attractor kill radius. 

## Outputs

### `strands`
The output strands.