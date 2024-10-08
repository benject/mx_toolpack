# `ivy_surface`

Prepares mesh surfaces and set required surface properties for ivy generation.

## Inputs

### `mesh`
The input meshes.

### `enable`
Activates the surface for ivy growth.

### `offset`
Offsets the surface along its point normals.

### `nutrition`
The nutrition factor of the surface. A value of 1 will not affect the solver's nutrition distribution. A value of 0 will stop the ivy from growing on the surface. Values between 0 and 1 will reduce the amount of nutrition gained at each steps.

### `nutrition_property`
The name of an existing float geo property to control the nutrition per point.

### `adhesion`
The surface adhesion, defining how easily the ivy attaches to the surface. A value of 1 makes the ivy to fully adher to the surface. A value of 0 will prevent the ivy from attaching to the surface. This can be useful to prevent the ivy from growing on some surfaces like glass windows or very smooth materials. 

### `adhesion_property`
The name of an existing float geo property to control the adhesion per point.

### `display_property`
Displays the surface's nutrition and adhesion per-point values. This is used when the diagnostic terminal is enable. 

## Outputs

### `surface`
The surface objects.