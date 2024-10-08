# `point_scope`

A diagnostics compound for visualizing and analyzing point geometry and per-point properties.

Outputs an array of objects representing geometry that can be output to visualize most data connected to point geometry and per-point properties.

The core function of this compound extracts any point geometry passed to the `point_geo` port and displays it, using diagnostic coloring, vector display of vector properties and more.  The compound will work on anything with points in it, such as point clouds, particles, meshes (where the vertices are points), strands and curves (where the CVs are points), etc.

There are four parameter sections that allows the user to configure the analysis: "Point Shape", "Color", "Arrows", and "Culling".  Each parameter section will be explained below:

The `point_geo` port accepts the actual point geometry being analyzed.

Point Shape Section

This parameter section controls the shape and size of the point display. 

  * The `Shape` parameter controls which shape the points will be visualized as.
  * The `Default Size` parameter controls the size of each visualized point.

Color Section

This parameter section controls how each point is colored.

  * The `Color` parameter defines the default color of the points.
  * The `Coloring Mode` parameter determines which rules are used to color the points.  It is an ENUM with the following options:

   * "Color" - This mode simply uses whatever the `Color` parameter is set to
   * "ColoredProperty" - This mode colors the points by multiplying the `Coloring Property` with the `Color` parameter.  If the `Coloring Property` is a scalar, then this option becomes a uniform scaling of `Color`.  Negative values are not clamped or modified.  If the `Coloring Property` is a vector, per-component multiplication with `Color` is performed; e.g. the x-component scales red, the y-component scales blue, and so on.
   * "ColoredPropertyInvertNeg" - This mode is identical to "ColoredProperty" with the following caveats: If the `Coloring Property` is a scalar value, and it is negative, the resulting color will be the result of scaling 1-`Color` by the absolute value of the `Coloring Property`.  Also note that vector-valued properties will be converted to scalars by taking their magnitude.
   * "ColoredPropertyMagnitude" - This option takes the magnitude of the `Coloring Property` and uses that to scale the `Color`.  If the `Coloring Property` is already a scalar, then the absolute value is used.
   * "Property" - This mode simply colors the points by directly mapping the contents of `Coloring Property` to RGB.  If the `Coloring Property` is not a vector, then a greyscale mapping is done.
   * "NormalVector" - This mode uses the data mapped to RGB, but the vectors are normalized and remapped to a 0-1 range. 
   * "Heatmap" - This mode takes the magnitude of the `Coloring Property` and uses three fcurves to map the result into R, G and B.
   * "Palette" - This mode is designed for integer and bool properties.  It uses the `Coloring Property` to map into a fixed palette of colors.

  * The `Coloring Property` parameter allows control over which per-point property you want to drive the point coloring (see options above).
  * The `Heatmap R` - parameter drives the red component when using the "Heatmap" coloring mode (see above)
  * The `Heatmap G` - parameter drives the green component when using the "Heatmap" coloring mode (see above)
  * The `Heatmap B` - parameter drives the blue component when using the "Heatmap" coloring mode (see above)

Arrows Section

This parameter section provides controls for displaying per-point properties as arrows.

  * The `Enable Arrows` parameter toggles the arrow display on/off
  * The `Arrow Property` parameter allows control over which per-point property is used to drive the arrow display.  Vector properties will naturally be mapped to arrows, whereas scalar properties will be expanded into an arrow pointing in the (+X, +Y, +Z) direction, where each component of the vector is the scalar value.  2d vectors simply map to (x,y,0) arrows and for 4d vectors, the w-component is dropped.
  * The `Normalize Arrow` parameter, as its name implies, normalizes the arrow regardless of the magnitude of the `Arrow Property` value.
  * The `Length Scale` parameter scales the length of the arrow, and is applied post-normalization (if the `Normalize Arrow` parameter is checked).

The Culling Section

The parameters in this section control the point culling function.  You can cull away points based on scalar property values or using external geometry.

  * The `Cull By Scalar Property` toggle turns culling on/off
  * The `Cull Property` controls which per-point property will be used to cull by property.  Vector properties will be turned into scalars by taking their magnitude.
  * The `Keep Min Value` defines the lower bound of non-culled/displayed points.  The value refers to the per-point value found in the `Cull Property`.
  * The `Keep Max Value` defines the upper bound of non-culled/displayed points.  The value refers to the per-point value found in the `Cull Property`.
  * The `Invert Range` inverts the set of points being culled vs displayed
  * The `Bounds Geo` allows an external geometry mesh to define a spatial culling region.  Spatial culling is complementary to the culling by property.