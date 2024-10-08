# Release log 

### `2.1.0 - June 23, 2022`

#### New compounds
    ● compute_graph_coloring: A graph colorer with 3 algorithms: Greedy, Jones-Plassmann, Welsh-Powell.
    ● closest_point_to_line_ratio: Returns the ratios on a line defining its closest locations from a point.
    ● closest_line_to_line_ratios: Returns the ratios on two lines defining their closest locations from each other.
    ● distance_between_point_and_line: Returns the shortest distance between a point and a line.
    ● distance_between_lines: Returns the shortest distance between two lines.
    ● find_quadratic_roots: Finds the roots of a quadratic equation.
    ● find_cubic_roots: Finds the roots of a cubic equation.

#### New graphs
    ● graph_coloring_points
    ● graph_coloring_faces
    ● shortest_path_between_segments
    ● closest_position_on_segment

#### Enhancements
    ● "generate_L_system" is ~50% faster.
    ● "generate_ivy" is faster.
    ● "generate_venation" is faster. 
    ● "create_point_mendelbulb" is faster and use less memory.
    ● "update_face_neighbors" now returns both direct and indirect face neighbors. 
    ● "angle_between_vectors" now accepts all vector data types.
    ● "distance_between_vectors" now accepts all vector data types.
    ● "multiply_vector_by_matrix" now accepts all vector data types.
    ● "resize_vector" now accepts all vector data types. 

#### Bug fixes
    ● "soften_harden_mesh_normals" Could not transfer face vertex normal when converting mesh to Maya mesh.
    ● "resize_strands" returned incorrect results when preserve_positions was disabled.
    ● "update_mesh_curvature" returned unnormalized values.
    ● "angle_between_vectors" returned NaN is some cases.
    ● "bias" was broken.
    ● "look_at_solver" Fixed up_vector behavior. 

#### Behavior change
    ● Generate_L_system: Chaos have a different behavior compared to the previous version. If you have chaos applied in your L-system, the generated shape will be a bit different. 

---------------------------------------------
### `2.0.1 - March 16, 2021`

#### Bug fixes
    ● Cleaned trivial loading error messages.
    ● Fixed small issues in the update script.

---------------------------------------------
### `2.0.0 - February 26, 2021`

#### License
    ● MJCG compounds is now released under MIT license.

#### New compounds
    ● generate_ivy: Generates surface climbing ivy plants. [BETA]
        ● ivy_seeds: Initialize ivy seeds.
        ● ivy_surface: Initialize ivy surfaces.
        ● ivy_lights: Initialize ivy lights.
    ● generate_L_system: Generates geometry procedurally using a Lindenmayer system. [BETA]
    ● generate_venation: Generates growing strands by colonizing points (Space Colonization Algorithm implementation).
    ● frustum_culling: Culls geometry components outside the field of view of a camera.
    ● create_plexus_from_points: Creates a strands plexus by connecting points by proximity.
    ● smooth_geo_property: Smooth a geo property by averaging adjacent values.
    ● smooth_strands: Smooth strands by averaging adjacent points.
    ● resize_strands: Changes the length of strands objects.
    ● scale_strands: scales strands objects from their roots.
    ● soften_harden_mesh_normals: Computes and smooths the adjacent face vertex normals that differs less than a defined angle.
    ● update_mesh_curvature: Computes the per-point curvatures of mesh objects.
    ● update_strands_curvature: computes the per-point curvatures of strands objects.
    ● update_strands_neighbors: computes the adjacent point indices of strands objects.
    ● update_face_neighbors: computes the adjacent face indices of mesh objects.
    ● convert_to_points: converts point-based geometries to points objects while preserving per-point properties.
    ● hash_string: hash a string into a pseudo-unique 64-bit integer.
    ● bias: Christophe Schlick’s bias function.
    ● gain: Christophe Schlick’s gain function.
    ● bias_and_gain: Jonathan T. Barron's generalization of Schlick's "bias" and "gain" functions.
    ● one_minus: substract a value from 1.
    ● get_point_size: simple get property node.
    ● set_point_size: simple set property node.

#### New graphs
    ● aim_constraint
    ● braid
    ● cardioid
    ● centripetal_catmull_rom_strands
    ● clump points
    ● clump_strands_on_guides
    ● conform_strands_to_surface
    ● eyelid_rig
    ● face_position
    ● fill_array_between_values
    ● frustum_culling_example
    ● instances_along_strand
    ● instances_along_strands
    ● ivy_basic_growth
    ● ivy_hanging_branches
    ● ivy_point_light
    ● ivy_seed_array
    ● ivy_sunlight
    ● ivy_variable_adhesion
    ● ivy_variable_nutrition
    ● L_system_example_1
    ● L_system_example_2
    ● L_system_example_3
    ● L_system_example_4
    ● L_system_example_5
    ● L_system_example_6
    ● L_system_example_7
    ● L_system_example_8
    ● L_system_example_9
    ● mesh_curvature
    ● plexus
    ● point_mandelbrot
    ● point_mandelbulb
    ● resize_vector_world
    ● smooth_geo_property_color
    ● smooth_geo_property_curvature
    ● smooth_geo_property_normal
    ● smooth_strands_with_field
    ● soften_harden_normals
    ● spherify
    ● strands_curvature
    ● strands_random_color
    ● strands_random_cut
    ● strands_random_scale
    ● strands_wrap
    ● transpose_2D_array_RGB
    ● uv_wrap
    ● venation_cat
    ● venation_plane
    ● venation_sphere
    ● wrap

#### Enhancements
    ● extrude_strands:
        ● Can now transfer any geo property from the strands to the extruded mesh (limited to point_component properties).
        ● Added "start_cap" / "end_cap" options for tube extrusion mode.
        ● Added "reverse_normals" option.
        ● Added "use_point_size" option. If enable: dimension values will be multiplied over an existing "point_size" property. 
        ● Added alignment & close_extrusion options for custom shape extrusion mode.
        ● Simplified UV creation workflow.
        ● Added Terminal outputs.
        ● Is faster.
    ● curl_strands:
        ● Added "spatial_frequency" option.
        ● Added "weights" interpreted auto-port.
        ● Added Terminal outputs.
    ● create_braids_from_strands:
        ● Added "spatial_frequency" option.
        ● Added "use_point_size" option. If enable: dimension values will be multiplied over an existing "point_size" property.
        ● The braid strands segment count is now defined by a spatial_segment_length parameter. 
        ● Added Terminal outputs.
    ● update_stands_orientations:
        ● Added "Vector Projection" framing algorithm.
        ● Added internal mechanism to deal with invalid up-vectors.
        ● Default framing algorithm has been reverted back to Parallel Transport.
        ● Added Terminal outputs.
    ● wrap_deformer:
        ● Added "weight_property" input to control deformation with a per point property.
        ● Deformation result is more accurate.
        ● Added Terminal outputs.
    ● strands_wrap_deformer:
        ● Added "use_point_size" option. If enable: dimension values will be multiplied over an existing "point_size" property. 
        ● Added width & depth parameters which controls the scale of the geometry relative to its positions along the strands.
        ● Added Terminal outputs.
    ● uv_wrap_deformer:
        ● Now has "weight_property" input to control deformation with a per point property.
        ● Is now making use of the new uv_number workflow to instead of using uv properties. 
        ● Deformation result is more accurate.
        ● Added Terminal outputs.
    ● create_mesh_from_uv:
        ● Added "unfold" parameters to blend the output mesh between UV and world space.
        ● Is now making use of the new uv_number workflow instead of setting uv properties. 
        ● Added Terminal outputs.
    ● spherify_deformer:
        ● Added "weight_property" input to control deformation with a per point property.
        ● Added Terminal outputs.
    ● create_point_grid:
        ● Fixed a bug causing resolutions to return incorrect values.
        ● Added Terminal outputs.
    ● create_point_mandelbrot:
        ● Added initial color support
        ● Added Terminal outputs.
    ● create_point_mandelbuld:
        ● Point size is now automatically calculated depending on the resolution.
        ● Added Terminal outputs.
    ● transpose_2D_array:
        ● Added support for variable sub-sized 2D arrays.
        ● Is easier to use.
    ● rotate_strands:
        ● Added randomization option and parameters.
        ● Added "weights" interpreted auto-port.
        ● Added Terminal outputs.
    ● create_catmull_rom_strands:
        ● Added Terminal outputs.
        ● Is faster
    ● point_transform_scope:
        ● Added Terminal outputs.
        ● Is faster
    ● transform_scope:
        ● Added Terminal outputs.
        ● Is faster
    ● create_cardioid: Added Terminal outputs.
    ● create_circle: Added Terminal outputs.
    ● update_strands_orientations_from_closest: Added Terminal outputs.
    ● update_strands_up_vectors_from_closest: Added Terminal outputs.
    ● update_face_position: Added Terminal outputs.
    ● resize_vector: Added supports float2 and float4 vector types.
    ● flatten_2D_array: auto mode is faster.
    ● flatten_3D_array: auto mode is faster.
    ● remove_first_in_array: is faster.

#### Compatibility Breaks
*(You can use the update script to automatically update your compounds, graphs, and Maya scene files).*

    ● Compound namespace as been moved from "user::MJCG::" to "MJCG::".
    ● update_stands_orientations:
        ● Orientations now has the Z axis facing the tangent (previously X axis).
        ● Removed "update_tangents" & "update_orientations" options.
    ● oscillator: Input & output port changed from array to single value.
    ● Compounds that have "Transform" port group now uses euler degrees instead of quaternion.
    ● Deleted "quaternion_from_direction_and_up_vector: similar compound is now available built_in: "normal_and_tangent_to_orientation"
    ● Deleted "all_elements_true: similar compound is now available built_in as "all_true_in_array".
    ● Deleted "all_elements_false: similar compound is now available built_in as "all_true_in_array".
    ● Renamed "average" to "array_average".
    ● Renamed "pop_first" to "remove_first_in_array".
    ● Renamed "pop_last" to "remove_last_in_array".
    ● Renamed "angle_between" to "angle_between_vectors".
    ● Renamed "distance_to" to "distance_between_vectors".
    ● Renamed "get_strands_roots" to "get_strands_start_points".
    ● Renamed "get_strands_tips" to "get_strands_end_points".
    ● Renamed "twist_strands" to "rotate_strands".
    ● Renamed "set_strands_orientations_from_closest_geometry" to "update_strands_orientations_from_closest".
    ● Renamed "set_strands_up_vectors_from_closest_geometry" to "update_strands_up_vectors_from_closest".
    ● Renamed "update_face_center" to "update_face_position".
    ● Renamed "matrix_scope" to "transform_scope".
    ● Renamed "deform_by_uv" to "uv_wrap_deformer".     
    ● Renamed "create_3D_grid" to "create_point_grid".
    ● Renamed "catmull_rom_strands" to "create_catmull_rom_strands".
    ● Deleted all sample scenes: they are now available as graphs. Some graphs also have attached example scenes.

---------------------------------------------
### `1.3.2 - July 14, 2020`

#### New compounds
    ● update_face_center: compute the central position of each face of a given mesh object.
    ● get_strands_roots: returns the point_position and point_indices of each strands roots.
    ● get_strands_tips: returns the point_position and point_indices of each strands tips.
    ● check_point_orientation: checks for point_orientation and basis vector properties, compute it if it doesn't exist.

#### New sample scenes
    ● update_face_center

#### Enhancements
    ● Compounds relying on point_orientation, or point_tangent / point_normal / point_binormal basis vectors properties, no longer requires to use "update_strands_orientations" upstream. There is now a property check internally that will update the orientation if it is not found on the input strands, along with "Advanced" options to deal with up vectors or force orientations update.
    ● Updated all compounds relying on Geometry Query.
    ● wrap_deformer:
        ● Fixed an issue where objects positioned behind the target's backface were being reprojected on the frontface.
        ● Is faster when deforming multiple objects. 
    ● deform_by_uv:
        ● Fixed an issue where objects positioned behind the target's backface were being reprojected on the frontface.
        ● Is faster when deforming multiple objects.
    ● update_strands_orientations:
        ● Removed up_vector overload port to enable auto-loop on strands object. 
        ● Variable up-vector per strands can still be set though the "strand_up_vector" property.

#### Compatibility breaks
    ● Deleted "get_mesh_structure", similar compound is now available built-in under the Geometry::Mesh::get_mesh_structure
    ● Deleted "get_strands_start_position", is now available as "get_strands_tips".
    ● Renamed "strands_deformer" to "strands_wrap_deformer" for clarity reasons.
    ● average: input port is now Fan-in.

---------------------------------------------
### `1.3.1 - February 24, 2020`

#### New compounds
    ● spherify_deformer: deforms any point based geometry into a spherical shape.
    ● get_point_scale: simple set property node.
    ● set_point_scale: simple set property node.
    ● get_point_length: simple get property node.
    ● set_point_length: simple set property node.
    ● get_strand_length: simple get property node.
    ● set_strand_length: simple set property node.

#### New sample scenes
    ● spherify_deformer

    ● All compounds are now documented. 
    ● "strands_deformer": 
        ● Fixed a bug with "keep_length" where input geometries longer than a strand would shrink.
        ● "out_objects" is now a simple 1D array; removed extra output ports.
    ● "create_braids_from_strands", became extremely slow in 1.3.0, this is now resolved. 
    ● "set_strands_orientations_from_closest_geometry", modified computational method.
    ● Fixed "~can not be resolved", "~does not match a registered resolver" errors showing up in the script editor.

---------------------------------------------
### `1.3.0 - February 11, 2020`

#### New compounds
    ● strands_deformer: Deforms geometry along strands. (similar to Maya's curveWrap).
    ● set_strands_up_vector_from_closest_geometry: sets a "strand_up_vector" geo property, based on the closest geometry from the strands's starting points.

#### New sample scenes
    ● strands_deformer

#### Enhancements
    ● update_strands_orientations:
        ● Lifted Parallel Transport precision to avoid NaN errors in some cases.
        ● Added tangents & orientations update options.
        ● Double Reflection is now the default framing algorithm.
    ● create_braids_from_strands: 
        ● Now generates point_ratio.
        ● Is faster.
    ● create_circle: axis input was not working.

---------------------------------------------
### `1.2.0 - February 5, 2020`

#### New compounds
    ● matrix_scope: a diagnostic tool to visualize transformation matrices as axis.
    ● twist_strands: twists the strands basis vector and orientation along their lenghts.
    ● set_strands_orientations_from_closest_geometry: orients the strands's points based on a closest geometry's point positions.
    ● get_face_vertex_indices: returns the vertex indices associated to a face (given its index).
    ● flatten_2D_array: an improved version of "convert_2D_to_1D_array" with multiple flattening modes.
    ● flatten_3D_array: same as above, but for 3D array.
    ● all_elements_true: returns true if all the elements of a given array<bool> are true.
    ● all_elements_false: returns true if all the elements of a given array<bool> are false. 
    ● get_strands_start_position: returns the first point of each strands.
    ● set_point_ratio: simple set property node.
    ● set_point_tangent: simple set property node.
    ● get_point_binormal: simple get property node.
    ● set_point_binormal: simple set property node.
    ● get_point_orientation: simple get property node.
    ● set_point_orientation: simple set property node.
    ● get_strand_up_vector: simple get property node.
    ● set_strand_up_vector: simple set property node.

#### New sample scenes
    ● strands_orientations_from_closest_mesh.

#### Enhancements
    ● extrude_strands:
        ● Now has 3 extrusion modes (Ribbon, Tube, Custom).
        ● Is now working with multiple strands of variable size.
        ● Is now generating clean, normalized UVs.
        ● Is faster.
    ● create_braids_from_strands: 
        ● Is now working with multiple strands of variable size.
        ● Fixed a rare glitch when the input strands had strong orientation changes.
        ● Is faster.
    ● update_strands_orientations: 
        ● Has now 4 curve framing algorithms (Frenet, Up Vector, Parallel Transport, Double Reflection).
        ● Is now working with multiple strands of variable size.
        ● "up_vector" port is now overloadable. You can feed an array of vectors ( has to be the size of strand_count).
        ● ability to use up-vectors from a custom property.
        ● compute a correct tangent on the last strand points. 
    ● catmull_rom_strands: is faster.
    ● quaternion_from_direction_and_up_vector: now returns accurate results.
    ● Fixed node names that caused illegal name warnings.
    ● Added custom icon.

#### Compatibility breaks
    ● Deleted "create_tubes_from_strands" now available as a "Tube" extrusion type using the "extrude_strands" compound.
    ● Deleted "interpolate_on_array"  better compound available in the "rebel-pack" as "get_from_interpolated_array".
    ● Deleted "update_strands_length" better compound available in the "rebel-pack" (same name).
    ● Deleted "convert_2D_to_1D_array" replaced by "flatten_2D_array".

---------------------------------------------
### `1.1.1 - August 14, 2019`

#### Enhancements
    ● MPM_fiber_knit sample scene: Fixed broken strands display.

---------------------------------------------
### `1.1.0 - August 13, 2019`

    ● Initial release.