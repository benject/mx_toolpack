# `generate_L_system`

Implementation of a simple Lindenmayer system. https://en.wikipedia.org/wiki/L-system

## Inputs

### `generations`
Defines the number of recursive iterations. At the moment, only the integer part of the float value is used, as partial generations has not been implemented yet.

### `rotation_chaos`
Apply a random rotation when instructions acting on the orientation are called. These values are in degree angles.

### `random_seed`
The seed of the random number generator. Change this value to generate a different variation of the chaos parameters.

### `Rules: rules & rewrite_rules`
The rule system is devided in two parts: The axiom, defining the initial state of the L-system, and the rewrite rules: A set of strings to replace defined character. 
The rewrite rules gets insered in the global string, replacing all the matching characters. The rewrite operation is triggered when the first characters of the rewrite rules are found in the global string. The trigger character of the rewrite rule has has to be unique and must be placed before an `=` character. More informations at https://en.wikipedia.org/wiki/L-system

### `Rules: Symbol Instructions`
Each of the following instructions has different effects L-system evolves. Characters that are not present is the following list can still be used to trigger rewrite rules, but will not have effect on the generation of the L-system.

	`F`	Move forward drawing a line

	`f`	Move forward without drawing a line

	`+`	Turn left by current `angle`

	`-`	Turn right by current `angle`

	`/`	Roll clockwise by current `angle`

	`\`	Roll counter-clockwise down by current `angle`

	`&`	Pitch up by current `angle`

	`^`	Pitch down by current `angle`          

	`|`	Turn by 180 degrees

	`*`	Roll 180 degrees

	`>`	Multiply the current `length` by `length_scale`

	`<`	Divide the current `length` by `length_scale`

	`(`	Multiply the current `angle` by `angle_scale`

	`)`	Divide the current `angle` by `angle_scale`

	`{`	Multiply the current `size` by `size_scale`

	`}`	Divide the current `size` by `size_scale`

	`1`	Change current color to `color_1`

	`2`	Change current color to `color_2`

	`3`	Changes current color to `color_3`

	`L`	Place an instance using `instance_geometry_1`

	`M`	Place an instance using `instance_geometry_2`

	`N`	Place an instance using `instance_geometry_3`

	`[`	Start a branch and saves the current turtle state

	`]`	End a branch and restore aturtle state

### `length_compensation`
Compensate the length by halving it at each iteration. This can be used to prevent a system from scaling up at each generations.

### `length`
The initial length step, defining how long the forward instructions `F` or `f` are growing.

### `length_scale`
The length scale factor. When the instructions `>` or `<` are called, the current length will be multiplied or divided by this value.

### `length_chaos`
Adds a randomized variation on the current length.

### `angle`
The initial angle by which the current orientation will be rotated when orientation related instructions are called. This value is in angle degrees.

### `angle_scale`
The angle scale factor. When the instructions `(` or `)` are called, the current angle will be multiplied or divided by this value.

### `angle_chaos`
Adds a randomized variation on the current angle. This value is in angle degrees.

### `size`
The initial width of the strands. Generated instances are scaled according to this value. 

### `size_scale`
The size scale factor. When the instructions `{` or `}` are called, the current size will be multiplied or divided by this value.

### `size_chaos`
Adds a randomized variation on the current size.

### `color_1`
A color to become the current color when the instruction `1` is called. `color_1` also defines the initial color.

### `color_2`
A color to become the current color when the instruction `2` is called.

### `color_3`
A color to become the current color when the instruction `3` is called.

### `instance_scale`
Multiply the scale of the instances. Since `size` is usually low, this can be used to scale the instances up.

### `instance_geometry_1`
An instance geometry to be instanced when the instructions `L` is called. The instance scale is defined by the current `size`.

### `instance_geometry_2`
An instance geometry to be instanced when the instructions `M` is called. The instance scale is defined by the current `size`.

### `instance_geometry_3`
An instance geometry to be instanced when the instructions `N` is called. The instance scale is defined by the current `size`.

### `Transform`
Scales, rotates, and translates the generated object. You can use a matrix by enabling `use_transform_matrix` and use the input `transform` port.

## Outputs

### `strands`
The output strands

### `instances`
The output instances.
