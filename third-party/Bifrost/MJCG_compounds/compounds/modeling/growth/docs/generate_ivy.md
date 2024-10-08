# `generate_ivy`

Generates growing veins from seed points toward attractor points. This tool is base on the Space Colonization Algorithm.

## Inputs

### `seeds`
The seeds objects. This port only accepts `ivy_seeds` nodes as inputs.

### `surfaces`
The surface objects. This port only accepts `ivy_surface` nodes as inputs.

### `lights (optional)`
The light objects. This port only accepts `ivy_light` nodes as inputs.

### `processing_mode`
Defines how the growth is processed.
- Simulation: Grows ivy frame by frame until the `end_frame` is reached.
- Iteration: Grows ivy all at once iteratively until the `max_iterations` is reached. This mode is much faster, but only shows the final result as no geometry is being updated each frames. 
- Off: Disables the growth.

### `gravity`
The gravity direction. The ivy will grow against, and hanging branches will fall toward this vector.

### `sample_count`
The number of candidates directions for generating a new node. When a new node is to be created, random candidates will be generated inside a cone. Each candidates is then evaluated with the different tropism models, and the one with the best score is selected as the next step. More samples returns more accurate results at the cost of being slower. A low sample count is faster but introduce inaccuracies, but can be used to add more randomness to the growth.

### `sample_seed`
The random seed of the sample generation.

### `step_angle`
The maximum angle a new node can differ from its parent. This represent the half angle value of the cone in which the candidate directions are generated.

### `branch_angle`
The angle by which the candidate directions cone is rotated away from the parent branch's direction. Even if it is left as 0, the branches still grow away from their parents, relative to the `step_angle`. This can be used to force a wider branching direction.

### `branch_spacing`
The radius in which nodes will search for their neighbor leaves. The greater the value, the more then branches grow away from each other. This parameter is related to the shade avoidance tropism.

### `max_self_shadow`
The maximum self shadow allowed for new nodes to be generated. If a node tries to grow in a crowded area, it will calculate the self shadow based on the number of neighbor nodes and the size of their leaves. If the shadow score is greater than the max_self_shadow, the new node will not be able to grow. Therefore, a greater value allows for more nodes to be generated, resulting in a denser ivy.

### `apical_dominance`
The apical dominance is the rate at which the main branch grows faster than their child branches. Internally, this controls the distribution of nutrition between the branches and their child branches. A greater value makes younger branches to grow much faster then their child branches, while a lower value will make the nutrition distribution to be more even, resulting in a more even ivy growth. This value should be between 0 and 1.

### `nutrition_step`
The base nutrition value to be added at each growth step. This value is not the actual value that is added as each nodes recieve a different amount of nutrition depending on their age, their branch level, the apical dominance and the sampled nutrition value from a surface. Greater values allow the ivy to grow faster. 

### `node_growth_threshold`
The minimum nutrition value required in order to generate a node.

### `branch_growth_threshold`
The minimum nutrition value required in order to generate a branch.

### `sucker_length`
The distance in which nodes will try to stick to the closest surfaces. If a node grows outside of this distance, its branch will be treated as a hanging branch and will start to fall down. This value should be close to the `internode_length` in order to produce accurate results.

### `internode_length`
The length of segments between each leaves.

### `min_hanging_length`
The minimum random length allowed for hanging branches.

### `max_hanging_length`
The maximum random length allowed for hanging branches.

### `mass`
The mass of hanging branches. Higher values will make the hanging branches to fall quicker.

### `moment_threshold`
If the moment of a hanging branch is less than this value, the hanging branch will stop falling. This is related to the physics of lever.

### `min_hanging_twist`
The minimum random twist of hanging branches. This only rotates the leaves.

### `max_hanging_length`
The maximum random twist of hanging branches. This only rotates the leaves.

### `min_leaf_size`
The size of leaves when they are born. Since leaves are used in the calculation of self shadow, their sizes influence the ivy growth.

### `max_leaf_size`
The maximum size of leaves. Since leaves are used in the calculation of self shadow, their sizes influence the ivy growth.

### `min_leaf_nutrition`
The minimum nutrition value allowed to start increasing the leaf sizes.

### `max_leaf_nutrition`
When a node reaches this nutrition value, the maximum leaf size is reached.

### `min_stem_size`
The size of stems when they are born.

### `max_stem_size`
The maximum size of stems.

### `min_stem_nutrition`
The minimum nutrition value allowed to start increasing the stem sizes.

### `max_stem_nutrition`
When a node reaches this nutrition value, the maximum stem size is reached.

### `solver_weights`
This controls the weights of the individual tropism models of the solver. Each values are step at 1.0 by default but this can be modified to achieve some effects.
- shade_avoidance_weight: Controls how much nodes grow away from their self shadow.
- phototropism_weight: Controls how much nodes grow towards lights.
- geotropism_weight: Controls how much nodes grow against the gravity (up).
- adhesion_weight: Controls how much the nodes try to stick to the surfaces.
- direction_weight: Controls how much the nodes grow in the same direction as their parent nodes.
- gravity_weight: Controls how much hanging branch nodes grow toward the gravity (down).

### `display_leaves`
Displays the leaves for preview and render.

### `display_stems`
Displays the stems for preview and render.

### `display_nutrition`
Displays the nutrition values of each nodes.

### `display_branch_radius`
Displays green circles around buds representing the branch spacing range. 

## Outputs

### `strands`
The output strands.

### `instances`
The output instances, containing the leaves.