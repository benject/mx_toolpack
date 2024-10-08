//Maya ASCII 2020 scene
//Name: venation_cat.ma
//Last modified: Sun, Dec 27, 2020 11:18:54 PM
//Codeset: 932
requires maya "2020";
requires -nodeType "bifrostGraphShape" -dataType "bifData" "bifrostGraph" "2.2.0.1-202011260743-32fc074";
requires "stereoCamera" "10.0";
requires "mtoa" "4.1.1";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2020";
fileInfo "version" "2020";
fileInfo "cutIdentifier" "202011110415-b1e20b88e2";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 18363)\n";
fileInfo "UUID" "E082491F-46DE-3A1B-5F94-329F7C83A49D";
createNode transform -s -n "persp";
	rename -uid "9EE7B2FF-4F68-964B-F5E4-E094DF8026C5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 11.812399153041078 4.1994066917885426 6.7052495359610447 ;
	setAttr ".r" -type "double3" -3971.138353034899 -21537.800000013249 -1.7048916097545267e-15 ;
	setAttr ".rp" -type "double3" 8.8817841970012523e-16 -4.4408920985006262e-16 0 ;
	setAttr ".rpt" -type "double3" -3.2262909005411243e-15 -1.2836648441545219e-15 1.0771400118932786e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "D937AF17-4CDB-B6C1-3C73-ECBDA162526E";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".fs" 64;
	setAttr ".fd" 1e-10;
	setAttr ".coi" 13.853770242334541;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.0084648728370666504 1.4746870100498257 4.728962421417255 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "4942F4E6-44DD-DB61-5184-21AFA72FE6F0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.21821507564396048 1000.1 3.8940525380698121 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "04FC6F03-4CCA-B2F4-80B4-C1B4BDEAC760";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 21.185453037519316;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "DE554DA1-4355-8C6F-1ADB-189CBA03D6E3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.38398841075842255 0.75782719645952412 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "891511D3-4E0D-1712-C6C7-17B4C30027DB";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 10.244992739774073;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "0768F872-4BFE-3EF8-5773-07829EB0550B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "4AB6DAB5-492D-7E2B-53D4-6484B92CBB59";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 33.607214428857716;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "scatter";
	rename -uid "B487E98F-41E9-8B57-C50A-91B9485EA53E";
	setAttr ".v" no;
createNode bifrostGraphShape -n "scatterShape" -p "scatter";
	rename -uid "DE3E584C-44C3-BBDA-8FAD-149C1AE086EC";
	addAttr -w false -ci true -sn "attractors" -ln "attractors" -dt "bifData";
	addAttr -r false -ci true -h true -k true -sn "mesh1" -ln "mesh1" -dt "bifData" 
		-dt "vectorArray" -dt "doubleArray" -dt "nurbsCurve" -dt "mesh";
	addAttr -r false -ci true -k true -sn "JobPorts__Math_epsilonFloat" -ln "JobPorts__Math_epsilonFloat" 
		-at "float";
	setAttr -k off ".v";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sc" -type "string" (
		"{\n    \"header\": {\n        \"metadata\": [\n            {\n                \"metaName\": \"adskFileFormatVersion\",\n                \"metaValue\": \"100L\"\n            }\n        ]\n    },\n    \"dependencies\": [\n        {\n            \"uri\": \"file:///bifrost_object_i.json\"\n        },\n        {\n            \"uri\": \"file:///Math_types.json\"\n        },\n        {\n            \"uri\": \"file:///scatter_types.json\"\n        },\n        {\n            \"uri\": \"file:///geometry_types.json\"\n        },\n        {\n            \"uri\": \"file:///bifrost_geometry_query_types.json\"\n        },\n        {\n            \"uri\": \"file:///Math_long.json\"\n        },\n        {\n            \"uri\": \"file:///Math_float.json\"\n        },\n        {\n            \"uri\": \"file:///Math_double.json\"\n        },\n        {\n            \"uri\": \"file:///Math_char.json\"\n        },\n        {\n            \"uri\": \"file:///Math_int.json\"\n        },\n        {\n            \"uri\": \"file:///Math_short.json\"\n        },\n        {\n            \"uri\": \"file:///Math_uchar.json\"\n        },\n        {\n"
		+ "            \"uri\": \"file:///Math_uint.json\"\n        },\n        {\n            \"uri\": \"file:///Math_ulong.json\"\n        },\n        {\n            \"uri\": \"file:///Math_ushort.json\"\n        },\n        {\n            \"uri\": \"file:///riv_types.json\"\n        },\n        {\n            \"uri\": \"file:///point_types.json\"\n        },\n        {\n            \"uri\": \"file:///FCurve.json\"\n        },\n        {\n            \"uri\": \"file:///riv_ops.json\"\n        },\n        {\n            \"uri\": \"file:///get_indexer_element.json\"\n        },\n        {\n            \"uri\": \"file:///math_util.json\"\n        },\n        {\n            \"uri\": \"file:///get_loc_element.json\"\n        },\n        {\n            \"uri\": \"file:///invalid_index.json\"\n        },\n        {\n            \"uri\": \"file:///get_mesh_geo_loc_data.json\"\n        },\n        {\n            \"uri\": \"file:///Math_constants.json\"\n        },\n        {\n            \"uri\": \"file:///max_weight.json\"\n        },\n        {\n            \"uri\": \"file:///mesh_v_interp.json\"\n        },\n        {\n            \"uri\": \"file:///CoreArrayOps.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///get_property_any.json\"\n        },\n        {\n            \"uri\": \"file:///get_property.json\"\n        },\n        {\n            \"uri\": \"file:///get_geo_property.json\"\n        },\n        {\n            \"uri\": \"file:///create_object_from_schema.json\"\n        },\n        {\n            \"uri\": \"file:///is_a.json\"\n        },\n        {\n            \"uri\": \"file:///is_a_range_geo_property.json\"\n        },\n        {\n            \"uri\": \"file:///get_range_geo_property.json\"\n        },\n        {\n            \"uri\": \"file:///mesh_fv_interp.json\"\n        },\n        {\n            \"uri\": \"file:///mesh_f_interp.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_empty_array.json\"\n        },\n        {\n            \"uri\": \"file:///choose_mesh_values.json\"\n        },\n        {\n            \"uri\": \"file:///get_sub_object.json\"\n        },\n        {\n            \"uri\": \"file:///get_point_count.json\"\n        },\n        {\n            \"uri\": \"file:///get_geo_component_count.json\"\n        },\n"
		+ "        {\n            \"uri\": \"file:///get_mesh_structure.json\"\n        },\n        {\n            \"uri\": \"file:///Math_bool.json\"\n        },\n        {\n            \"uri\": \"file:///has_property.json\"\n        },\n        {\n            \"uri\": \"file:///get_point_geo_loc_data.json\"\n        },\n        {\n            \"uri\": \"file:///point_p_interp.json\"\n        },\n        {\n            \"uri\": \"file:///sample_volume_property.json\"\n        },\n        {\n            \"uri\": \"file:///Math_conversion.json\"\n        },\n        {\n            \"uri\": \"file:///get_strands_structure.json\"\n        },\n        {\n            \"uri\": \"file:///get_strand_geo_loc_data.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Constants_default_value.json\"\n        },\n        {\n            \"uri\": \"file:///strand_p_interp.json\"\n        },\n        {\n            \"uri\": \"file:///strand_s_interp.json\"\n        },\n        {\n            \"uri\": \"file:///choose_strand_values.json\"\n        },\n        {\n            \"uri\": \"file:///get_geo_schema_type.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///switch_is_a.json\"\n        },\n        {\n            \"uri\": \"file:///sample_property.json\"\n        },\n        {\n            \"uri\": \"file:///Math_matrix_to_quaternion.json\"\n        },\n        {\n            \"uri\": \"file:///Math_length_squared.json\"\n        },\n        {\n            \"uri\": \"file:///normal_and_tangent_to_orientation.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_array_is_empty.json\"\n        },\n        {\n            \"uri\": \"file:///get_geo_property_check.json\"\n        },\n        {\n            \"uri\": \"file:///get_geo_target_count.json\"\n        },\n        {\n            \"uri\": \"file:///CoreStringOps.json\"\n        },\n        {\n            \"uri\": \"file:///volume_types.json\"\n        },\n        {\n            \"uri\": \"file:///volume_nodedefs.json\"\n        },\n        {\n            \"uri\": \"file:///interpret_auto_port_as_scalar.json\"\n        },\n        {\n            \"uri\": \"file:///Math_multiply_quaternions.json\"\n        },\n        {\n            \"uri\": \"file:///Math_rotate_by_quaternion.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///create_volume_geo_prop.json\"\n        },\n        {\n            \"uri\": \"file:///is_a_mesh.json\"\n        },\n        {\n            \"uri\": \"file:///is_a_strands.json\"\n        },\n        {\n            \"uri\": \"file:///is_a_points.json\"\n        },\n        {\n            \"uri\": \"file:///is_a_volume.json\"\n        },\n        {\n            \"uri\": \"file:///get_target_component.json\"\n        },\n        {\n            \"uri\": \"file:///create_data_geo_prop.json\"\n        },\n        {\n            \"uri\": \"file:///set_property_any.json\"\n        },\n        {\n            \"uri\": \"file:///set_property.json\"\n        },\n        {\n            \"uri\": \"file:///set_geo_property.array.json\"\n        },\n        {\n            \"uri\": \"file:///set_geo_property.scalar.json\"\n        },\n        {\n            \"uri\": \"file:///Math_axis_angle_to_quaternion.json\"\n        },\n        {\n            \"uri\": \"file:///Math_vector4_to_vector3.json\"\n        },\n        {\n            \"uri\": \"file:///interpret_auto_port_as_vector.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///rotate_points.json\"\n        },\n        {\n            \"uri\": \"file:///Math_almost_equal.json\"\n        },\n        {\n            \"uri\": \"file:///Math_quaternion_to_axis_angle.json\"\n        },\n        {\n            \"uri\": \"file:///Math_array.json\"\n        },\n        {\n            \"uri\": \"file:///set_geo_property_data.json\"\n        },\n        {\n            \"uri\": \"file:///get_point_normal.json\"\n        },\n        {\n            \"uri\": \"file:///get_point_position.json\"\n        },\n        {\n            \"uri\": \"file:///build_closest_accelerator.json\"\n        },\n        {\n            \"uri\": \"file:///sample_closest_point_accelerator.json\"\n        },\n        {\n            \"uri\": \"file:///get_closest_point.json\"\n        },\n        {\n            \"uri\": \"file:///sample_interpreted_auto_port_as_vector.json\"\n        },\n        {\n            \"uri\": \"file:///erase_property.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_slice_array.json\"\n        },\n        {\n            \"uri\": \"file:///update_mesh_normals.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///access_offset_array.json\"\n        },\n        {\n            \"uri\": \"file:///increment_decrement.json\"\n        },\n        {\n            \"uri\": \"file:///get_indexed_geo_property_check.json\"\n        },\n        {\n            \"uri\": \"file:///UV_set_name.json\"\n        },\n        {\n            \"uri\": \"file:///UV_type_filter.json\"\n        },\n        {\n            \"uri\": \"file:///UV_type_converter.json\"\n        },\n        {\n            \"uri\": \"file:///get_mesh_UVs.json\"\n        },\n        {\n            \"uri\": \"file:///int_filter.json\"\n        },\n        {\n            \"uri\": \"file:///project_vector.json\"\n        },\n        {\n            \"uri\": \"file:///orient_points_by_geometry.json\"\n        },\n        {\n            \"uri\": \"file:///add_points_to_points.json\"\n        },\n        {\n            \"uri\": \"file:///validate_points.json\"\n        },\n        {\n            \"uri\": \"file:///construct_points.json\"\n        },\n        {\n            \"uri\": \"file:///generate_sample_locations.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///get_max_index.json\"\n        },\n        {\n            \"uri\": \"file:///scatter_points_internal.json\"\n        },\n        {\n            \"uri\": \"file:///sample_closest_accelerator.json\"\n        },\n        {\n            \"uri\": \"file:///get_closest_locations.json\"\n        },\n        {\n            \"uri\": \"file:///jotun_rand.json\"\n        },\n        {\n            \"uri\": \"file:///fluids_types.json\"\n        },\n        {\n            \"uri\": \"file:///fluids_nodedefs.json\"\n        },\n        {\n            \"uri\": \"file:///random_value.json\"\n        },\n        {\n            \"uri\": \"file:///find_all_in_array.json\"\n        },\n        {\n            \"uri\": \"file:///sample_closest_in_radius_accelerator.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_sum_array_impl.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_sum_array.json\"\n        },\n        {\n            \"uri\": \"file:///half_of.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_flatten_nested_array.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///sample_interpreted_auto_port_as_scalar.json\"\n        },\n        {\n            \"uri\": \"file:///set_point_position.json\"\n        },\n        {\n            \"uri\": \"file:///weighted_sample_elimination.json\"\n        },\n        {\n            \"uri\": \"file:///scatter_points_blue_noise.json\"\n        },\n        {\n            \"uri\": \"file:///mask_and_number_interaction.json\"\n        },\n        {\n            \"uri\": \"file:///compute_mesh_surface_area.json\"\n        },\n        {\n            \"uri\": \"file:///scatter_points_on_mesh.json\"\n        },\n        {\n            \"uri\": \"file:///twice_of.json\"\n        },\n        {\n            \"uri\": \"file:///compute_bounding_sphere.json\"\n        },\n        {\n            \"uri\": \"file:///delete_points_in_points.json\"\n        },\n        {\n            \"uri\": \"file:///delete_points.json\"\n        },\n        {\n            \"uri\": \"file:///cull_overlapping_positions.json\"\n        },\n        {\n            \"uri\": \"file:///merge_meshes.json\"\n        },\n"
		+ "        {\n            \"uri\": \"file:///merge_points.json\"\n        },\n        {\n            \"uri\": \"file:///merge_strands.json\"\n        },\n        {\n            \"uri\": \"file:///merge_geometry.json\"\n        },\n        {\n            \"uri\": \"file:///cull_overlapping_points.json\"\n        },\n        {\n            \"uri\": \"file:///cull_points.json\"\n        },\n        {\n            \"uri\": \"file:///density_to_radius.json\"\n        },\n        {\n            \"uri\": \"file:///get_volume_tile_info.json\"\n        },\n        {\n            \"uri\": \"file:///scatter_points.json\"\n        },\n        {\n            \"uri\": \"file:///converters_types.json\"\n        },\n        {\n            \"uri\": \"file:///convert_auto_resolution_mode.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_array_bounds_impl.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_array_bounds.json\"\n        },\n        {\n            \"uri\": \"file:///get_position_property.json\"\n        },\n        {\n            \"uri\": \"file:///compute_voxel_scale.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///converters_nodedefs.json\"\n        },\n        {\n            \"uri\": \"file:///post_process_level_set.json\"\n        },\n        {\n            \"uri\": \"file:///compute_fog_density.json\"\n        },\n        {\n            \"uri\": \"file:///delete_level_set.json\"\n        },\n        {\n            \"uri\": \"file:///if_compute_volume.json\"\n        },\n        {\n            \"uri\": \"file:///setup_resolution_fields.json\"\n        },\n        {\n            \"uri\": \"file:///mesh_to_volume.json\"\n        },\n        {\n            \"uri\": \"file:///points_to_volume.json\"\n        },\n        {\n            \"uri\": \"file:///convert_to_volume_internal.json\"\n        },\n        {\n            \"uri\": \"file:///convert_to_volume.json\"\n        }\n    ],\n    \"namespaces\": [],\n    \"types\": [],\n    \"compounds\": [\n        {\n            \"name\": \"scatterShape\",\n            \"metadata\": [\n                {\n                    \"metaName\": \"io_nodes\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"io_inodes\",\n"
		+ "                            \"metadata\": [\n                                {\n                                    \"metaName\": \"catShape\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-900.163 296.275\"\n                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"mesh1\"\n"
		+ "                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"io_onodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"output\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"243.562 269.809\"\n"
		+ "                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"attractors\"\n                                                }\n                                            ]\n                                        }\n                                    ]\n                                }\n                            ]\n                        }\n                    ]\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Modeling::Points,scatter_points_blue_noise\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"input\"\n                },\n"
		+ "                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,MJCG::Modeling::Strands,extrude_strands\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Simulation::Particles,source_particles\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Simulation::Particles,particle_solver_settings\"\n                },\n                {\n                    \"metaName\": \"backdrop\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"type\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"backdrop\"\n                        },\n                        {\n                            \"metaName\": \"color\",\n"
		+ "                            \"metaType\": \"string\",\n                            \"metaValue\": \"#415e40\"\n                        },\n                        {\n                            \"metaName\": \"coords\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-644.232 228.401 864.376 392.584\"\n                        },\n                        {\n                            \"metaName\": \"text\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"generate points inside cat mesh volume.\"\n                        }\n                    ]\n                },\n                {\n                    \"metaName\": \"ViewportRect\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"-1365 -248 2306 1346\"\n                },\n                {\n                    \"metaName\": \"blackListed\",\n                    \"metaValue\": \"true\"\n                }\n            ],\n            \"ports\": [\n                {\n                    \"portName\": \"attractors\",\n"
		+ "                    \"portDirection\": \"output\",\n                    \"portType\": \"Amino::Object\"\n                },\n                {\n                    \"portName\": \"mesh1\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"Amino::Object\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"pathinfo\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"setOperation\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"+\"\n                                },\n                                {\n                                    \"metaName\": \"active\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"true\"\n                                },\n                                {\n                                    \"metaName\": \"normalsPerFace\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"false\"\n                                },\n                                {\n                                    \"metaName\": \"normalsPerPoint\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"true\"\n                                },\n                                {\n                                    \"metaName\": \"normalsPerFaceVertex\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"true\"\n                                },\n                                {\n                                    \"metaName\": \"channels\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"*\"\n                                },\n                                {\n                                    \"metaName\": \"path\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"/cat/cat/catShape\"\n"
		+ "                                }\n                            ]\n                        }\n                    ]\n                }\n            ],\n            \"compoundNodes\": [\n                {\n                    \"nodeName\": \"scatter_points\",\n                    \"nodeType\": \"Modeling::Points::scatter_points\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-75.5845 271.096\"\n                        },\n                        {\n                            \"metaName\": \"PortExpandedState\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"Scatter Settings.Max Number\",\n                                    \"metaType\": \"string\",\n"
		+ "                                    \"metaValue\": \"0\"\n                                },\n                                {\n                                    \"metaName\": \"Scatter Settings\",\n                                    \"metaType\": \"string\",\n                                    \"metaValue\": \"0\"\n                                }\n                            ]\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"first_in_array\",\n                    \"nodeType\": \"Core::Array::first_in_array\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-347.4 342.4\"\n                        }\n                    ]\n"
		+ "                },\n                {\n                    \"nodeName\": \"convert_to_volume\",\n                    \"nodeType\": \"Modeling::Converters::convert_to_volume\",\n                    \"fanInPortNames\": {\n                        \"geometry\": [\n                            \"mesh1\"\n                        ],\n                        \"base_resolution\": [],\n                        \"half_resolution\": [],\n                        \"quarter_resolution\": [],\n                        \"eighth_resolution\": []\n                    },\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-601.357 275.536\"\n                        }\n                    ]\n                }\n            ],\n"
		+ "            \"connections\": [\n                {\n                    \"source\": \"first_in_array.first\",\n                    \"target\": \"scatter_points.geometry\"\n                },\n                {\n                    \"source\": \"convert_to_volume.volume\",\n                    \"target\": \"first_in_array.array\"\n                },\n                {\n                    \"source\": \".mesh1\",\n                    \"target\": \"convert_to_volume.geometry.mesh1\"\n                },\n                {\n                    \"source\": \"scatter_points.points\",\n                    \"target\": \".attractors\"\n                }\n            ],\n            \"values\": [\n                {\n                    \"valueName\": \"scatter_points.amount\",\n                    \"valueType\": \"float\",\n                    \"value\": \"100000f\"\n                },\n                {\n                    \"valueName\": \"scatter_points.seed\",\n                    \"valueType\": \"long\",\n                    \"value\": \"0\"\n                },\n                {\n                    \"valueName\": \"convert_to_volume.volume_mode\",\n"
		+ "                    \"valueType\": \"Geometry::Converters::VolumeMode\",\n                    \"value\": \"Solid\"\n                },\n                {\n                    \"valueName\": \"convert_to_volume.offset\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"convert_to_volume.store_level_set\",\n                    \"valueType\": \"bool\",\n                    \"value\": \"false\"\n                },\n                {\n                    \"valueName\": \"convert_to_volume.store_fog_density\",\n                    \"valueType\": \"bool\",\n                    \"value\": \"true\"\n                },\n                {\n                    \"valueName\": \"convert_to_volume.fog_density\",\n                    \"valueType\": \"float\",\n                    \"value\": \"20f\"\n                },\n                {\n                    \"valueName\": \"convert_to_volume.properties\",\n                    \"valueType\": \"string\",\n                    \"value\": \"*\"\n                },\n"
		+ "                {\n                    \"valueName\": \"convert_to_volume.resolution_mode\",\n                    \"valueType\": \"Geometry::Volume::AutoResolutionType\",\n                    \"value\": \"Absolute\"\n                },\n                {\n                    \"valueName\": \"convert_to_volume.detail_size\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0.0199999996f\"\n                },\n                {\n                    \"valueName\": \"convert_to_volume.enable_bandwidth\",\n                    \"valueType\": \"bool\",\n                    \"value\": \"false\"\n                },\n                {\n                    \"valueName\": \"convert_to_volume.bandwidth\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0f\"\n                },\n                {\n                    \"valueName\": \"convert_to_volume.volume_subdivision_structure\",\n                    \"valueType\": \"Geometry::Volume::AutoSubdivisionStructure\",\n                    \"value\": \"Automatic\"\n                },\n                {\n"
		+ "                    \"valueName\": \"convert_to_volume.adaptivity\",\n                    \"valueType\": \"Geometry::Volume::Adaptivity\",\n                    \"value\": \"Off\"\n                },\n                {\n                    \"valueName\": \"convert_to_volume.enable_resolution_bounds\",\n                    \"valueType\": \"bool\",\n                    \"value\": \"false\"\n                }\n            ],\n            \"reservedNodeNames\": [\n                {\n                    \"name\": \"output\"\n                },\n                {\n                    \"name\": \"catShape\"\n                }\n            ]\n        }\n    ]\n}\n");
	setAttr ".dirtyFlag" yes;
	setAttr -k on ".mesh1";
createNode transform -n "grow";
	rename -uid "8BA0E7A7-47EC-0141-432F-F1B1E869244C";
	setAttr ".s" -type "double3" 1.000000000000004 1.000000000000004 1.000000000000004 ;
createNode bifrostGraphShape -n "growShape" -p "grow";
	rename -uid "CAE348AD-4FFC-D2D6-FF4A-3EA0800334DC";
	addAttr -r false -ci true -k true -sn "JobPorts__time" -ln "JobPorts__time" -at "time";
	addAttr -r false -ci true -k true -m -sn "locators" -ln "locators" -at "float3" 
		-nc 3;
	addAttr -r false -ci true -k true -sn "locatorsx" -ln "locatorsx" -at "float" -p "locators";
	addAttr -r false -ci true -k true -sn "locatorsy" -ln "locatorsy" -at "float" -p "locators";
	addAttr -r false -ci true -k true -sn "locatorsz" -ln "locatorsz" -at "float" -p "locators";
	addAttr -r false -ci true -k true -m -sn "JobPorts___Amino_IsEnabledTerminal_Table" 
		-ln "JobPorts___Amino_IsEnabledTerminal_Table" -min 0 -max 1 -at "bool";
	addAttr -w false -ci true -sn "Core__Graph__terminal__final" -ln "Core__Graph__terminal__final" 
		-dt "bifData";
	addAttr -w false -ci true -sn "Core__Graph__terminal__proxy" -ln "Core__Graph__terminal__proxy" 
		-dt "bifData";
	addAttr -w false -ci true -sn "Core__Graph__terminal__diagnostic" -ln "Core__Graph__terminal__diagnostic" 
		-dt "bifData";
	addAttr -r false -ci true -k true -sn "attractors" -ln "attractors" -dt "bifData" 
		-dt "vectorArray" -dt "doubleArray" -dt "nurbsCurve" -dt "mesh";
	addAttr -w false -ci true -sn "out_geometry" -ln "out_geometry" -dt "bifData";
	setAttr -k off ".v";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sc" -type "string" (
		"{\n    \"header\": {\n        \"metadata\": [\n            {\n                \"metaName\": \"adskFileFormatVersion\",\n                \"metaValue\": \"100L\"\n            }\n        ]\n    },\n    \"dependencies\": [\n        {\n            \"uri\": \"file:///Math_types.json\"\n        },\n        {\n            \"uri\": \"file:///bifrost_object_i.json\"\n        },\n        {\n            \"uri\": \"file:///bifrost_geometry_query_types.json\"\n        },\n        {\n            \"uri\": \"file:///geometry_types.json\"\n        },\n        {\n            \"uri\": \"file:///add_points_to_points.json\"\n        },\n        {\n            \"uri\": \"file:///create_object_from_schema.json\"\n        },\n        {\n            \"uri\": \"file:///validate_points.json\"\n        },\n        {\n            \"uri\": \"file:///construct_points.json\"\n        },\n        {\n            \"uri\": \"file:///processing_type.json\"\n        },\n        {\n            \"uri\": \"file:///FCurve.json\"\n        },\n        {\n            \"uri\": \"file:///set_property_any.json\"\n        },\n        {\n            \"uri\": \"file:///set_property.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///get_property_any.json\"\n        },\n        {\n            \"uri\": \"file:///get_property.json\"\n        },\n        {\n            \"uri\": \"file:///venation_node_type.json\"\n        },\n        {\n            \"uri\": \"file:///Math_array.json\"\n        },\n        {\n            \"uri\": \"file:///CoreArrayOps.json\"\n        },\n        {\n            \"uri\": \"file:///get_geo_property.json\"\n        },\n        {\n            \"uri\": \"file:///get_point_position.json\"\n        },\n        {\n            \"uri\": \"file:///get_geo_property_check.json\"\n        },\n        {\n            \"uri\": \"file:///get_sub_object.json\"\n        },\n        {\n            \"uri\": \"file:///get_point_count.json\"\n        },\n        {\n            \"uri\": \"file:///Math_conversion.json\"\n        },\n        {\n            \"uri\": \"file:///has_property.json\"\n        },\n        {\n            \"uri\": \"file:///create_volume_geo_prop.json\"\n        },\n        {\n            \"uri\": \"file:///is_a.json\"\n        },\n        {\n            \"uri\": \"file:///is_a_mesh.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///is_a_strands.json\"\n        },\n        {\n            \"uri\": \"file:///is_a_points.json\"\n        },\n        {\n            \"uri\": \"file:///is_a_volume.json\"\n        },\n        {\n            \"uri\": \"file:///get_geo_schema_type.json\"\n        },\n        {\n            \"uri\": \"file:///switch_is_a.json\"\n        },\n        {\n            \"uri\": \"file:///get_target_component.json\"\n        },\n        {\n            \"uri\": \"file:///create_data_geo_prop.json\"\n        },\n        {\n            \"uri\": \"file:///get_geo_component_count.json\"\n        },\n        {\n            \"uri\": \"file:///set_geo_property.array.json\"\n        },\n        {\n            \"uri\": \"file:///set_geo_property.scalar.json\"\n        },\n        {\n            \"uri\": \"file:///Math_float.json\"\n        },\n        {\n            \"uri\": \"file:///Math_double.json\"\n        },\n        {\n            \"uri\": \"file:///Math_long.json\"\n        },\n        {\n            \"uri\": \"file:///Math_char.json\"\n        },\n        {\n            \"uri\": \"file:///Math_int.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///Math_short.json\"\n        },\n        {\n            \"uri\": \"file:///Math_uchar.json\"\n        },\n        {\n            \"uri\": \"file:///Math_uint.json\"\n        },\n        {\n            \"uri\": \"file:///Math_ulong.json\"\n        },\n        {\n            \"uri\": \"file:///Math_ushort.json\"\n        },\n        {\n            \"uri\": \"file:///riv_types.json\"\n        },\n        {\n            \"uri\": \"file:///point_types.json\"\n        },\n        {\n            \"uri\": \"file:///riv_ops.json\"\n        },\n        {\n            \"uri\": \"file:///jotun_rand.json\"\n        },\n        {\n            \"uri\": \"file:///increment_decrement.json\"\n        },\n        {\n            \"uri\": \"file:///random_value.json\"\n        },\n        {\n            \"uri\": \"file:///get_property_keys.json\"\n        },\n        {\n            \"uri\": \"file:///is_empty.json\"\n        },\n        {\n            \"uri\": \"file:///materials.json\"\n        },\n        {\n            \"uri\": \"file:///Math_bool.json\"\n        },\n        {\n            \"uri\": \"file:///erase_property.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///set_point_shape.json\"\n        },\n        {\n            \"uri\": \"file:///set_point_size.json\"\n        },\n        {\n            \"uri\": \"file:///set_point_length.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Constants_default_value.json\"\n        },\n        {\n            \"uri\": \"file:///int_filter.json\"\n        },\n        {\n            \"uri\": \"file:///get_array_indices.json\"\n        },\n        {\n            \"uri\": \"file:///get_strands_structure.json\"\n        },\n        {\n            \"uri\": \"file:///access_offset_array.json\"\n        },\n        {\n            \"uri\": \"file:///update_point_strand_index.json\"\n        },\n        {\n            \"uri\": \"file:///check_point_strand_index.json\"\n        },\n        {\n            \"uri\": \"file:///update_strands_ratio.json\"\n        },\n        {\n            \"uri\": \"file:///set_sub_object_property.json\"\n        },\n        {\n            \"uri\": \"file:///validate_strands.json\"\n        },\n        {\n            \"uri\": \"file:///construct_strands.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///find_all_in_array.json\"\n        },\n        {\n            \"uri\": \"file:///remove_first_in_array.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_flatten_nested_array.json\"\n        },\n        {\n            \"uri\": \"file:///set_strands_shape.json\"\n        },\n        {\n            \"uri\": \"file:///Math_lerp_with_clamp.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_slice_array.json\"\n        },\n        {\n            \"uri\": \"file:///Math_constants.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_array_bounds_impl.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_array_bounds.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_empty_array.json\"\n        },\n        {\n            \"uri\": \"file:///Core_Array_array_is_empty.json\"\n        },\n        {\n            \"uri\": \"file:///sort_array_and_remove_duplicates.json\"\n        },\n        {\n            \"uri\": \"file:///object_terminal.json\"\n        },\n"
		+ "        {\n            \"uri\": \"file:///delete_points_in_points.json\"\n        },\n        {\n            \"uri\": \"file:///Math_axis_angle_to_quaternion.json\"\n        },\n        {\n            \"uri\": \"file:///Math_degrees_to_radians.json\"\n        },\n        {\n            \"uri\": \"file:///Math_multiply_quaternions.json\"\n        },\n        {\n            \"uri\": \"file:///Math_rotate_by_quaternion.json\"\n        },\n        {\n            \"uri\": \"file:///build_closest_accelerator.json\"\n        },\n        {\n            \"uri\": \"file:///sample_closest_point_accelerator.json\"\n        },\n        {\n            \"uri\": \"file:///simulation_types.json\"\n        },\n        {\n            \"uri\": \"file:///simulation_nodedefs.json\"\n        },\n        {\n            \"uri\": \"file:///fluids_types.json\"\n        },\n        {\n            \"uri\": \"file:///volume_types.json\"\n        },\n        {\n            \"uri\": \"file:///fluids_nodedefs.json\"\n        },\n        {\n            \"uri\": \"file:///venation_branch_type.json\"\n        },\n        {\n            \"uri\": \"file:///generate_venation_core.json\"\n"
		+ "        },\n        {\n            \"uri\": \"file:///get_geo_target_count.json\"\n        },\n        {\n            \"uri\": \"file:///CoreStringOps.json\"\n        },\n        {\n            \"uri\": \"file:///volume_nodedefs.json\"\n        },\n        {\n            \"uri\": \"file:///interpret_auto_port_as_scalar.json\"\n        },\n        {\n            \"uri\": \"file:///Profiler.json\"\n        },\n        {\n            \"uri\": \"file:///object_profiler.json\"\n        },\n        {\n            \"uri\": \"file:///Math_change_range.json\"\n        },\n        {\n            \"uri\": \"file:///check_point_ratio.json\"\n        },\n        {\n            \"uri\": \"file:///set_strands_size_profile.json\"\n        },\n        {\n            \"uri\": \"file:///cumulative_sum_array.json\"\n        },\n        {\n            \"uri\": \"file:///generate_venation.json\"\n        }\n    ],\n    \"namespaces\": [],\n    \"types\": [],\n    \"compounds\": [\n        {\n            \"name\": \"growShape\",\n            \"metadata\": [\n                {\n                    \"metaName\": \"io_nodes\",\n                    \"metadata\": [\n"
		+ "                        {\n                            \"metaName\": \"io_inodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"scatterShape\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"attractors\"\n                                                }\n                                            ]\n                                        },\n                                        {\n"
		+ "                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-1294.62 59.972\"\n                                        }\n                                    ]\n                                },\n                                {\n                                    \"metaName\": \"input1\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"locators\"\n"
		+ "                                                }\n                                            ]\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"-1568.1 316.95\"\n                                        }\n                                    ]\n                                }\n                            ]\n                        },\n                        {\n                            \"metaName\": \"io_onodes\",\n                            \"metadata\": [\n                                {\n                                    \"metaName\": \"output\",\n                                    \"metadata\": [\n                                        {\n                                            \"metaName\": \"DisplayMode\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"2\"\n"
		+ "                                        },\n                                        {\n                                            \"metaName\": \"io_ports\",\n                                            \"metadata\": [\n                                                {\n                                                    \"metaName\": \"out_geometry\"\n                                                }\n                                            ]\n                                        },\n                                        {\n                                            \"metaName\": \"LayoutPos\",\n                                            \"metaType\": \"string\",\n                                            \"metaValue\": \"187.815 131.405\"\n                                        }\n                                    ]\n                                }\n                            ]\n                        }\n                    ]\n                },\n                {\n                    \"metaName\": \"backdrop\",\n                    \"metadata\": [\n"
		+ "                        {\n                            \"metaName\": \"type\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"backdrop\"\n                        },\n                        {\n                            \"metaName\": \"text\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"Set random color from point strand index\"\n                        },\n                        {\n                            \"metaName\": \"color\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"#6d4949\"\n                        },\n                        {\n                            \"metaName\": \"coords\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-633.791 60.0588 807.559 445.771\"\n                        }\n                    ]\n                },\n                {\n                    \"metaName\": \"backdrop1\",\n                    \"metadata\": [\n                        {\n"
		+ "                            \"metaName\": \"type\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"backdrop\"\n                        },\n                        {\n                            \"metaName\": \"color\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"#4b6d51\"\n                        },\n                        {\n                            \"metaName\": \"text\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"Grow veins toward points generated in the cat volume. (scatter graph)\"\n                        },\n                        {\n                            \"metaName\": \"coords\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1033.51 57.9036 376.536 402.788\"\n                        }\n                    ]\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,MJCG::Modeling::Strands,extrude_strands\"\n"
		+ "                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,MJCG::Modeling::Growth,generate_venation\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Geometry::Points,construct_points\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Core::String,string_find\"\n                },\n                {\n                    \"metaName\": \"_recentNode_\",\n                    \"metaType\": \"string\",\n                    \"metaValue\": \"BifrostGraph,Core::Array,find_all_in_array\"\n                },\n                {\n                    \"metaName\": \"blackListed\",\n                    \"metaValue\": \"true\"\n                },\n                {\n                    \"metaName\": \"backdrop2\",\n"
		+ "                    \"metadata\": [\n                        {\n                            \"metaName\": \"type\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"backdrop\"\n                        },\n                        {\n                            \"metaName\": \"text\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"Construct a points object using the locator positions from the scene.\"\n                        },\n                        {\n                            \"metaName\": \"color\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"#4d536d\"\n                        },\n                        {\n                            \"metaName\": \"coords\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1572.48 265.188 502.878 256.734\"\n                        }\n                    ]\n                },\n                {\n                    \"metaName\": \"ViewportRect\",\n"
		+ "                    \"metaType\": \"string\",\n                    \"metaValue\": \"-1645.58 -428.581 2139.62 1412.42\"\n                }\n            ],\n            \"ports\": [\n                {\n                    \"portName\": \"locators\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"array<Math::float3>\"\n                },\n                {\n                    \"portName\": \"attractors\",\n                    \"portDirection\": \"input\",\n                    \"portType\": \"Amino::Object\"\n                },\n                {\n                    \"portName\": \"out_geometry\",\n                    \"portDirection\": \"output\",\n                    \"portType\": \"Amino::Object\"\n                }\n            ],\n            \"compoundNodes\": [\n                {\n                    \"nodeName\": \"construct_points\",\n                    \"nodeType\": \"Geometry::Points::construct_points\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n"
		+ "                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-1328.94 312.636\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"generate_venation\",\n                    \"nodeType\": \"MJCG::Modeling::Growth::generate_venation\",\n                    \"deactivatedTerminals\": [\n                        \"Core::Graph::terminal::final\",\n                        \"Core::Graph::terminal::proxy\",\n                        \"Core::Graph::terminal::diagnostic\"\n                    ],\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n"
		+ "                            \"metaType\": \"string\",\n                            \"metaValue\": \"-956.217 102.995\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"get_geo_property\",\n                    \"nodeType\": \"Geometry::Properties::get_geo_property\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-609.818 212.819\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"set_geo_property\",\n                    \"nodeType\": \"Geometry::Properties::set_geo_property\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n"
		+ "                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-93.7796 81.742\"\n                        }\n                    ]\n                },\n                {\n                    \"nodeName\": \"random_value\",\n                    \"nodeType\": \"Core::Randomization::random_value\",\n                    \"metadata\": [\n                        {\n                            \"metaName\": \"DisplayMode\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"2\"\n                        },\n                        {\n                            \"metaName\": \"LayoutPos\",\n                            \"metaType\": \"string\",\n                            \"metaValue\": \"-361.483 188.53\"\n                        }\n                    ]\n                }\n            ],\n            \"connections\": [\n"
		+ "                {\n                    \"source\": \".locators\",\n                    \"target\": \"construct_points.point_position\"\n                },\n                {\n                    \"source\": \".attractors\",\n                    \"target\": \"generate_venation.attractor_points\"\n                },\n                {\n                    \"source\": \"construct_points.points\",\n                    \"target\": \"generate_venation.seed_points\"\n                },\n                {\n                    \"source\": \"random_value.random_value\",\n                    \"target\": \"set_geo_property.data\"\n                },\n                {\n                    \"source\": \"get_geo_property.data\",\n                    \"target\": \"random_value.index\"\n                },\n                {\n                    \"source\": \"generate_venation.strands\",\n                    \"target\": \"get_geo_property.geometry\"\n                },\n                {\n                    \"source\": \"generate_venation.strands\",\n                    \"target\": \"set_geo_property.geometry\"\n"
		+ "                },\n                {\n                    \"source\": \"set_geo_property.out_geometry\",\n                    \"target\": \".out_geometry\"\n                }\n            ],\n            \"values\": [\n                {\n                    \"valueName\": \"generate_venation.processing_mode\",\n                    \"valueType\": \"MJCG::processingType\",\n                    \"value\": \"Simulation\"\n                },\n                {\n                    \"valueName\": \"generate_venation.attraction_radius\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0.100000001f\"\n                },\n                {\n                    \"valueName\": \"generate_venation.kill_radius\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0.0799999982f\"\n                },\n                {\n                    \"valueName\": \"generate_venation.min_step_length\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0.0149999997f\"\n                },\n                {\n                    \"valueName\": \"generate_venation.seed_size\",\n"
		+ "                    \"valueType\": \"float\",\n                    \"value\": \"0.00499999989f\"\n                },\n                {\n                    \"valueName\": \"generate_venation.size_profile\",\n                    \"valueType\": \"Amino::FCurve\",\n                    \"value\": {\n                        \"version\": \"1\",\n                        \"preExtrapolation\": \"0\",\n                        \"postExtrapolation\": \"0\",\n                        \"points\": [\n                            {\n                                \"point\": {\n                                    \"locked\": \"1\",\n                                    \"interpolation\": \"1\",\n                                    \"pcn\": {\n                                        \"xp\": \"0.71785200000000005\",\n                                        \"yp\": \"0.998942\",\n                                        \"x\": \"0.90000000000000002\",\n                                        \"y\": \"1\",\n                                        \"xn\": \"1.0821480000000001\",\n                                        \"yn\": \"1.001058\"\n"
		+ "                                    }\n                                }\n                            },\n                            {\n                                \"point\": {\n                                    \"locked\": \"1\",\n                                    \"interpolation\": \"1\",\n                                    \"pcn\": {\n                                        \"xp\": \"0.86513099999999998\",\n                                        \"yp\": \"0.113507\",\n                                        \"x\": \"1\",\n                                        \"y\": \"0.10000000000000001\",\n                                        \"xn\": \"1.1348689999999999\",\n                                        \"yn\": \"0.086493\"\n                                    }\n                                }\n                            }\n                        ]\n                    }\n                },\n                {\n                    \"valueName\": \"generate_venation.max_step_length\",\n                    \"valueType\": \"float\",\n                    \"value\": \"0.0299999993f\"\n"
		+ "                },\n                {\n                    \"valueName\": \"generate_venation.clamp_step_angle\",\n                    \"valueType\": \"bool\",\n                    \"value\": \"false\"\n                },\n                {\n                    \"valueName\": \"generate_venation.max_step_angle\",\n                    \"valueType\": \"float\",\n                    \"value\": \"45f\"\n                },\n                {\n                    \"valueName\": \"generate_venation.clamp_branch_angle\",\n                    \"valueType\": \"bool\",\n                    \"value\": \"false\"\n                },\n                {\n                    \"valueName\": \"generate_venation.max_branch_angle\",\n                    \"valueType\": \"float\",\n                    \"value\": \"90f\"\n                },\n                {\n                    \"valueName\": \"get_geo_property.property\",\n                    \"valueType\": \"string\",\n                    \"value\": \"point_strand_index\"\n                },\n                {\n                    \"valueName\": \"get_geo_property.type\",\n"
		+ "                    \"valueType\": \"array<uint>\",\n                    \"value\": []\n                },\n                {\n                    \"valueName\": \"set_geo_property.property\",\n                    \"valueType\": \"string\",\n                    \"value\": \"color\"\n                },\n                {\n                    \"valueName\": \"set_geo_property.target\",\n                    \"valueType\": \"string\",\n                    \"value\": \"point_component\"\n                },\n                {\n                    \"valueName\": \"random_value.index\",\n                    \"valueType\": \"long\",\n                    \"value\": \"0\"\n                },\n                {\n                    \"valueName\": \"random_value.min\",\n                    \"valueType\": \"Math::float3\",\n                    \"value\": {\n                        \"x\": \"0f\",\n                        \"y\": \"0f\",\n                        \"z\": \"0f\"\n                    }\n                },\n                {\n                    \"valueName\": \"random_value.max\",\n                    \"valueType\": \"Math::float3\",\n"
		+ "                    \"value\": {\n                        \"x\": \"1f\",\n                        \"y\": \"1f\",\n                        \"z\": \"1f\"\n                    }\n                },\n                {\n                    \"valueName\": \"random_value.seed\",\n                    \"valueType\": \"long\",\n                    \"value\": \"0\"\n                }\n            ],\n            \"reservedNodeNames\": [\n                {\n                    \"name\": \"scatterShape\"\n                },\n                {\n                    \"name\": \"input1\"\n                },\n                {\n                    \"name\": \"output\"\n                }\n            ]\n        }\n    ]\n}\n");
	setAttr -k on ".JobPorts__time";
	setAttr -s 6 -k on ".locators";
	setAttr -s 6 -k on ".locators";
	setAttr -k on ".locators[0]";
	setAttr -k on ".locators[1]";
	setAttr -k on ".locators[2]";
	setAttr -k on ".locators[3]";
	setAttr -k on ".locators[4]";
	setAttr -k on ".locators[5]";
	setAttr -k on ".attractors";
createNode transform -n "cat";
	rename -uid "7F3F4329-465D-C388-0339-36B75F3C222B";
	setAttr ".v" no;
createNode transform -n "cat" -p "|cat";
	rename -uid "5FBAAC07-462F-7E9C-945E-CAA89C30907C";
	setAttr ".s" -type "double3" 0.1 0.1 0.1 ;
createNode mesh -n "catShape" -p "|cat|cat";
	rename -uid "DC98CC62-4A80-3DAC-132E-819A24AC3C32";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "uvSet1";
	setAttr -s 858 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.82069898 0.89559102 0.80269998
		 0.89230001 0.80269998 0.9314 0.81729102 0.93506801 0.83984399 0.89792901 0.83633298
		 0.93865401 0.85647899 0.94007599 0.85960501 0.89807701 0.87403399 0.94042498 0.87914401
		 0.89676303 0.890944 0.94017202 0.898085 0.89600497 0.90790397 0.94110399 0.91634601
		 0.89804101 0.93359399 0.90358901 0.92381501 0.94505298 0.94980001 0.91180003 0.93800002
		 0.94950002 0.81881499 0.82248598 0.79610002 0.8222 0.79979998 0.85439998 0.820216
		 0.85461599 0.841802 0.822734 0.841438 0.855232 0.862984 0.85571599 0.86508101 0.82277799
		 0.884251 0.85638398 0.88813901 0.82309401 0.90485299 0.85809797 0.91071099 0.82471502
		 0.92470998 0.86165702 0.932697 0.828583 0.95408499 0.83524901 0.94391298 0.86745
		 0.97500002 0.84460002 0.96259999 0.87529999 0.81900001 0.77359998 0.79170001 0.77329999
		 0.79140002 0.79360002 0.81685698 0.79528099 0.84039998 0.76489997 0.841676 0.79444897
		 0.867679 0.76169097 0.86756498 0.79429799 0.89453501 0.76103902 0.892694 0.79485297
		 0.92063397 0.76308799 0.91652697 0.796444 0.94683897 0.76835299 0.93945998 0.80001098
		 0.96990001 0.78039998 0.96171397 0.80687898 0.99400002 0.792 0.98470002 0.81660002
		 0.86033499 0.719823 0.83359998 0.71539998 0.891949 0.720815 0.925659 0.72335702 0.95599997
		 0.72869998 0.86577201 0.68676102 0.85000002 0.67330003 0.89531898 0.68774301 0.92675698
		 0.69007498 0.94349998 0.67519999 0.89770001 0.66219997 0.63076299 0.65400398 0.66539997
		 0.6559 0.64959997 0.6135 0.61611003 0.61154199 0.5 0.679506 0.54779899 0.679524 0.53680003
		 0.615955 0.5 0.61386001 0.60246599 0.68433499 0.57751501 0.61458397 0.533952 0.56687301
		 0.5 0.56470001 0.52336502 0.43058401 0.5 0.42892399 0.5 0.471578 0.52474397 0.47312599
		 0.75773197 0.045350999 0.75980002 0.0217 0.73820001 0.0217 0.73907101 0.044962 0.75597697
		 0.073432997 0.73865098 0.072843 0.756998 0.102533 0.73711801 0.101647 0.75923198
		 0.12930401 0.734972 0.12662999 0.75955099 0.153063 0.73174298 0.146843 0.75494802
		 0.174748 0.72685999 0.164261 0.744178 0.193527 0.71984798 0.180562 0.72930002 0.20919999
		 0.7101 0.1973 0.7924 0.0232 0.799236 0.049435999 0.80166501 0.073267996 0.79920501
		 0.097223997 0.79371703 0.124728 0.78482199 0.155802 0.777224 0.18382099 0.76333702
		 0.20933101 0.74620003 0.2374 0.844401 0.052552998 0.83819997 0.023800001 0.82340002
		 0.023599999 0.828637 0.052933 0.85432601 0.073040999 0.83059198 0.073008001 0.85285199
		 0.095775999 0.82800198 0.093130998 0.84305501 0.123436 0.82187402 0.120034 0.82895899
		 0.16526 0.80944997 0.15765099 0.81821102 0.200123 0.80024898 0.193177 0.796646 0.234473
		 0.78212601 0.225833 0.77520001 0.2773 0.76169997 0.26609999 0.86259997 0.054299999
		 0.85049999 0.023599999 0.88050002 0.076399997 0.87825 0.101781 0.87112898 0.13791999
		 0.85845101 0.184194 0.841304 0.21358 0.81159997 0.2383 0.78939998 0.2827 0.91449201
		 0.112884 0.92309999 0.087300003 0.90660298 0.15757801 0.89743197 0.203069 0.88059998
		 0.2351 0.97509998 0.1124 0.94925398 0.128865 0.94146597 0.169016 0.93130898 0.208727
		 0.92180002 0.2411 0.97189999 0.1749 0.5 0.51797301 0.529948 0.52006799 0.55470502
		 0.47352099 0.58539999 0.4743 0.57099998 0.4278 0.54847503 0.429295 0.56481099 0.51719999
		 0.602166 0.51322699 0.61825198 0.55978698 0.57342201 0.56374198 0.71627098 0.42771399
		 0.70268399 0.393823 0.68599999 0.40630001 0.6918 0.44159999 0.67603397 0.36595401
		 0.6609 0.37849998 0.745 0.4093 0.72229999 0.3779 0.69019997 0.34509999 0.79001302
		 0.61859202 0.78916299 0.597031 0.76279998 0.60439998 0.76109999 0.62550002 0.77831
		 0.576886 0.74629998 0.58709997 0.81849998 0.6135 0.81400001 0.59149998 0.80769998
		 0.56910002 0.77060699 0.55595899 0.80239999 0.54729998 0.75730997 0.513053 0.7906
		 0.50190002 0.76959997 0.44949999 0.736624 0.46498999 0.64615899 0.50168997 0.68178099
		 0.49072099 0.67079997 0.4637 0.63379997 0.4727 0.69574797 0.52224898 0.65976799 0.53589201
		 0.67953902 0.56303501 0.71135098 0.55255598 0.69849998 0.58829999 0.72530001 0.57969999
		 0.64757198 0.57888198 0.72373599 0.51718998 0.73747802 0.553186 0.70719498 0.479532
		 0.61508501 0.35182801 0.58818698 0.35219198 0.59189999 0.37599999 0.61809999 0.37509999
		 0.61619997 0.32249999 0.5869 0.32539999 0.65539998 0.32749999 0.64867401 0.35258499
		 0.8427 0.2447 0.64249998 0.36899999 0.55879998 0.3547 0.56449997 0.3308 0.56349999
		 0.3942 0.5722 0.3759 0.53930002 0.37490001 0.94929999 0.2448 0.96530002 0.2228 0.51849997
		 0.38890001 0.5 0.38569999 0.54490799 0.40270799 0.91374999 0.379536 0.93141299 0.36822
		 0.92619997 0.34560001 0.91039997 0.36879998 0.89270002 0.38819999 0.88809997 0.37970001
		 0.946208 0.36109298 0.93839997 0.32389998 0.9666 0.3565 0.9594 0.32100001 0.91477698
		 0.395794 0.93422997 0.39425799 0.8951 0.39910001 0.95056301 0.39368901 0.96869999
		 0.39399999 0.93527699 0.43837801 0.91848302 0.44058901 0.90130001 0.44299999 0.94991201
		 0.43689901 0.96630001 0.4375 0.93850601 0.529643 0.92494202 0.53197497 0.92973202
		 0.576253 0.94297701 0.57388401 0.91100001 0.53380001 0.91589999 0.57889998 0.95048398
		 0.52760899 0.95482099 0.57207698 0.96399999 0.52670002 0.96869999 0.5711 0.93644297
		 0.48442799 0.92174399 0.48664501 0.90670002 0.48859999 0.94933802 0.48272499 0.96380001
		 0.48280001 0.93856901 0.61307001;
	setAttr ".uvst[0].uvsp[250:499]" 0.94817501 0.61012203 0.9278 0.61900002 0.95696801
		 0.60961699 0.96869999 0.61210001 0.9508 0.62639999 0.94903499 0.61686897 0.94178098
		 0.61791402 0.93830001 0.62519997 0.96139997 0.62110001 0.95572102 0.61539501 0.70840001
		 0.0288 0.70583999 0.048183002 0.703161 0.070579998 0.702003 0.094143003 0.70186901
		 0.116297 0.70064199 0.136198 0.69678998 0.15418699 0.69019598 0.170802 0.68099999
		 0.1865 0.81728202 0.96443599 0.83131802 0.96973902 0.84651601 0.96921897 0.81339997
		 0.9799 0.82849997 0.98549998 0.8448 0.98570001 0.80019999 0.95209998 0.796 0.9673
		 0.86669999 0.9795 0.86706901 0.96226197 0.92705601 0.96080798 0.92570001 0.97890002
		 0.93900001 0.98900002 0.94400001 0.97100002 0.88139999 0.97329998 0.883964 0.95512998
		 0.90591198 0.95564198 0.9041 0.97030002 0.67286402 0.25491101 0.67979997 0.2357 0.65579998
		 0.23630001 0.64389998 0.24770001 0.6997 0.26800001 0.6979 0.2516 0.64899999 0.27180001
		 0.66250002 0.2834 0.68040001 0.2832 0.64253998 0.044934999 0.63630003 0.060109001
		 0.669833 0.066573001 0.67434901 0.045901999 0.63642401 0.076762997 0.66781998 0.088694997
		 0.62580001 0.040100001 0.61919999 0.056499999 0.61849999 0.0744 0.65670002 0.026799999
		 0.64020002 0.021600001 0.62480003 0.098399997 0.64345098 0.099468 0.64182001 0.164166
		 0.62279999 0.16140001 0.61110002 0.17460001 0.62980002 0.1812 0.6311 0.1145 0.65062201
		 0.118284 0.64888299 0.14206199 0.63319999 0.1392 0.65893298 0.162028 0.66458702 0.145316
		 0.66669101 0.126931 0.66703498 0.108163 0.67900002 0.030400001 0.65280002 0.17659999
		 0.863352 0.30068099 0.87029999 0.28150001 0.84630001 0.28209999 0.8344 0.29350001
		 0.89020002 0.31369999 0.88840002 0.29730001 0.83939999 0.31760001 0.85299999 0.32910001
		 0.87089998 0.329 0.73119998 0.66589999 0.7001 0.68080002 0.70748699 0.71166998 0.74610102
		 0.68068302 0.77279997 0.74339998 0.79329997 0.71359998 0.76703 0.69692802 0.74144799
		 0.72669601 0.80989999 0.67930001 0.78191501 0.67181402 0.81760001 0.64529997 0.78996801
		 0.64646101 0.76171798 0.658867 0.74659997 0.6354 0.77085197 0.64504498 0.96899998
		 0.75309998 0.7022 0.91350001 0.71200001 0.90329999 0.69706297 0.89009398 0.68705797
		 0.899845 0.67279899 0.91352201 0.68589997 0.92839998 0.65803099 0.92304599 0.66769999
		 0.93970001 0.52710003 0.9113 0.52865303 0.88619399 0.5 0.88866198 0.5 0.912 0.61690003
		 0.93169999 0.62409997 0.9562 0.64340001 0.94999999 0.63460302 0.93190598 0.72219998
		 0.89389998 0.73430002 0.88160002 0.71963 0.87161398 0.706536 0.881244 0.74349999
		 0.86049998 0.72648901 0.85066599 0.71055102 0.83590198 0.704292 0.857467 0.68257898
		 0.84371102 0.689367 0.82139599 0.66462398 0.809286 0.65909201 0.83066201 0.67465502
		 0.89153999 0.66036302 0.902089 0.68206501 0.87907201 0.67275399 0.855932 0.66344798
		 0.86574501 0.69060302 0.86944199 0.639956 0.801 0.63470697 0.82348698 0.52856898
		 0.85133499 0.5 0.850209 0.53142798 0.82440501 0.5 0.82287097 0.54367399 0.75618297
		 0.55540001 0.72622401 0.5 0.71833998 0.5 0.754637 0.53697199 0.79125398 0.5 0.78996003
		 0.65617502 0.87993598 0.65370798 0.84426397 0.62909299 0.84921998 0.572456 0.80063403
		 0.57834297 0.770751 0.60576302 0.81238598 0.60980397 0.78669202 0.74839997 0.8484
		 0.735636 0.840698 0.7489 0.82700002 0.72960502 0.81972402 0.7507 0.79350001 0.73772502
		 0.78927898 0.75809997 0.76700002 0.73002702 0.75586402 0.68965799 0.74078697 0.60600901
		 0.72849298 0.64782602 0.73329902 0.657242 0.70076197 0.60951102 0.75818497 0.64350599
		 0.77034801 0.67646199 0.77994198 0.58087802 0.75072002 0.70234501 0.79602802 0.57480299
		 0.928657 0.59440297 0.87516701 0.564215 0.86065 0.601008 0.83929902 0.56810701 0.83157402
		 0.61082 0.90702897 0.64299703 0.89318198 0.62219697 0.87100899 0.631064 0.912956
		 0.65134001 0.912157 0.62562799 0.88935298 0.55604398 0.935058 0.59442997 0.934618
		 0.54578197 0.88281602 0.55743098 0.90281099 0.594926 0.91677797 0.58295 0.90364599
		 0.57171202 0.88484401 0.1973 0.9314 0.1973 0.89230001 0.17930099 0.89559102 0.18270899
		 0.93506801 0.160157 0.89792901 0.16366699 0.93865401 0.143521 0.94007599 0.140395
		 0.89807701 0.125966 0.94042498 0.120856 0.89676303 0.109056 0.94017202 0.101915 0.89600497
		 0.092096001 0.94110399 0.083654001 0.89804101 0.066405997 0.90358901 0.076185003
		 0.94505298 0.0502 0.91180003 0.061999999 0.94950002 0.20020001 0.85439998 0.20389999
		 0.8222 0.18118499 0.82248598 0.179784 0.85461599 0.158198 0.822734 0.158562 0.855232
		 0.137016 0.85571599 0.134919 0.82277799 0.115749 0.85638398 0.111861 0.82309401 0.095146999
		 0.85809797 0.08929 0.82471502 0.075290002 0.86165702 0.067303002 0.828583 0.045915
		 0.83524901 0.056086998 0.86745 0.025 0.84460002 0.0374 0.87529999 0.2086 0.79360002
		 0.20829999 0.77329999 0.18099999 0.77359998 0.183143 0.79528099 0.1596 0.76489997
		 0.158324 0.79444897 0.132321 0.76169097 0.13243499 0.79429799 0.105465 0.76103902
		 0.107306 0.79485297 0.079365999 0.76308799 0.083472997 0.796444 0.053160999 0.76835299
		 0.060539998 0.80001098 0.030099999 0.78039998 0.038286 0.80687898 0.0060000001 0.792
		 0.0153 0.81660002 0.1664 0.71539998 0.13966499 0.719823 0.108051 0.720815 0.074340999
		 0.72335702 0.044 0.72869998 0.15000001 0.67330003 0.13422801 0.68676102 0.104681
		 0.68774301 0.073243 0.69007498 0.056499999 0.67519999;
	setAttr ".uvst[0].uvsp[500:749]" 0.1023 0.66219997 0.3504 0.6135 0.3346 0.6559
		 0.36923701 0.65400398 0.38389 0.61154199 0.4632 0.615955 0.45220101 0.679524 0.42828801
		 0.88484401 0.37437201 0.88935298 0.39753401 0.68433499 0.42248499 0.61458397 0.38918
		 0.90702897 0.466048 0.56687301 0.34865999 0.912157 0.368936 0.912956 0.47663501 0.43058401
		 0.475256 0.47312599 0.26179999 0.0217 0.2402 0.0217 0.242268 0.045350999 0.26092899
		 0.044962 0.244023 0.073432997 0.26134899 0.072843 0.243002 0.102533 0.26288199 0.101647
		 0.240768 0.12930401 0.265028 0.12662999 0.240449 0.153063 0.26825699 0.146843 0.24505199
		 0.174748 0.27314001 0.164261 0.255822 0.193527 0.28015199 0.180562 0.27070001 0.20919999
		 0.2899 0.1973 0.2076 0.0232 0.200764 0.049435999 0.19833501 0.073267996 0.20079499
		 0.097223997 0.206283 0.124728 0.215178 0.155802 0.222776 0.18382099 0.236663 0.20933101
		 0.2538 0.2374 0.17659999 0.023599999 0.1618 0.023800001 0.155599 0.052552998 0.171363
		 0.052933 0.14567401 0.073040999 0.16940799 0.073008001 0.147148 0.095775999 0.17199799
		 0.093130998 0.15694501 0.123436 0.17812599 0.120034 0.171041 0.16526 0.19055 0.15765099
		 0.181789 0.200123 0.199751 0.193177 0.203354 0.234473 0.21787401 0.225833 0.22480001
		 0.2773 0.2383 0.26609999 0.1495 0.023599999 0.1374 0.054299999 0.1195 0.076399997
		 0.12175 0.101781 0.12887099 0.13791999 0.14154901 0.184194 0.158696 0.21358 0.1884
		 0.2383 0.2106 0.2827 0.076899998 0.087300003 0.085507996 0.112884 0.093396999 0.15757801
		 0.102568 0.203069 0.1194 0.2351 0.024900001 0.1124 0.050746001 0.128865 0.058534
		 0.169016 0.068691 0.208727 0.078199998 0.2411 0.028100001 0.1749 0.470052 0.52006799
		 0.377803 0.87100899 0.42899999 0.4278 0.41459998 0.4743 0.44529501 0.47352099 0.451525
		 0.429295 0.397834 0.51322699 0.43518901 0.51719999 0.42657799 0.56374198 0.38174799
		 0.55978698 0.31400001 0.40630001 0.29731598 0.393823 0.28372899 0.42771399 0.3082
		 0.44159999 0.3391 0.37849998 0.323966 0.36595401 0.27770001 0.3779 0.255 0.4093 0.3098
		 0.34509999 0.23720001 0.60439998 0.21083701 0.597031 0.209987 0.61859202 0.23890001
		 0.62550002 0.25369999 0.58709997 0.22169 0.576886 0.1815 0.6135 0.186 0.59149998
		 0.19230001 0.56910002 0.22939301 0.55595899 0.19759999 0.54729998 0.2304 0.44949999
		 0.2094 0.50190002 0.24269 0.513053 0.263376 0.46498999 0.3292 0.4637 0.31821901 0.49072099
		 0.35384101 0.50168997 0.3662 0.4727 0.320461 0.56303501 0.34023198 0.53589201 0.304252
		 0.52224898 0.28864899 0.55255598 0.27469999 0.57969999 0.30149999 0.58829999 0.35242799
		 0.57888198 0.27626401 0.51718998 0.26252201 0.553186 0.29280499 0.479532 0.40810001
		 0.37599999 0.41181299 0.35219198 0.38491499 0.35182801 0.38190001 0.37509999 0.3838
		 0.32249999 0.4131 0.32539999 0.34459999 0.32749999 0.35132599 0.35258499 0.1573 0.2447
		 0.35749999 0.36899999 0.44119999 0.3547 0.4355 0.3308 0.4278 0.3759 0.43650001 0.3942
		 0.46070001 0.37490001 0.034699999 0.2228 0.050700001 0.2448 0.357003 0.89318198 0.4815
		 0.38890001 0.45509201 0.40270799 0.073799998 0.34560001 0.068586998 0.36822 0.08625
		 0.379536 0.089599997 0.36879998 0.1073 0.38819999 0.1119 0.37970001 0.0616 0.32389998
		 0.053792 0.36109298 0.040599998 0.32100001 0.033399999 0.3565 0.06577 0.39425799
		 0.085222997 0.395794 0.1049 0.39910001 0.049437001 0.39368901 0.031300001 0.39399999
		 0.064723 0.43837801 0.081517003 0.44058901 0.098700002 0.44299999 0.050088 0.43689901
		 0.0337 0.4375 0.070267998 0.576253 0.075057998 0.53197497 0.061494 0.529643 0.057023
		 0.57388401 0.084100001 0.57889998 0.089000002 0.53380001 0.049516 0.52760899 0.045178998
		 0.57207698 0.035999998 0.52670002 0.031300001 0.5711 0.078255996 0.48664501 0.063556999
		 0.48442799 0.0933 0.48859999 0.050662 0.48272499 0.036199998 0.48280001 0.061430998
		 0.61307001 0.051824998 0.61012203 0.0722 0.61900002 0.043032002 0.60961699 0.031300001
		 0.61210001 0.058219001 0.61791402 0.050965 0.61686897 0.049199998 0.62639999 0.061700001
		 0.62519997 0.044279002 0.61539501 0.038600001 0.62110001 0.29416001 0.048183002 0.29159999
		 0.0288 0.296839 0.070579998 0.297997 0.094143003 0.29813099 0.116297 0.29935801 0.136198
		 0.30320999 0.15418699 0.30980399 0.170802 0.31900001 0.1865 0.16868199 0.96973902
		 0.18271799 0.96443599 0.153484 0.96921897 0.1715 0.98549998 0.1866 0.9799 0.1552
		 0.98570001 0.204 0.9673 0.1998 0.95209998 0.13293099 0.96226197 0.13330001 0.9795
		 0.061000001 0.98900002 0.074299999 0.97890002 0.072944 0.96080798 0.055999998 0.97100002
		 0.116036 0.95512998 0.1186 0.97329998 0.094088003 0.95564198 0.095899999 0.97030002
		 0.34419999 0.23630001 0.3202 0.2357 0.32713601 0.25491101 0.35609999 0.24770001 0.3021
		 0.2516 0.3003 0.26800001 0.35100001 0.27180001 0.33750001 0.2834 0.31959999 0.2832
		 0.330167 0.066573001 0.3637 0.060109001 0.35745999 0.044934999 0.32565099 0.045901999
		 0.33217999 0.088694997 0.36357599 0.076762997 0.38080001 0.056499999 0.37419999 0.040100001
		 0.38150001 0.0744 0.35980001 0.021600001 0.34329998 0.026799999 0.35654899 0.099468
		 0.3752 0.098399997 0.38890001 0.17460001 0.37720001 0.16140001 0.35817999 0.164166
		 0.37020001 0.1812 0.34937799 0.118284;
	setAttr ".uvst[0].uvsp[750:857]" 0.3689 0.1145 0.35111699 0.14206199 0.36680001
		 0.1392 0.33541301 0.145316 0.34106699 0.162028 0.33330899 0.126931 0.33296499 0.108163
		 0.32100001 0.030400001 0.34720001 0.17659999 0.15369999 0.28209999 0.12970001 0.28150001
		 0.136648 0.30068099 0.1656 0.29350001 0.1116 0.29730001 0.1098 0.31369999 0.16060001
		 0.31760001 0.147 0.32910001 0.12909999 0.329 0.29251301 0.71166998 0.2999 0.68080002
		 0.26879999 0.66589999 0.25389901 0.68068302 0.23297 0.69692802 0.2067 0.71359998
		 0.2272 0.74339998 0.258553 0.72669601 0.1901 0.67930001 0.21808501 0.67181402 0.1824
		 0.64529997 0.210032 0.64646101 0.238282 0.658867 0.2534 0.6354 0.229148 0.64504498
		 0.030999999 0.75309998 0.302937 0.89009398 0.28799999 0.90329999 0.2978 0.91350001
		 0.312942 0.899845 0.32720101 0.91352201 0.3141 0.92839998 0.33230001 0.93970001 0.34196901
		 0.92304599 0.40557 0.934618 0.471347 0.88619399 0.4729 0.9113 0.405074 0.91677797
		 0.35659999 0.94999999 0.3759 0.9562 0.3831 0.93169999 0.36539701 0.93190598 0.28037
		 0.87161398 0.26570001 0.88160002 0.27779999 0.89389998 0.293464 0.881244 0.25650001
		 0.86049998 0.27351099 0.85066599 0.295708 0.857467 0.28944901 0.83590198 0.33537599
		 0.809286 0.310633 0.82139599 0.31742099 0.84371102 0.34090799 0.83066201 0.32534501
		 0.89153999 0.33963701 0.902089 0.31793499 0.87907201 0.33655199 0.86574501 0.32724601
		 0.855932 0.30939701 0.86944199 0.365293 0.82348698 0.360044 0.801 0.41705 0.90364599
		 0.47143099 0.85133499 0.454218 0.88281602 0.46857199 0.82440501 0.43189201 0.83157402
		 0.44459999 0.72622401 0.45632601 0.75618297 0.435785 0.86065 0.46302801 0.79125398
		 0.405597 0.87516701 0.34382501 0.87993598 0.34629199 0.84426397 0.37090701 0.84921998
		 0.421657 0.770751 0.427544 0.80063403 0.39423701 0.81238598 0.390196 0.78669202 0.2516
		 0.8484 0.264364 0.840698 0.2511 0.82700002 0.27039501 0.81972402 0.2493 0.79350001
		 0.26227501 0.78927898 0.2419 0.76700002 0.26997301 0.75586402 0.31034201 0.74078697
		 0.35217401 0.73329902 0.39399099 0.72849298 0.34275901 0.70076197 0.39048901 0.75818497
		 0.35649401 0.77034801 0.32353801 0.77994198 0.41912201 0.75072002 0.29765499 0.79602802
		 0.44256899 0.90281099 0.42519701 0.928657 0.44395599 0.935058 0.398992 0.83929902;
	setAttr ".cuvs" -type "string" "uvSet1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 684 ".vt";
	setAttr ".vt[0:165]"  -5.47230005 2.83279991 13.076299667 -6.04129982 3.12220001 14.2020998
		 -7.41480017 3.2420001 14.75829983 -8.78829956 3.12220001 14.2020998 -9.35719967 2.83279991 13.076299667
		 -8.78829956 2.54340005 11.90639973 -7.41480017 2.42359996 11.3501997 -6.04129982 2.54340005 11.90639973
		 -5.021299839 9.62339973 11.2944994 -5.72230005 9.82829952 12.9744997 -7.41480017 9.91319942 13.67029953
		 -9.10719967 9.82829952 12.9744997 -9.80819988 9.62339973 11.2944994 -9.10719967 9.41849995 9.61450005
		 -7.41480017 9.33360004 8.91860008 -5.72230005 9.41849995 9.61450005 -4.39230013 15.11450005 10.33729935
		 -5.27759981 15.15459919 12.47410011 -7.41480017 15.1711998 13.35919952 -9.55200005 15.15459919 12.47410011
		 -10.43719959 15.11450005 10.33729935 -9.55200005 15.074399948 8.20049953 -7.41480017 15.057699203 7.31540012
		 -5.27759981 15.074399948 8.20049953 -4.42180014 17.39669991 10.33729935 -7.44049978 17.63430023 13.35409927
		 -9.54939938 17.98539925 12.47049999 -10.40779972 18.23800087 10.33729935 -9.51299953 18.24410057 8.20409966
		 -7.38910007 18.00029945374 7.3204999 -5.2802 17.64929962 8.20409966 -7.73890018 21.82180023 15.57999992
		 -9.62549973 21.71269989 13.84819984 -10.68330002 22.024000168 10.97239971 -9.58069992 22.031499863 7.88980007
		 -6.96360016 21.73110008 6.80109978 -9.62549973 25.01210022 13.84819984 -10.24329853 25.3234005 10.97239971
		 -9.58069992 25.33099937 7.88980007 -8.26719952 26.69860077 6.76219988 -8.33119965 25.8708992 15.10249996
		 -9.34329987 27.62070084 10.97239971 -2.41109991 32.70549774 4.454 -5.45319986 31.65659904 10.16389942
		 -6.98640013 28.96109962 5.6092 -7.40360022 29.52269936 9.16020012 -5.019299984 31.20739937 4.91480017
		 -2.70639992 33.26429749 8.67039967 -2.41109991 33.01599884 -8.39799976 -2.41109991 32.46609879 -12.88499928
		 -5.72230005 7.75750017 -12.7553997 -5.021299839 7.88100004 -14.44329929 -7.41480017 7.70629978 -12.056200027
		 -9.10719967 7.75750017 -12.7553997 -9.80819988 7.88100004 -14.44329929 -9.10719967 8.0044994354 -16.13119888
		 -7.41480017 8.055699348 -16.83040047 -5.72230005 8.0044994354 -16.13119888 -5.72230005 8.99109936 -12.53069973
		 -5.021299839 9.75299931 -14.041999817 -7.41480017 8.67539978 -11.90469933 -9.10719967 8.99109936 -12.53069973
		 -9.80819988 9.75299931 -14.041999817 -9.10719967 10.51490021 -15.55319977 -7.41480017 10.83049965 -16.17919922
		 -5.72230005 10.51490021 -15.55319977 -4.79290009 13.4425993 -7.54449987 -3.70689988 14.14839935 -10.68289852
		 -7.41480017 13.15019989 -6.24450016 -10.036699295 13.4425993 -7.54440022 -11.12269974 14.14839935 -10.68289852
		 -10.036699295 14.42939854 -14.39039993 -7.41480017 14.7322998 -15.85309982 -4.79290009 14.42939854 -14.39039993
		 -4.79290009 15.46889973 -6.98649979 -3.70689988 15.58389854 -10.23769951 -7.41480017 16.42009926 -5.63980007
		 -10.036699295 16.64489937 -6.98649979 -11.12269974 16.46689987 -10.23769951 -10.036699295 16.28890038 -14.48009968
		 -7.41480017 16.21520042 -16.0049991608 -4.79290009 15.81819916 -14.15639973 -5.44759989 17.61879921 -6.89610004
		 -4.15789986 16.85849953 -10.18919945 -7.8895998 19.34490013 -5.82959986 -10.014699936 19.68350029 -7.20529985
		 -10.62029934 19.71179962 -11.046699524 -9.56639957 19.27190018 -15.6371994 -6.93989992 18.19750023 -16.72710037
		 -4.77600002 17.098199844 -14.44729996 -7.44080019 23.33230019 -6.20800018 -9.38549995 23.480299 -7.84380007
		 -10.039999962 23.60279846 -12.40439987 -8.66930008 23.17110062 -16.87000084 -5.92010021 21.69079971 -18.07060051
		 -6.29650021 28.16449928 -7.3125 -6.62230015 28.94679832 -12.75739956 -8.2553997 26.89999962 -8.87860012
		 -8.95129967 27.16989899 -12.92089939 -7.49940014 26.31399918 -16.62809944 -5.22989988 25.096599579 -18.25959969
		 -2.7657001 33.073699951 0.61309999 -4.73820019 30.89430046 -12.8355999 -4.52810001 30.74319839 -7.98869991
		 -5.40950012 30.86539841 0.78289998 -7.051099777 27.63529968 -3.19440007 -2.7657001 33.19519806 -3.67059994
		 -5.21029997 30.80739975 -3.56150007 -7.46729994 27.48180008 1.43069994 -2.98020005 16.61249924 -6.89610004
		 -2.22210002 16.66559982 -10.18919945 -2.4066999 16.70219994 -14.0092992783 0 16.43219948 -10.18919945
		 0 14.70510006 12.47049999 -2.21090007 15.71849918 10.33729935 -2.65829992 15.71229935 12.47049999
		 -2.6401 15.97109985 8.20409966 -3.22339988 15.025899887 1.92040002 -3.32089996 15.2809 -3.13849998
		 -2.93969989 15.68540001 6.14529991 -7.74370003 23.028799057 0.634 -7.44390011 19.25790024 0.71389997
		 -7.73040009 23.14010048 -2.98539996 -7.094500065 19.013000488 4.12639999 -7.47419977 22.27949905 3.80110002
		 -7.73619986 19.34790039 -2.75 -7.86740017 25.57519913 3.91589999 -5.36600018 17.27569962 4.9296999
		 -5.70020008 17.092599869 1.19210005 -5.85780001 17.25749969 -2.88019991 -2.96000004 21.7534008 -18.86129951
		 -2.57319999 24.76079941 -18.87689972 -2.48569989 18.62319946 -16.71399879 -4.41529989 19.046800613 -16.46150017
		 -2.52029991 29.91429901 -17.95059967 -1.94140005 27.5345993 -18.78280067 -5.26329994 28.79169846 -16.6772995
		 -4.21570015 27.21290016 -18.0028991699 -1.76779997 31.7784996 -16.93050003 -4.011300087 30.45560074 -15.64009953
		 -2.52029991 29.038099289 -19.92609978 -1.94140005 27.21249962 -19.72369957 -1.8642 30.44829941 -20.15449905
		 -2.1644001 27.68559837 -21.89179993 -1.66719997 26.44239998 -20.85039902 -1.60090005 28.74389839 -22.75429916
		 -0.98989999 14.92169952 -37.79249954 0 14.078399658 -37.38660049 -0.86839998 14.23659992 -37.35049438
		 -0.84820002 15.6385994 -38.026599884 -1.56780005 19.50219917 -30.58659935 0 18.23329926 -29.75130081
		 -1.20770001 18.53120041 -29.94129944 -1.15960002 20.32690048 -31.11870003 -1.6825 22.15369987 -27.63579941
		 0 20.84390068 -26.65810013 -1.29610002 21.15180016 -26.8810997 -1.24450004 23.0056991577 -28.25959969
		 -1.63569999 17.14780045 -33.84270096 -1.25999999 16.10009956 -33.22299957 -1.20990002 18.036699295 -34.35240173
		 0 18.2791996 -34.5174942 -1.59949994 15.29459953 -37.15859985 -1.23179996 14.2184 -36.63589859
		 -1.18309999 16.20059967 -37.59859848 -1.92349994 24.98239899 -24.72200012;
	setAttr ".vt[166:331]" -1.48169994 23.85989952 -23.8239994 -1.42270005 25.9375 -25.46520042
		 -5.25759983 11.21679974 -10.037599564 -4.36409998 11.95069981 -12.36240005 -7.41480017 10.91279984 -9.07460022
		 -9.57199955 11.21679974 -10.037599564 -10.46549988 11.95069981 -12.36240005 -9.57199955 12.47219944 -14.97179985
		 -7.41480017 12.77609921 -15.93479919 -5.25759983 12.47219944 -14.97179985 -5.88180017 5.41559982 -12.19539928
		 -5.24679995 5.27320004 -13.69509983 -7.41480017 5.47459984 -11.57419968 -8.94779968 5.41559982 -12.19539928
		 -9.58269978 5.27320004 -13.69509983 -8.94779968 5.13079977 -15.19479942 -7.41480017 5.071799755 -15.81599998
		 -5.88180017 5.13079977 -15.19479942 -5.88180017 6.33059978 13.60369968 -5.24679995 6.22809982 12.076899529
		 -7.41480017 6.37300014 14.23609924 -8.94779968 6.33059978 13.60369968 -9.58269978 6.22809982 12.076899529
		 -8.94779968 6.12559986 10.55019951 -7.41480017 6.083199978 9.91779995 -5.88180017 6.12559986 10.55019951
		 -4.70679998 12.52960014 10.81589985 -5.5 12.65209961 12.72429943 -7.41480017 12.70289993 13.51480007
		 -9.32959938 12.65209961 12.72429943 -10.12269974 12.52960014 10.81589985 -9.32959938 12.40709972 8.90749931
		 -7.41480017 12.35639954 8.11699963 -5.5 12.40709972 8.90749931 -5.88850021 1.52110004 16.36009979
		 -7.41480017 1.52110004 16.92910004 -8.94110012 1.52110004 16.36009979 -5.88850021 0.00019999999 17.038799286
		 -7.41480017 0.00019999999 17.60770035 -8.94099998 0.00019999999 17.038799286 -4.70709991 1.52110004 14.44679928
		 -10.12249851 1.52110004 14.44679928 -5.37239981 1.37059999 12.67929935 -9.45709991 1.37059999 12.67929935
		 -5.37239981 0.0132 13.77619934 -9.45709991 0.0132 13.77619934 -7.41480017 0.098200001 12.98089981
		 -7.41480017 1.14789999 12.0064001083 -10.12249851 0.00019999999 15.12539959 -7.41480017 0.00019999999 14.8427
		 -4.70709991 0.00019999999 15.12539959 -5.47230005 2.89050007 -12.73269939 -6.041200161 3.17980003 -11.60689926
		 -7.41480017 3.29970002 -11.050700188 -8.78829956 3.17980003 -11.60689926 -9.35719967 2.89050007 -12.73269939
		 -8.78829956 2.60109997 -13.90259933 -7.41480017 2.48129988 -14.45869923 -6.041200161 2.60109997 -13.90259933
		 -5.88850021 1.57869995 -9.44880009 -7.41480017 1.57869995 -8.87989998 -8.94099998 1.57869995 -9.44880009
		 -5.88850021 0.057799999 -8.77019978 -7.41480017 0.057799999 -8.20129967 -8.94099998 0.057799999 -8.77019978
		 -4.70709991 1.57869995 -11.36219978 -4.70709991 0.057799999 -10.68349934 -10.12249851 0.057799999 -10.68349934
		 -10.12249851 1.57869995 -11.36219978 -5.37239981 1.42820001 -13.12969971 -5.37239981 0.070799999 -12.032799721
		 -9.45709991 0.070799999 -12.032799721 -9.45709991 1.42820001 -13.12969971 -7.41480017 0.1558 -12.82800007
		 -7.41480017 1.20560002 -13.80259991 -7.41480017 0.057799999 -10.96630001 0 21.82180023 18.60009956
		 -2.94230008 21.82180023 17.99130058 -3.019599915 25.58209991 18.052900314 -5.63000011 26.79509926 16.38780022
		 -5.61810017 21.82180023 16.97599983 -2.70609999 19.060499191 16.86090088 0 18.51079941 17.34829903
		 -2.52600002 17.058300018 15.008099556 -5.044700146 19.059099197 15.7553997 -4.34130001 17.77260017 14.6215992
		 -5.31659985 17.39049911 12.47049999 -5.82620001 19.2784996 6.91690016 -1.8362 38.71979904 24.60090065
		 -1.67299998 34.8465004 25.76449966 -1.8362 40.53439713 24.1378994 -1.95500004 43.11529922 21.036600113
		 -1.74189997 36.27420044 25.042600632 -1.67299998 33.019500732 24.58449936 -4.55690002 34.89569855 22.30949974
		 -4.55690002 33.068698883 21.3404007 -6.73190022 36.15179825 18.39599991 -6.73099995 34.43700027 17.48629951
		 -4.50299978 38.84329987 22.25550079 -4.35410023 36.26039886 22.08769989 -3.11500001 34.65649414 24.22529984
		 -3.11500001 32.82939911 23.1508007 -3.13319993 38.75099945 23.90410042 -2.96090007 36.26490021 23.63220024
		 -6.29029989 35.26390076 20.51980019 -6.29029989 33.4367981 19.55069923 -1.8362 41.90859985 23.11569977
		 0 43.36449432 21.32369995 -2.54229999 36.01720047 11.92079926 -2.3757 37.91349411 13.08509922
		 -2.8743999 34.36660004 11.18019962 -1.81159997 37.44979858 24.82780075 -4.47399998 37.4496994 22.0072002411
		 -2.88409996 37.4496994 23.42790031 -5.72160006 36.48259735 20.63120079 -6.095600128 38.020999908 19.20549965
		 -6.44649982 36.96689987 15.98009968 -6.24620008 35.29700089 14.96789932 -4.63399982 37.59000015 14.16459942
		 -4.62989998 35.84469986 13.099699974 -1.18379998 31.91720009 24.20179939 -1.67299998 31.29169846 22.40769958
		 -1.11210001 29.69129944 20.3118 -2.19199991 28.082099915 18.34479904 0 30.9022007 -20.18880081
		 0 26.059799194 -20.54190063 0 37.44979858 25.22739983 -6.74429989 29.56759834 13.37979984
		 -5.28999996 31.087900162 14.40049934 -4.55579996 29.23089981 16.4477005 -4.91099977 32.86909866 12.59149933
		 -5.26919985 33.9408989 13.95510006 -5.63829994 32.87129974 16.085699081 -5.050899982 31.58950043 18.16460037
		 -4.30509996 34.72219849 12.60419941 -3.63840008 31.22609901 20.067300797 0 14.71119976 10.33729935
		 0 23.51460075 -23.55820084 0 25.080400467 18.90649986 0 36.27149963 25.67959976 0 38.23709869 12.65259933
		 0 29.59479904 20.67609978 0 27.50040054 19.41489983 -5.96776676 44.413311 19.27170753
		 -4.62360001 41.19809723 16.30780029 -5.92780018 40.8844986 18.093999863 -6.30700016 38.7356987 16.9843998
		 -4.59110022 39.42399979 15.32409954 -2.25699997 39.97850037 14.073299408 0 40.25329971 13.63589954
		 -5.66470003 39.68920135 19.6189003 -3.2249999 40.33659744 23.19210052 -4.44539976 40.45190048 21.76370049
		 -3.56660008 42.18330002 20.9708004 -2.95180011 41.48899841 22.63240051 -2.32209992 43.18700027 17.29260063
		 -2.53066397 43.30610657 19.43094826 -2.22420001 41.65409851 15.11940002 -4.27939987 41.95549774 19.3906002
		 -4.85379982 40.68989944 20.2852993 0 33.7215004 4.15199995 0 34.088897705 0.31889999
		 0 34.032001495 -8.69999981 0 33.18859863 -13.15579987 0 14.40559959 1.92040002 0 26.48579979 -18.8885994;
	setAttr ".vt[332:497]" 0 32.18219757 -17.26300049 0 26.64019966 -19.72780037
		 0 26.19379997 -25.69849968 0 15.77909851 -33.04119873 0 20.55050087 -31.28889847
		 0 23.23509979 -28.45660019 0 14.80009937 -38.0038986206 0 42.15239716 23.41419983
		 0 34.8465004 26.25149918 0 31.29169846 23.10560036 0 15.68330002 -38.16040039 0 16.45999908 -37.72470093
		 0 29.026899338 -23.023899078 0 38.71620178 25.11030006 0 43.83739853 19.51740074
		 0 36.42350006 11.50229931 0 31.91720009 24.89979935 0 34.21120071 -3.97420001 0 16.37899971 -6.89610004
		 0 16.14369965 15.12139988 0 33.86800003 8.33039951 0 16.55939865 -14.07959938 0 14.96379852 8.20409966
		 0 14.8715992 6.14529991 0 14.85400009 -3.13849998 0 21.8159008 -18.40379906 0 24.46800041 -18.41569901
		 0 18.77980042 -16.68029976 0 13.89229965 -36.47750092 0 40.65929413 24.64570045 0 43.49829865 17.49209976
		 0 33.019500732 25.28240013 0 41.94369888 14.82409954 0 34.93930054 10.15030003 -4.56487083 44.24438095 19.73767662
		 -3.50402999 42.66786575 17.17985153 -4.51030111 43.45988083 18.036396027 -4.83704281 43.17844391 18.98356056
		 -6.084607124 42.74388123 18.7209816 -5.25879478 42.22665405 17.5335598 5.47230005 2.83279991 13.076299667
		 5.24679995 6.22809982 12.076899529 5.88180017 6.33059978 13.60369968 6.04129982 3.12220001 14.2020998
		 7.41480017 6.37300014 14.23609924 7.41480017 3.2420001 14.75829983 8.78829956 3.12220001 14.2020998
		 8.94779968 6.33059978 13.60369968 9.35719967 2.83279991 13.076299667 9.58269978 6.22809982 12.076899529
		 8.78829956 2.54340005 11.90639973 8.94779968 6.12559986 10.55019951 7.41480017 2.42359996 11.3501997
		 7.41480017 6.083199978 9.91779995 5.88180017 6.12559986 10.55019951 6.04129982 2.54340005 11.90639973
		 5.021299839 9.62339973 11.2944994 4.70679998 12.52960014 10.81589985 5.5 12.65209961 12.72429943
		 5.72230005 9.82829952 12.9744997 7.41480017 12.70289993 13.51480007 7.41480017 9.91319942 13.67029953
		 9.10719967 9.82829952 12.9744997 9.32959938 12.65209961 12.72429943 9.80819988 9.62339973 11.2944994
		 10.12269974 12.52960014 10.81589985 9.10719967 9.41849995 9.61450005 9.32959938 12.40709972 8.90749931
		 7.41480017 9.33360004 8.91860008 7.41480017 12.35639954 8.11699963 5.5 12.40709972 8.90749931
		 5.72230005 9.41849995 9.61450005 4.39230013 15.11450005 10.33729935 4.42180014 17.39669991 10.33729935
		 5.31659985 17.39049911 12.47049999 5.27759981 15.15459919 12.47410011 7.44049978 17.63430023 13.35409927
		 7.41480017 15.1711998 13.35919952 9.54939938 17.98539925 12.47049999 9.55200005 15.15459919 12.47410011
		 10.40779972 18.23800087 10.33729935 10.43719959 15.11450005 10.33729935 9.51299953 18.24410057 8.20409966
		 9.55200005 15.074399948 8.20049953 7.38910007 18.00029945374 7.3204999 7.41480017 15.057699203 7.31540012
		 5.2802 17.64929962 8.20409966 5.27759981 15.074399948 8.20049953 7.73890018 21.82180023 15.57999992
		 9.62549973 21.71269989 13.84819984 10.68330002 22.024000168 10.97239971 9.58069992 22.031499863 7.88980007
		 6.96360016 21.73110008 6.80109978 8.33119965 25.8708992 15.10249996 9.62549973 25.01210022 13.84819984
		 10.24329853 25.3234005 10.97239971 9.58069992 25.33099937 7.88980007 8.26719952 26.69860077 6.76219988
		 9.34329987 27.62070084 10.97239971 7.40360022 29.52269936 9.16020012 6.98640013 28.96109962 5.6092
		 2.41109991 32.70549774 4.454 2.70639992 33.26429749 8.67039967 5.45319986 31.65659904 10.16389942
		 5.019299984 31.20739937 4.91480017 2.7657001 33.073699951 0.61309999 2.41109991 32.46609879 -12.88499928
		 2.41109991 33.01599884 -8.39799976 5.021299839 7.88100004 -14.44329929 5.021299839 9.75299931 -14.041999817
		 5.72230005 8.99109936 -12.53069973 5.72230005 7.75750017 -12.7553997 7.41480017 8.67539978 -11.90469933
		 7.41480017 7.70629978 -12.056200027 9.10719967 8.99109936 -12.53069973 9.10719967 7.75750017 -12.7553997
		 9.80819988 9.75299931 -14.041999817 9.80819988 7.88100004 -14.44329929 9.10719967 10.51490021 -15.55319977
		 9.10719967 8.0044994354 -16.13119888 7.41480017 10.83049965 -16.17919922 7.41480017 8.055699348 -16.83040047
		 5.72230005 10.51490021 -15.55319977 5.72230005 8.0044994354 -16.13119888 4.36409998 11.95069981 -12.36240005
		 5.25759983 11.21679974 -10.037599564 7.41480017 10.91279984 -9.07460022 9.57199955 11.21679974 -10.037599564
		 10.46549988 11.95069981 -12.36240005 9.57199955 12.47219944 -14.97179985 7.41480017 12.77609921 -15.93479919
		 5.25759983 12.47219944 -14.97179985 3.70689988 14.14839935 -10.68289852 3.70689988 15.58389854 -10.23769951
		 4.79290009 15.46889973 -6.98649979 4.79290009 13.4425993 -7.54449987 7.41480017 16.42009926 -5.63980007
		 7.41480017 13.15019989 -6.24450016 10.036699295 16.64489937 -6.98649979 10.036699295 13.4425993 -7.54440022
		 11.12269974 16.46689987 -10.23769951 11.12269974 14.14839935 -10.68289852 10.036699295 16.28890038 -14.48009968
		 10.036699295 14.42939854 -14.39039993 7.41480017 16.21520042 -16.0049991608 7.41480017 14.7322998 -15.85309982
		 4.79290009 15.81819916 -14.15639973 4.79290009 14.42939854 -14.39039993 4.15789986 16.85849953 -10.18919945
		 5.44759989 17.61879921 -6.89610004 7.8895998 19.34490013 -5.82959986 10.014699936 19.68350029 -7.20529985
		 10.62029934 19.71179962 -11.046699524 9.56639957 19.27190018 -15.6371994 6.93989992 18.19750023 -16.72710037
		 4.77600002 17.098199844 -14.44729996 7.44080019 23.33230019 -6.20800018 9.38549995 23.480299 -7.84380007
		 10.039999962 23.60279846 -12.40439987 8.66930008 23.17110062 -16.87000084 5.92010021 21.69079971 -18.07060051
		 6.29650021 28.16449928 -7.3125 8.2553997 26.89999962 -8.87860012 8.95129967 27.16989899 -12.92089939
		 7.49940014 26.31399918 -16.62809944 5.22989988 25.096599579 -18.25959969;
	setAttr ".vt[498:663]" 6.62230015 28.94679832 -12.75739956 2.7657001 33.19519806 -3.67059994
		 4.52810001 30.74319839 -7.98869991 4.73820019 30.89430046 -12.8355999 7.051099777 27.63529968 -3.19440007
		 5.21029997 30.80739975 -3.56150007 5.40950012 30.86539841 0.78289998 7.46729994 27.48180008 1.43069994
		 2.22210002 16.66559982 -10.18919945 2.98020005 16.61249924 -6.89610004 2.4066999 16.70219994 -14.0092992783
		 2.21090007 15.71849918 10.33729935 2.65829992 15.71229935 12.47049999 2.6401 15.97109985 8.20409966
		 2.93969989 15.68540001 6.14529991 3.22339988 15.025899887 1.92040002 3.32089996 15.2809 -3.13849998
		 7.73619986 19.34790039 -2.75 7.73040009 23.14010048 -2.98539996 7.47419977 22.27949905 3.80110002
		 7.74370003 23.028799057 0.634 7.44390011 19.25790024 0.71389997 7.094500065 19.013000488 4.12639999
		 5.82620001 19.2784996 6.91690016 7.86740017 25.57519913 3.91589999 5.70020008 17.092599869 1.19210005
		 5.36600018 17.27569962 4.9296999 5.85780001 17.25749969 -2.88019991 2.57319999 24.76079941 -18.87689972
		 2.96000004 21.7534008 -18.86129951 2.48569989 18.62319946 -16.71399879 4.41529989 19.046800613 -16.46150017
		 1.94140005 27.5345993 -18.78280067 4.21570015 27.21290016 -18.0028991699 5.26329994 28.79169846 -16.6772995
		 2.52029991 29.91429901 -17.95059967 1.76779997 31.7784996 -16.93050003 4.011300087 30.45560074 -15.64009953
		 2.52029991 29.038099289 -19.92609978 1.94140005 27.21249962 -19.72369957 1.8642 30.44829941 -20.15449905
		 2.1644001 27.68559837 -21.89179993 1.66719997 26.44239998 -20.85039902 1.60090005 28.74389839 -22.75429916
		 1.92349994 24.98239899 -24.72200012 1.48169994 23.85989952 -23.8239994 1.42270005 25.9375 -25.46520042
		 1.25999999 16.10009956 -33.22299957 1.20770001 18.53120041 -29.94129944 1.56780005 19.50219917 -30.58659935
		 1.63569999 17.14780045 -33.84270096 1.15960002 20.32690048 -31.11870003 1.20990002 18.036699295 -34.35240173
		 1.29610002 21.15180016 -26.8810997 1.6825 22.15369987 -27.63579941 1.24450004 23.0056991577 -28.25959969
		 1.23179996 14.2184 -36.63589859 1.59949994 15.29459953 -37.15859985 1.18309999 16.20059967 -37.59859848
		 0.86839998 14.23659992 -37.35049438 0.98989999 14.92169952 -37.79249954 0.84820002 15.6385994 -38.026599884
		 5.88180017 5.41559982 -12.19539928 5.24679995 5.27320004 -13.69509983 7.41480017 5.47459984 -11.57419968
		 8.94779968 5.41559982 -12.19539928 9.58269978 5.27320004 -13.69509983 8.94779968 5.13079977 -15.19479942
		 7.41480017 5.071799755 -15.81599998 5.88180017 5.13079977 -15.19479942 7.41480017 1.52110004 16.92910004
		 5.88850021 1.52110004 16.36009979 8.94110012 1.52110004 16.36009979 7.41480017 0.00019999999 17.60770035
		 5.88850021 0.00019999999 17.038799286 8.94099998 0.00019999999 17.038799286 4.70709991 0.00019999999 15.12539959
		 4.70709991 1.52110004 14.44679928 10.12249851 1.52110004 14.44679928 10.12249851 0.00019999999 15.12539959
		 5.37239981 0.0132 13.77619934 5.37239981 1.37059999 12.67929935 9.45709991 1.37059999 12.67929935
		 9.45709991 0.0132 13.77619934 7.41480017 1.14789999 12.0064001083 7.41480017 0.098200001 12.98089981
		 7.41480017 0.00019999999 14.8427 7.41480017 3.29970002 -11.050700188 7.41480017 1.57869995 -8.87989998
		 5.88850021 1.57869995 -9.44880009 6.041200161 3.17980003 -11.60689926 8.78829956 3.17980003 -11.60689926
		 8.94099998 1.57869995 -9.44880009 7.41480017 0.057799999 -8.20129967 5.88850021 0.057799999 -8.77019978
		 8.94099998 0.057799999 -8.77019978 4.70709991 0.057799999 -10.68349934 4.70709991 1.57869995 -11.36219978
		 10.12249851 1.57869995 -11.36219978 10.12249851 0.057799999 -10.68349934 5.37239981 0.070799999 -12.032799721
		 5.37239981 1.42820001 -13.12969971 9.45709991 1.42820001 -13.12969971 9.45709991 0.070799999 -12.032799721
		 7.41480017 1.20560002 -13.80259991 7.41480017 0.1558 -12.82800007 7.41480017 2.48129988 -14.45869923
		 6.041200161 2.60109997 -13.90259933 8.78829956 2.60109997 -13.90259933 9.35719967 2.89050007 -12.73269939
		 5.47230005 2.89050007 -12.73269939 7.41480017 0.057799999 -10.96630001 5.63000011 26.79509926 16.38780022
		 5.61810017 21.82180023 16.97599983 2.94230008 21.82180023 17.99130058 3.019599915 25.58209991 18.052900314
		 2.70609999 19.060499191 16.86090088 2.52600002 17.058300018 15.008099556 5.044700146 19.059099197 15.7553997
		 4.34130001 17.77260017 14.6215992 1.81159997 37.44979858 24.82780075 1.8362 38.71979904 24.60090065
		 1.8362 40.53439713 24.1378994 1.8362 41.90859985 23.11569977 2.32209992 43.18700027 17.29260063
		 2.53066397 43.30610657 19.43094826 1.95500004 43.11529922 21.036600113 1.67299998 34.8465004 25.76449966
		 1.74189997 36.27420044 25.042600632 1.67299998 33.019500732 24.58449936 3.11500001 34.65649414 24.22529984
		 3.11500001 32.82939911 23.1508007 6.29029989 33.4367981 19.55069923 4.55690002 33.068698883 21.3404007
		 4.55690002 34.89569855 22.30949974 6.29029989 35.26390076 20.51980019 3.13319993 38.75099945 23.90410042
		 3.2249999 40.33659744 23.19210052 2.88409996 37.4496994 23.42790031 4.47399998 37.4496994 22.0072002411
		 4.35410023 36.26039886 22.08769989 2.96090007 36.26490021 23.63220024 6.73190022 36.15179825 18.39599991
		 6.73099995 34.43700027 17.48629951 2.22420001 41.65409851 15.11940002 2.25699997 39.97850037 14.073299408
		 2.8743999 34.36660004 11.18019962 2.54229999 36.01720047 11.92079926 2.3757 37.91349411 13.08509922
		 4.50299978 38.84329987 22.25550079 5.72160006 36.48259735 20.63120079 6.095600128 38.020999908 19.20549965
		 4.62989998 35.84469986 13.099699974 4.63399982 37.59000015 14.16459942 6.44649982 36.96689987 15.98009968
		 6.24620008 35.29700089 14.96789932 1.18379998 31.91720009 24.20179939 1.67299998 31.29169846 22.40769958
		 1.11210001 29.69129944 20.3118 2.19199991 28.082099915 18.34479904 4.55579996 29.23089981 16.4477005
		 5.28999996 31.087900162 14.40049934 4.91099977 32.86909866 12.59149933 6.74429989 29.56759834 13.37979984
		 5.26919985 33.9408989 13.95510006 5.63829994 32.87129974 16.085699081;
	setAttr ".vt[664:683]" 5.050899982 31.58950043 18.16460037 4.30509996 34.72219849 12.60419941
		 3.63840008 31.22609901 20.067300797 4.51030111 43.45988083 18.036396027 5.96776676 44.413311 19.27170753
		 4.56487083 44.24438095 19.73767662 6.30700016 38.7356987 16.9843998 5.92780018 40.8844986 18.093999863
		 4.62360001 41.19809723 16.30780029 4.59110022 39.42399979 15.32409954 3.50402999 42.66786575 17.17985153
		 6.084607124 42.74388123 18.7209816 4.83704281 43.17844391 18.98356056 4.44539976 40.45190048 21.76370049
		 5.66470003 39.68920135 19.6189003 3.56660008 42.18330002 20.9708004 2.95180011 41.48899841 22.63240051
		 4.27939987 41.95549774 19.3906002 4.85379982 40.68989944 20.2852993 5.25879478 42.22665405 17.5335598;
	setAttr -s 1364 ".ed";
	setAttr ".ed[0:165]"  0 185 1 185 184 1 184 1 1 1 0 1 184 186 1 186 2 1 2 1 1
		 3 2 1 186 187 1 187 3 1 4 3 1 187 188 1 188 4 1 5 4 1 188 189 1 189 5 1 6 5 1 189 190 1
		 190 6 1 190 191 1 191 7 1 7 6 1 191 185 1 0 7 1 8 192 1 192 193 1 193 9 1 9 8 1 193 194 1
		 194 10 1 10 9 1 11 10 1 194 195 1 195 11 1 12 11 1 195 196 1 196 12 1 13 12 1 196 197 1
		 197 13 1 14 13 1 197 198 1 198 14 1 198 199 1 199 15 1 15 14 1 199 192 1 8 15 1 16 24 1
		 24 252 1 252 17 1 17 16 1 252 25 1 25 18 1 18 17 1 25 26 1 26 19 1 19 18 1 26 27 1
		 27 20 1 20 19 1 27 28 1 28 21 1 21 20 1 28 29 1 29 22 1 22 21 1 29 30 1 30 23 1 23 22 1
		 30 24 1 16 23 1 25 31 1 31 32 1 32 26 1 32 33 1 33 27 1 33 34 1 34 28 1 34 35 1 35 29 1
		 31 40 1 40 36 1 36 32 1 36 37 1 37 33 1 37 38 1 38 34 1 38 39 1 39 35 1 40 41 1 41 37 1
		 41 39 1 41 45 1 45 44 1 44 39 1 42 47 1 47 352 1 352 326 1 326 42 1 45 43 1 43 46 1
		 46 44 1 43 47 1 42 46 1 326 327 1 327 101 1 101 42 1 328 329 1 329 49 1 49 48 1 48 328 1
		 51 59 1 59 58 1 58 50 1 50 51 1 58 60 1 60 52 1 52 50 1 60 61 1 61 53 1 53 52 1 61 62 1
		 62 54 1 54 53 1 62 63 1 63 55 1 55 54 1 63 64 1 64 56 1 56 55 1 64 65 1 65 57 1 57 56 1
		 65 59 1 51 57 1 59 169 1 169 168 1 168 58 1 168 170 1 170 60 1 170 171 1 171 61 1
		 171 172 1 172 62 1 172 173 1 173 63 1 173 174 1 174 64 1 174 175 1 175 65 1 175 169 1
		 67 75 1 75 74 1 74 66 1 66 67 1 74 76 1 76 68 1 68 66 1 76 77 1 77 69 1 69 68 1 77 78 1
		 78 70 1 70 69 1 78 79 1;
	setAttr ".ed[166:331]" 79 71 1 71 70 1 79 80 1 80 72 1 72 71 1 80 81 1 81 73 1
		 73 72 1 81 75 1 67 73 1 75 83 1 83 82 1 82 74 1 82 84 1 84 76 1 84 85 1 85 77 1 85 86 1
		 86 78 1 86 87 1 87 79 1 87 88 1 88 80 1 88 89 1 89 81 1 89 83 1 84 90 1 90 91 1 91 85 1
		 91 92 1 92 86 1 92 93 1 93 87 1 93 94 1 94 88 1 90 95 1 95 97 1 97 91 1 97 98 1 98 92 1
		 98 99 1 99 93 1 99 100 1 100 94 1 95 96 1 96 98 1 48 106 1 106 349 1 349 328 1 95 103 1
		 103 102 1 102 96 1 49 102 1 103 48 1 95 105 1 105 107 1 107 103 1 46 104 1 104 108 1
		 108 44 1 107 106 1 101 104 1 327 349 1 106 101 1 105 108 1 104 107 1 83 110 1 110 109 1
		 109 82 1 89 111 1 111 110 1 110 112 1 112 350 1 350 109 1 111 353 1 353 112 1 24 114 1
		 114 115 1 115 252 1 30 116 1 116 114 1 113 115 1 114 302 1 302 113 1 116 354 1 354 302 1
		 116 119 1 119 355 1 355 354 1 356 330 1 330 117 1 117 118 1 118 356 1 350 356 1 118 109 1
		 119 117 1 330 355 1 84 125 1 125 122 1 122 90 1 124 120 1 120 121 1 121 123 1 123 124 1
		 120 122 1 125 121 1 123 253 1 253 35 1 35 124 1 122 105 1 120 108 1 39 126 1 126 124 1
		 108 126 1 121 128 1 128 127 1 127 123 1 125 129 1 129 128 1 128 117 1 119 127 1 129 118 1
		 129 82 1 127 30 1 30 253 1 100 131 1 131 130 1 130 94 1 357 130 1 131 358 1 358 357 1
		 357 359 1 359 132 1 132 130 1 111 132 1 359 353 1 94 133 1 133 89 1 133 132 1 131 135 1
		 135 331 1 331 358 1 135 137 1 137 136 1 136 134 1 134 135 1 137 100 1 99 136 1 332 138 1
		 138 49 1 329 332 1 96 136 1 102 139 1 139 136 1 138 139 1 138 134 1 134 140 1 140 141 1
		 141 135 1 141 333 1 333 331 1 138 142 1 142 140 1 332 290 1 290 142 1 140 143 1;
	setAttr ".ed[332:497]" 143 144 1 144 141 1 144 291 1 291 333 1 142 145 1 145 143 1
		 290 344 1 344 145 1 143 165 1 165 166 1 166 144 1 166 303 1 303 291 1 145 167 1 167 165 1
		 344 334 1 334 167 1 159 152 1 152 150 1 150 158 1 158 159 1 335 151 1 151 152 1 159 335 1
		 150 153 1 153 160 1 160 158 1 153 336 1 336 161 1 161 160 1 156 154 1 154 150 1 152 156 1
		 155 156 1 151 155 1 154 157 1 157 153 1 157 337 1 337 336 1 163 159 1 158 162 1 162 163 1
		 360 335 1 163 360 1 160 164 1 164 162 1 161 343 1 343 164 1 148 146 1 146 338 1 338 147 1
		 147 148 1 149 342 1 342 338 1 146 149 1 162 146 1 148 163 1 147 360 1 164 149 1 343 342 1
		 165 154 1 156 166 1 155 303 1 167 157 1 334 337 1 169 67 1 66 168 1 68 170 1 69 171 1
		 70 172 1 71 173 1 72 174 1 73 175 1 50 176 1 176 177 1 177 51 1 52 178 1 178 176 1
		 179 178 1 53 179 1 180 179 1 54 180 1 181 180 1 55 181 1 182 181 1 56 182 1 57 183 1
		 183 182 1 177 183 1 9 184 1 185 8 1 10 186 1 11 187 1 12 188 1 13 189 1 14 190 1
		 15 191 1 17 193 1 192 16 1 18 194 1 19 195 1 20 196 1 21 197 1 22 198 1 23 199 1
		 2 201 1 201 200 1 200 1 1 3 202 1 202 201 1 201 204 1 204 203 1 203 200 1 202 205 1
		 205 204 1 203 216 1 216 206 1 206 200 1 202 207 1 207 214 1 214 205 1 216 210 1 210 208 1
		 208 206 1 207 209 1 209 211 1 211 214 1 209 213 1 213 212 1 212 211 1 210 212 1 213 208 1
		 213 6 1 7 208 1 209 5 1 207 4 1 206 0 1 212 215 1 215 214 1 216 215 1 215 204 1 219 226 1
		 226 225 1 225 218 1 218 219 1 220 227 1 227 226 1 219 220 1 226 229 1 229 228 1 228 225 1
		 227 230 1 230 229 1 228 232 1 232 231 1 231 225 1 227 234 1 234 233 1 233 230 1 232 236 1
		 236 235 1 235 231 1 234 238 1 238 237 1 237 233 1 238 240 1;
	setAttr ".ed[498:663]" 240 239 1 239 237 1 236 239 1 240 235 1 240 223 1 223 224 1
		 224 235 1 238 222 1 222 223 1 234 221 1 221 222 1 220 221 1 231 217 1 217 218 1 224 217 1
		 239 241 1 241 233 1 232 241 1 241 229 1 176 218 1 217 177 1 224 183 1 223 182 1 222 181 1
		 221 180 1 220 179 1 219 178 1 245 40 1 31 246 1 246 245 1 243 242 1 242 304 1 304 244 1
		 244 243 1 246 243 1 244 245 1 248 242 1 243 247 1 247 248 1 113 351 1 351 249 1 249 115 1
		 351 248 1 247 249 1 250 246 1 25 250 1 252 251 1 251 250 1 249 251 1 247 250 1 277 292 1
		 292 345 1 345 254 1 254 277 1 256 254 1 345 361 1 361 256 1 339 272 1 272 256 1 361 339 1
		 362 321 1 321 322 1 322 346 1 346 362 1 273 346 1 322 257 1 257 273 1 255 340 1 340 305 1
		 305 258 1 258 255 1 363 340 1 255 259 1 259 363 1 266 267 1 267 259 1 255 266 1 271 261 1
		 261 260 1 260 270 1 270 271 1 268 254 1 256 317 1 317 268 1 279 277 1 268 279 1 261 267 1
		 266 260 1 279 278 1 278 265 1 265 269 1 269 279 1 258 269 1 269 266 1 270 262 1 262 263 1
		 263 271 1 364 323 1 323 321 1 362 364 1 257 272 1 339 273 1 315 314 1 314 323 1 364 315 1
		 365 276 1 276 274 1 274 347 1 347 365 1 274 275 1 275 306 1 306 347 1 47 276 1 365 352 1
		 305 292 1 277 258 1 268 264 1 264 278 1 265 260 1 280 265 1 278 281 1 281 280 1 281 262 1
		 270 280 1 285 284 1 284 275 1 274 285 1 262 282 1 282 283 1 283 263 1 282 284 1 285 283 1
		 348 363 1 259 286 1 286 348 1 341 348 1 286 287 1 287 341 1 307 341 1 287 288 1 288 307 1
		 308 307 1 288 289 1 289 308 1 289 244 1 304 308 1 289 295 1 295 245 1 294 296 1 296 43 1
		 43 293 1 293 294 1 293 245 1 295 294 1 296 276 1 41 293 1 297 296 1 294 298 1 298 297 1
		 299 298 1 295 299 1 298 263 1 283 297 1 299 271 1 300 285 1 276 300 1;
	setAttr ".ed[664:829]" 300 297 1 267 287 1 301 287 1 261 301 1 301 289 1 301 299 1
		 368 309 1 309 366 1 366 322 1 322 368 1 312 311 1 311 310 1 310 313 1 313 312 1 323 310 1
		 310 367 1 367 321 1 313 284 1 282 312 1 275 314 1 315 306 1 313 314 1 309 370 1 370 369 1
		 369 366 1 317 318 1 318 264 1 264 316 1 316 281 1 316 311 1 312 281 1 319 318 1 317 320 1
		 320 319 1 257 319 1 320 272 1 322 324 1 324 319 1 325 316 1 318 325 1 325 324 1 324 311 1
		 367 368 1 368 371 1 371 370 1 369 324 1 371 310 1 311 370 1 372 375 1 375 374 1 374 373 1
		 373 372 1 375 377 1 377 376 1 376 374 1 378 379 1 379 376 1 377 378 1 380 381 1 381 379 1
		 378 380 1 382 383 1 383 381 1 380 382 1 384 385 1 385 383 1 382 384 1 384 387 1 387 386 1
		 386 385 1 387 372 1 373 386 1 388 391 1 391 390 1 390 389 1 389 388 1 391 393 1 393 392 1
		 392 390 1 394 395 1 395 392 1 393 394 1 396 397 1 397 395 1 394 396 1 398 399 1 399 397 1
		 396 398 1 400 401 1 401 399 1 398 400 1 400 403 1 403 402 1 402 401 1 403 388 1 389 402 1
		 404 407 1 407 406 1 406 405 1 405 404 1 407 409 1 409 408 1 408 406 1 409 411 1 411 410 1
		 410 408 1 411 413 1 413 412 1 412 410 1 413 415 1 415 414 1 414 412 1 415 417 1 417 416 1
		 416 414 1 417 419 1 419 418 1 418 416 1 419 404 1 405 418 1 410 421 1 421 420 1 420 408 1
		 412 422 1 422 421 1 414 423 1 423 422 1 416 424 1 424 423 1 421 426 1 426 425 1 425 420 1
		 422 427 1 427 426 1 423 428 1 428 427 1 424 429 1 429 428 1 427 430 1 430 425 1 429 430 1
		 429 432 1 432 431 1 431 430 1 433 326 1 352 434 1 434 433 1 432 436 1 436 435 1 435 431 1
		 436 433 1 434 435 1 433 437 1 437 327 1 328 439 1 439 438 1 438 329 1 440 443 1 443 442 1
		 442 441 1 441 440 1 443 445 1 445 444 1 444 442 1 445 447 1 447 446 1;
	setAttr ".ed[830:995]" 446 444 1 447 449 1 449 448 1 448 446 1 449 451 1 451 450 1
		 450 448 1 451 453 1 453 452 1 452 450 1 453 455 1 455 454 1 454 452 1 455 440 1 441 454 1
		 442 457 1 457 456 1 456 441 1 444 458 1 458 457 1 446 459 1 459 458 1 448 460 1 460 459 1
		 450 461 1 461 460 1 452 462 1 462 461 1 454 463 1 463 462 1 456 463 1 464 467 1 467 466 1
		 466 465 1 465 464 1 467 469 1 469 468 1 468 466 1 469 471 1 471 470 1 470 468 1 471 473 1
		 473 472 1 472 470 1 473 475 1 475 474 1 474 472 1 475 477 1 477 476 1 476 474 1 477 479 1
		 479 478 1 478 476 1 479 464 1 465 478 1 466 481 1 481 480 1 480 465 1 468 482 1 482 481 1
		 470 483 1 483 482 1 472 484 1 484 483 1 474 485 1 485 484 1 476 486 1 486 485 1 478 487 1
		 487 486 1 480 487 1 483 489 1 489 488 1 488 482 1 484 490 1 490 489 1 485 491 1 491 490 1
		 486 492 1 492 491 1 489 494 1 494 493 1 493 488 1 490 495 1 495 494 1 491 496 1 496 495 1
		 492 497 1 497 496 1 495 498 1 498 493 1 349 499 1 499 439 1 498 501 1 501 500 1 500 493 1
		 439 500 1 501 438 1 500 503 1 503 502 1 502 493 1 432 505 1 505 504 1 504 436 1 499 503 1
		 504 437 1 437 499 1 503 504 1 505 502 1 481 507 1 507 506 1 506 480 1 506 508 1 508 487 1
		 507 350 1 112 506 1 353 508 1 406 510 1 510 509 1 509 405 1 509 511 1 511 418 1 302 509 1
		 510 113 1 354 511 1 355 512 1 512 511 1 356 514 1 514 513 1 513 330 1 507 514 1 513 512 1
		 488 516 1 516 515 1 515 482 1 517 520 1 520 519 1 519 518 1 518 517 1 519 515 1 516 518 1
		 517 424 1 424 521 1 521 520 1 502 516 1 505 518 1 517 522 1 522 429 1 522 505 1 520 524 1
		 524 523 1 523 519 1 523 525 1 525 515 1 524 512 1 513 523 1 514 525 1 481 525 1 521 418 1
		 418 524 1 492 527 1 527 526 1 526 497 1 358 526 1 527 357 1 527 528 1;
	setAttr ".ed[996:1161]" 528 359 1 528 508 1 487 529 1 529 492 1 528 529 1 331 530 1
		 530 526 1 530 533 1 533 532 1 532 531 1 531 530 1 532 496 1 497 531 1 438 534 1 534 332 1
		 532 498 1 532 535 1 535 501 1 535 534 1 533 534 1 530 537 1 537 536 1 536 533 1 333 537 1
		 536 538 1 538 534 1 538 290 1 537 540 1 540 539 1 539 536 1 291 540 1 539 541 1 541 538 1
		 541 344 1 540 543 1 543 542 1 542 539 1 303 543 1 542 544 1 544 541 1 544 334 1 545 548 1
		 548 547 1 547 546 1 546 545 1 335 545 1 546 151 1 548 550 1 550 549 1 549 547 1 550 161 1
		 336 549 1 551 546 1 547 552 1 552 551 1 551 155 1 549 553 1 553 552 1 337 553 1 554 555 1
		 555 548 1 545 554 1 360 554 1 555 556 1 556 550 1 556 343 1 557 147 1 338 558 1 558 557 1
		 559 558 1 342 559 1 554 557 1 558 555 1 559 556 1 543 551 1 552 542 1 553 544 1 457 467 1
		 464 456 1 458 469 1 459 471 1 460 473 1 461 475 1 462 477 1 463 479 1 440 561 1 561 560 1
		 560 443 1 560 562 1 562 445 1 563 447 1 562 563 1 564 449 1 563 564 1 565 451 1 564 565 1
		 566 453 1 565 566 1 566 567 1 567 455 1 567 561 1 388 373 1 374 391 1 376 393 1 379 394 1
		 381 396 1 383 398 1 385 400 1 386 403 1 404 389 1 390 407 1 392 409 1 395 411 1 397 413 1
		 399 415 1 401 417 1 402 419 1 375 569 1 569 568 1 568 377 1 568 570 1 570 378 1 569 572 1
		 572 571 1 571 568 1 571 573 1 573 570 1 569 575 1 575 574 1 574 572 1 573 577 1 577 576 1
		 576 570 1 575 579 1 579 578 1 578 574 1 577 581 1 581 580 1 580 576 1 581 583 1 583 582 1
		 582 580 1 579 582 1 583 578 1 579 387 1 384 582 1 382 580 1 380 576 1 372 575 1 577 584 1
		 584 583 1 584 574 1 571 584 1 585 588 1 588 587 1 587 586 1 586 585 1 589 585 1 586 590 1
		 590 589 1 587 592 1 592 591 1 591 586 1 591 593 1 593 590 1 587 595 1;
	setAttr ".ed[1162:1327]" 595 594 1 594 592 1 593 597 1 597 596 1 596 590 1 595 599 1
		 599 598 1 598 594 1 597 601 1 601 600 1 600 596 1 601 603 1 603 602 1 602 600 1 599 602 1
		 603 598 1 599 605 1 605 604 1 604 602 1 604 606 1 606 600 1 606 607 1 607 596 1 607 589 1
		 588 608 1 608 595 1 608 605 1 597 609 1 609 603 1 609 594 1 591 609 1 561 608 1 588 560 1
		 567 605 1 566 604 1 565 606 1 564 607 1 563 589 1 562 585 1 610 611 1 611 420 1 425 610 1
		 612 613 1 613 304 1 242 612 1 610 613 1 612 611 1 248 614 1 614 612 1 510 615 1 615 351 1
		 615 614 1 616 408 1 611 616 1 616 617 1 617 406 1 617 615 1 616 614 1 618 619 1 619 345 1
		 292 618 1 620 361 1 619 620 1 620 621 1 621 339 1 346 623 1 623 622 1 622 362 1 273 624 1
		 624 623 1 625 626 1 626 305 1 340 625 1 363 627 1 627 625 1 628 625 1 627 629 1 629 628 1
		 630 633 1 633 632 1 632 631 1 631 630 1 634 635 1 635 620 1 619 634 1 636 634 1 618 636 1
		 632 628 1 629 631 1 636 639 1 639 638 1 638 637 1 637 636 1 628 639 1 639 626 1 630 641 1
		 641 640 1 640 633 1 622 642 1 642 364 1 621 624 1 642 643 1 643 315 1 347 645 1 645 644 1
		 644 365 1 306 646 1 646 645 1 644 434 1 626 618 1 637 647 1 647 634 1 632 638 1 648 649 1
		 649 637 1 638 648 1 648 633 1 640 649 1 650 645 1 646 651 1 651 650 1 641 653 1 653 652 1
		 652 640 1 653 650 1 651 652 1 348 654 1 654 627 1 341 655 1 655 654 1 307 656 1 656 655 1
		 308 657 1 657 656 1 613 657 1 610 658 1 658 657 1 659 661 1 661 435 1 435 660 1 660 659 1
		 659 658 1 610 661 1 644 660 1 661 430 1 662 663 1 663 659 1 660 662 1 664 658 1 663 664 1
		 662 653 1 641 663 1 630 664 1 665 644 1 650 665 1 662 665 1 655 629 1 666 631 1 655 666 1
		 657 666 1 664 666 1 667 623 1 623 669 1 669 668 1 668 667 1 670 673 1;
	setAttr ".ed[1328:1363]" 673 672 1 672 671 1 671 670 1 622 674 1 674 672 1 672 642 1
		 670 652 1 651 673 1 643 646 1 643 673 1 669 676 1 676 675 1 675 668 1 647 677 1 677 635 1
		 649 678 1 678 647 1 649 670 1 671 678 1 679 680 1 680 635 1 677 679 1 621 680 1 679 624 1
		 679 681 1 681 623 1 682 677 1 678 682 1 671 681 1 681 682 1 667 674 1 675 683 1 683 667 1
		 681 676 1 675 671 1 672 683 1;
	setAttr -s 684 ".n";
	setAttr ".n[0:165]" -type "float3"  1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20;
	setAttr ".n[166:331]" -type "float3"  1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20;
	setAttr ".n[332:497]" -type "float3"  1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20;
	setAttr ".n[498:663]" -type "float3"  1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20;
	setAttr ".n[664:683]" -type "float3"  1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20;
	setAttr -s 682 -ch 2728 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 2 1 0 3
		f 4 -3 4 5 6
		mu 0 4 3 0 4 5
		f 4 7 -6 8 9
		mu 0 4 6 5 4 7
		f 4 10 -10 11 12
		mu 0 4 8 6 7 9
		f 4 13 -13 14 15
		mu 0 4 10 8 9 11
		f 4 16 -16 17 18
		mu 0 4 12 10 11 13
		f 4 -19 19 20 21
		mu 0 4 12 13 14 15
		f 4 -21 22 -1 23
		mu 0 4 15 14 16 17
		f 4 24 25 26 27
		mu 0 4 20 19 18 21
		f 4 -27 28 29 30
		mu 0 4 21 18 22 23
		f 4 31 -30 32 33
		mu 0 4 24 23 22 25
		f 4 34 -34 35 36
		mu 0 4 26 24 25 27
		f 4 37 -37 38 39
		mu 0 4 28 26 27 29
		f 4 40 -40 41 42
		mu 0 4 30 28 29 31
		f 4 -43 43 44 45
		mu 0 4 30 31 32 33
		f 4 -45 46 -25 47
		mu 0 4 33 32 34 35
		f 4 48 49 50 51
		mu 0 4 38 37 36 39
		f 4 -51 52 53 54
		mu 0 4 39 36 40 41
		f 4 -54 55 56 57
		mu 0 4 41 40 42 43
		f 4 -57 58 59 60
		mu 0 4 43 42 44 45
		f 4 -60 61 62 63
		mu 0 4 45 44 46 47
		f 4 -63 64 65 66
		mu 0 4 47 46 48 49
		f 4 -66 67 68 69
		mu 0 4 49 48 50 51
		f 4 -69 70 -49 71
		mu 0 4 51 50 52 53
		f 4 72 73 74 -56
		mu 0 4 40 55 54 42
		f 4 -75 75 76 -59
		mu 0 4 42 54 56 44
		f 4 -77 77 78 -62
		mu 0 4 44 56 57 46
		f 4 -79 79 80 -65
		mu 0 4 46 57 58 48
		f 4 81 82 83 -74
		mu 0 4 55 60 59 54
		f 4 -84 84 85 -76
		mu 0 4 54 59 61 56
		f 4 -86 86 87 -78
		mu 0 4 56 61 62 57
		f 4 -88 88 89 -80
		mu 0 4 57 62 63 58
		f 4 -83 90 91 -85
		mu 0 4 59 60 64 61
		f 4 -92 92 -89 -87
		mu 0 4 61 64 63 62
		f 4 -93 93 94 95
		mu 0 4 67 66 65 68
		f 4 96 97 98 99
		mu 0 4 71 70 69 72
		f 4 -95 100 101 102
		mu 0 4 68 65 73 74
		f 4 -102 103 -97 104
		mu 0 4 74 73 70 71
		f 4 105 106 107 -100
		mu 0 4 72 76 75 71
		f 4 108 109 110 111
		mu 0 4 79 78 77 80
		f 4 112 113 114 115
		mu 0 4 83 82 81 84
		f 4 -115 116 117 118
		mu 0 4 84 81 85 86
		f 4 -118 119 120 121
		mu 0 4 86 85 87 88
		f 4 -121 122 123 124
		mu 0 4 88 87 89 90
		f 4 -124 125 126 127
		mu 0 4 90 89 91 92
		f 4 -127 128 129 130
		mu 0 4 92 91 93 94
		f 4 -130 131 132 133
		mu 0 4 94 93 95 96
		f 4 -133 134 -113 135
		mu 0 4 96 95 97 98
		f 4 -114 136 137 138
		mu 0 4 81 82 99 100
		f 4 -117 -139 139 140
		mu 0 4 85 81 100 101
		f 4 -141 141 142 -120
		mu 0 4 85 101 102 87
		f 4 -143 143 144 -123
		mu 0 4 87 102 103 89
		f 4 -145 145 146 -126
		mu 0 4 89 103 104 91
		f 4 -147 147 148 -129
		mu 0 4 91 104 105 93
		f 4 -132 -149 149 150
		mu 0 4 95 93 105 106
		f 4 -135 -151 151 -137
		mu 0 4 97 95 106 107
		f 4 152 153 154 155
		mu 0 4 110 109 108 111
		f 4 -155 156 157 158
		mu 0 4 111 108 112 113
		f 4 -158 159 160 161
		mu 0 4 113 112 114 115
		f 4 -161 162 163 164
		mu 0 4 115 114 116 117
		f 4 -164 165 166 167
		mu 0 4 117 116 118 119
		f 4 -167 168 169 170
		mu 0 4 119 118 120 121
		f 4 -170 171 172 173
		mu 0 4 121 120 122 123
		f 4 -173 174 -153 175
		mu 0 4 123 122 124 125
		f 4 176 177 178 -154
		mu 0 4 109 127 126 108
		f 4 -179 179 180 -157
		mu 0 4 108 126 128 112
		f 4 -181 181 182 -160
		mu 0 4 112 128 129 114
		f 4 -183 183 184 -163
		mu 0 4 114 129 130 116
		f 4 -185 185 186 -166
		mu 0 4 116 130 131 118
		f 4 -187 187 188 -169
		mu 0 4 118 131 132 120
		f 4 -189 189 190 -172
		mu 0 4 120 132 133 122
		f 4 -191 191 -177 -175
		mu 0 4 122 133 134 124
		f 4 192 193 194 -182
		mu 0 4 128 136 135 129
		f 4 -195 195 196 -184
		mu 0 4 129 135 137 130
		f 4 -197 197 198 -186
		mu 0 4 130 137 138 131
		f 4 -199 199 200 -188
		mu 0 4 131 138 139 132
		f 4 -194 201 202 203
		mu 0 4 135 136 140 141
		f 4 -196 -204 204 205
		mu 0 4 137 135 141 142
		f 4 -206 206 207 -198
		mu 0 4 137 142 143 138
		f 4 -208 208 209 -200
		mu 0 4 138 143 144 139
		f 4 -205 -203 210 211
		mu 0 4 142 141 140 145
		f 4 212 213 214 -112
		mu 0 4 80 147 146 79
		f 4 -211 215 216 217
		mu 0 4 150 149 148 151
		f 4 218 -217 219 -111
		mu 0 4 77 151 148 80
		f 4 220 221 222 -216
		mu 0 4 149 153 152 148
		f 4 223 224 225 -103
		mu 0 4 74 155 154 68
		f 4 226 -213 -220 -223
		mu 0 4 152 147 80 148
		f 4 -224 -105 -108 227
		mu 0 4 155 74 71 75
		f 4 -107 228 -214 229
		mu 0 4 75 76 146 147
		f 4 -222 230 -225 231
		mu 0 4 152 153 154 155
		f 4 -227 -232 -228 -230
		mu 0 4 147 152 155 75
		f 4 232 233 234 -178
		mu 0 4 158 157 156 159
		f 4 235 236 -233 -192
		mu 0 4 161 160 157 158
		f 4 237 238 239 -234
		mu 0 4 157 163 162 156
		f 4 240 241 -238 -237
		mu 0 4 160 164 163 157
		f 4 242 243 244 -50
		mu 0 4 167 166 165 168
		f 4 -71 245 246 -243
		mu 0 4 167 170 169 166
		f 4 247 -244 248 249
		mu 0 4 171 165 166 172
		f 4 -247 250 251 -249
		mu 0 4 166 169 173 172
		f 4 -251 252 253 254
		mu 0 4 173 169 174 175
		f 4 255 256 257 258
		mu 0 4 178 177 176 179
		f 4 259 -259 260 -240
		mu 0 4 162 178 179 156
		f 4 -254 261 -257 262
		mu 0 4 175 174 176 177
		f 4 263 264 265 -193
		mu 0 4 182 181 180 183
		f 4 266 267 268 269
		mu 0 4 186 185 184 187
		f 4 270 -265 271 -268
		mu 0 4 185 180 181 184
		f 4 272 273 274 -270
		mu 0 4 187 189 188 186
		f 4 -266 275 -221 -202
		mu 0 4 183 180 153 149
		f 4 276 -231 -276 -271
		mu 0 4 185 154 153 180
		f 4 -90 277 278 -275
		mu 0 4 188 67 190 186
		f 4 -226 279 -278 -96
		mu 0 4 68 154 190 67
		f 4 -267 -279 -280 -277
		mu 0 4 185 186 190 154
		f 4 -269 280 281 282
		mu 0 4 187 184 191 192
		f 4 -272 283 284 -281
		mu 0 4 184 181 193 191
		f 4 -282 285 -262 286
		mu 0 4 192 191 176 174
		f 4 -285 287 -258 -286
		mu 0 4 191 193 179 176
		f 4 288 -235 -261 -288
		mu 0 4 193 159 156 179
		f 4 -284 -264 -180 -289
		mu 0 4 193 181 182 159
		f 4 -273 -283 289 290
		mu 0 4 189 187 192 170
		f 4 -253 -246 -290 -287
		mu 0 4 174 169 170 192
		f 4 291 292 293 -210
		mu 0 4 196 195 194 197
		f 4 294 -293 295 296
		mu 0 4 198 194 195 199
		f 4 -295 297 298 299
		mu 0 4 194 198 200 201
		f 4 300 -299 301 -241
		mu 0 4 160 201 200 164
		f 4 -201 302 303 -190
		mu 0 4 132 139 202 133
		f 4 -236 -304 304 -301
		mu 0 4 160 161 203 201
		f 4 -300 -305 -303 -294
		mu 0 4 194 201 203 197
		f 4 -296 305 306 307
		mu 0 4 199 195 204 205
		f 4 308 309 310 311
		mu 0 4 204 207 206 208
		f 4 -310 312 -209 313
		mu 0 4 210 209 144 143
		f 4 -309 -306 -292 -313
		mu 0 4 207 204 195 196
		f 4 314 315 -110 316
		mu 0 4 212 211 77 78
		f 4 -207 -212 317 -314
		mu 0 4 143 142 145 210
		f 4 -218 318 319 -318
		mu 0 4 150 151 213 206
		f 4 -316 320 -319 -219
		mu 0 4 77 211 213 151
		f 4 -311 -320 -321 321
		mu 0 4 208 206 213 211
		f 4 322 323 324 -312
		mu 0 4 216 215 214 217
		f 4 -325 325 326 -307
		mu 0 4 217 214 218 219
		f 4 327 328 -323 -322
		mu 0 4 221 220 215 216
		f 4 329 330 -328 -315
		mu 0 4 223 222 220 221
		f 4 331 332 333 -324
		mu 0 4 215 225 224 214
		f 4 -334 334 335 -326
		mu 0 4 214 224 226 218
		f 4 336 337 -332 -329
		mu 0 4 220 227 225 215
		f 4 338 339 -337 -331
		mu 0 4 222 228 227 220
		f 4 -333 340 341 342
		mu 0 4 224 225 229 230
		f 4 -335 -343 343 344
		mu 0 4 226 224 230 231
		f 4 -338 345 346 -341
		mu 0 4 225 227 232 229
		f 4 -340 347 348 -346
		mu 0 4 227 228 233 232
		f 4 349 350 351 352
		mu 0 4 236 235 234 237
		f 4 353 354 -350 355
		mu 0 4 239 238 235 236
		f 4 -352 356 357 358
		mu 0 4 237 234 240 241
		f 4 -358 359 360 361
		mu 0 4 241 240 242 243
		f 4 362 363 -351 364
		mu 0 4 245 244 234 235
		f 4 365 -365 -355 366
		mu 0 4 246 245 235 238
		f 4 367 368 -357 -364
		mu 0 4 244 247 240 234
		f 4 369 370 -360 -369
		mu 0 4 247 248 242 240
		f 4 371 -353 372 373
		mu 0 4 249 236 237 250
		f 4 374 -356 -372 375
		mu 0 4 251 239 236 249
		f 4 -373 -359 376 377
		mu 0 4 250 237 241 252
		f 4 -377 -362 378 379
		mu 0 4 252 241 243 253
		f 4 380 381 382 383
		mu 0 4 256 255 254 257
		f 4 384 385 -382 386
		mu 0 4 259 258 254 255
		f 4 -374 387 -381 388
		mu 0 4 249 250 255 256
		f 4 -376 -389 -384 389
		mu 0 4 251 249 256 257
		f 4 -378 390 -387 -388
		mu 0 4 250 252 259 255
		f 4 -391 -380 391 -385
		mu 0 4 259 252 253 258
		f 4 -342 392 -363 393
		mu 0 4 230 229 244 245
		f 4 -344 -394 -366 394
		mu 0 4 231 230 245 246
		f 4 -347 395 -368 -393
		mu 0 4 229 232 247 244
		f 4 -349 396 -370 -396
		mu 0 4 232 233 248 247
		f 4 -138 397 -156 398
		mu 0 4 100 99 110 111
		f 4 -140 -399 -159 399
		mu 0 4 101 100 111 113
		f 4 400 -142 -400 -162
		mu 0 4 115 102 101 113
		f 4 401 -144 -401 -165
		mu 0 4 117 103 102 115
		f 4 402 -146 -402 -168
		mu 0 4 119 104 103 117
		f 4 403 -148 -403 -171
		mu 0 4 121 105 104 119
		f 4 -150 -404 -174 404
		mu 0 4 106 105 121 123
		f 4 -152 -405 -176 -398
		mu 0 4 107 106 123 125
		f 4 405 406 407 -116
		mu 0 4 84 261 260 83
		f 4 408 409 -406 -119
		mu 0 4 86 262 261 84
		f 4 410 -409 -122 411
		mu 0 4 263 262 86 88
		f 4 412 -412 -125 413
		mu 0 4 264 263 88 90
		f 4 414 -414 -128 415
		mu 0 4 265 264 90 92
		f 4 416 -416 -131 417
		mu 0 4 266 265 92 94
		f 4 418 419 -418 -134
		mu 0 4 96 267 266 94
		f 4 -408 420 -419 -136
		mu 0 4 98 268 267 96
		f 4 421 -2 422 -28
		mu 0 4 21 0 1 20
		f 4 423 -5 -422 -31
		mu 0 4 23 4 0 21
		f 4 -9 -424 -32 424
		mu 0 4 7 4 23 24
		f 4 -12 -425 -35 425
		mu 0 4 9 7 24 26
		f 4 -15 -426 -38 426
		mu 0 4 11 9 26 28
		f 4 -18 -427 -41 427
		mu 0 4 13 11 28 30
		f 4 428 -20 -428 -46
		mu 0 4 33 14 13 30
		f 4 -423 -23 -429 -48
		mu 0 4 35 16 14 33
		f 4 429 -26 430 -52
		mu 0 4 39 18 19 38
		f 4 431 -29 -430 -55
		mu 0 4 41 22 18 39
		f 4 -33 -432 -58 432
		mu 0 4 25 22 41 43
		f 4 -36 -433 -61 433
		mu 0 4 27 25 43 45
		f 4 -39 -434 -64 434
		mu 0 4 29 27 45 47
		f 4 -42 -435 -67 435
		mu 0 4 31 29 47 49
		f 4 436 -44 -436 -70
		mu 0 4 51 32 31 49
		f 4 -431 -47 -437 -72
		mu 0 4 53 34 32 51
		f 4 437 438 439 -7
		mu 0 4 5 270 269 3
		f 4 440 441 -438 -8
		mu 0 4 6 271 270 5
		f 4 442 443 444 -439
		mu 0 4 270 273 272 269
		f 4 445 446 -443 -442
		mu 0 4 271 274 273 270
		f 4 447 448 449 -445
		mu 0 4 272 276 275 269
		f 4 450 451 452 -446
		mu 0 4 271 278 277 274
		f 4 453 454 455 -449
		mu 0 4 281 280 279 282
		f 4 456 457 458 -452
		mu 0 4 278 284 283 277
		f 4 -458 459 460 461
		mu 0 4 283 284 285 286
		f 4 462 -461 463 -455
		mu 0 4 280 286 285 279
		f 4 464 -22 465 -464
		mu 0 4 285 12 15 279
		f 4 -460 466 -17 -465
		mu 0 4 285 284 10 12
		f 4 -457 467 -14 -467
		mu 0 4 284 278 8 10
		f 4 -451 -441 -11 -468
		mu 0 4 278 271 6 8
		f 4 468 -4 -440 -450
		mu 0 4 275 2 3 269
		f 4 -466 -24 -469 -456
		mu 0 4 279 15 17 282
		f 4 -462 469 470 -459
		mu 0 4 289 288 287 290
		f 4 -454 471 -470 -463
		mu 0 4 292 291 287 288
		f 4 -453 -471 472 -447
		mu 0 4 293 290 287 294
		f 4 -472 -448 -444 -473
		mu 0 4 287 291 295 294
		f 4 473 474 475 476
		mu 0 4 298 297 296 299
		f 4 477 478 -474 479
		mu 0 4 301 300 297 298
		f 4 480 481 482 -475
		mu 0 4 297 303 302 296
		f 4 483 484 -481 -479
		mu 0 4 300 304 303 297
		f 4 485 486 487 -483
		mu 0 4 302 306 305 296
		f 4 488 489 490 -484
		mu 0 4 300 308 307 304
		f 4 491 492 493 -487
		mu 0 4 311 310 309 312
		f 4 494 495 496 -490
		mu 0 4 308 314 313 307
		f 4 -496 497 498 499
		mu 0 4 313 314 315 316
		f 4 500 -499 501 -493
		mu 0 4 310 316 315 309
		f 4 502 503 504 -502
		mu 0 4 315 318 317 309
		f 4 -498 505 506 -503
		mu 0 4 315 314 319 318
		f 4 -495 507 508 -506
		mu 0 4 314 308 320 319
		f 4 -489 -478 509 -508
		mu 0 4 308 300 301 320
		f 4 510 511 -476 -488
		mu 0 4 305 321 299 296
		f 4 -505 512 -511 -494
		mu 0 4 309 317 322 312
		f 4 -500 513 514 -497
		mu 0 4 325 324 323 326
		f 4 -492 515 -514 -501
		mu 0 4 328 327 323 324
		f 4 -491 -515 516 -485
		mu 0 4 329 326 323 330
		f 4 -516 -486 -482 -517
		mu 0 4 323 327 331 330
		f 4 517 -512 518 -407
		mu 0 4 261 299 321 260
		f 4 -519 -513 519 -421
		mu 0 4 268 322 317 267
		f 4 -520 -504 520 -420
		mu 0 4 267 317 318 266
		f 4 -521 -507 521 -417
		mu 0 4 266 318 319 265
		f 4 -522 -509 522 -415
		mu 0 4 265 319 320 264
		f 4 -523 -510 523 -413
		mu 0 4 264 320 301 263
		f 4 -524 -480 524 -411
		mu 0 4 263 301 298 262
		f 4 -525 -477 -518 -410
		mu 0 4 262 298 299 261
		f 4 525 -82 526 527
		mu 0 4 334 333 332 335
		f 4 528 529 530 531
		mu 0 4 338 337 336 339
		f 4 532 -532 533 -528
		mu 0 4 335 338 339 334
		f 4 534 -529 535 536
		mu 0 4 340 337 338 341
		f 4 -248 537 538 539
		mu 0 4 165 171 342 343
		f 4 -539 540 -537 541
		mu 0 4 343 342 340 341
		f 4 542 -527 -73 543
		mu 0 4 344 335 332 345
		f 4 544 545 -544 -53
		mu 0 4 168 346 344 345
		f 4 -245 -540 546 -545
		mu 0 4 168 165 343 346
		f 4 -547 -542 547 -546
		mu 0 4 346 343 341 344
		f 4 -536 -533 -543 -548
		mu 0 4 341 338 335 344
		f 4 -291 -68 -81 -274
		mu 0 4 347 50 48 58
		f 4 548 549 550 551
		mu 0 4 350 349 348 351
		f 4 552 -551 553 554
		mu 0 4 352 351 348 353
		f 4 555 556 -555 557
		mu 0 4 355 354 352 353
		f 4 558 559 560 561
		mu 0 4 358 357 356 359
		f 4 562 -561 563 564
		mu 0 4 362 361 360 363
		f 4 565 566 567 568
		mu 0 4 366 365 364 367
		f 4 569 -566 570 571
		mu 0 4 368 365 366 369
		f 4 572 573 -571 574
		mu 0 4 371 370 369 366
		f 4 575 576 577 578
		mu 0 4 374 373 372 375
		f 4 579 -553 580 581
		mu 0 4 376 351 352 377
		f 4 582 -552 -580 583
		mu 0 4 378 350 351 376
		f 4 -577 584 -573 585
		mu 0 4 372 373 370 371
		f 4 586 587 588 589
		mu 0 4 378 380 379 381
		f 4 -575 -569 590 591
		mu 0 4 371 366 367 381
		f 4 592 593 594 -579
		mu 0 4 375 383 382 374
		f 4 595 596 -559 597
		mu 0 4 385 384 357 358
		f 4 -565 598 -556 599
		mu 0 4 362 363 354 355
		f 4 600 601 -596 602
		mu 0 4 387 386 384 385
		f 4 603 604 605 606
		mu 0 4 390 389 388 391
		f 4 -606 607 608 609
		mu 0 4 391 388 392 393
		f 4 -98 610 -604 611
		mu 0 4 69 70 389 390
		f 4 -568 612 -549 613
		mu 0 4 367 364 349 350
		f 4 -591 -614 -583 -590
		mu 0 4 381 367 350 378
		f 4 614 615 -587 -584
		mu 0 4 376 394 380 378
		f 4 -586 -592 -589 616
		mu 0 4 372 371 381 379
		f 4 617 -588 618 619
		mu 0 4 395 379 380 396
		f 4 620 -593 621 -620
		mu 0 4 396 383 375 395
		f 4 -578 -617 -618 -622
		mu 0 4 375 372 379 395
		f 4 622 623 -608 624
		mu 0 4 398 397 392 388
		f 4 -594 625 626 627
		mu 0 4 382 383 399 400
		f 4 -627 628 -623 629
		mu 0 4 400 399 397 398
		f 4 630 -572 631 632
		mu 0 4 401 368 369 402
		f 4 633 -633 634 635
		mu 0 4 403 401 402 404
		f 4 636 -636 637 638
		mu 0 4 405 403 404 406
		f 4 639 -639 640 641
		mu 0 4 407 405 406 408
		f 4 642 -531 643 -642
		mu 0 4 408 339 336 407
		f 4 -534 -643 644 645
		mu 0 4 334 339 408 409
		f 4 646 647 648 649
		mu 0 4 411 410 73 412
		f 4 -650 650 -646 651
		mu 0 4 411 412 334 409
		f 4 -611 -104 -648 652
		mu 0 4 389 70 73 410
		f 4 -94 653 -649 -101
		mu 0 4 65 66 412 73
		f 4 -526 -651 -654 -91
		mu 0 4 333 334 412 66
		f 4 654 -647 655 656
		mu 0 4 413 410 411 414
		f 4 657 -656 -652 658
		mu 0 4 415 414 411 409
		f 4 659 -628 660 -657
		mu 0 4 414 382 400 413
		f 4 661 -595 -660 -658
		mu 0 4 415 374 382 414
		f 4 662 -625 -605 663
		mu 0 4 416 398 388 389
		f 4 664 -661 -630 -663
		mu 0 4 416 413 400 398
		f 4 -664 -653 -655 -665
		mu 0 4 416 389 410 413
		f 4 665 -635 -632 -574
		mu 0 4 370 404 402 369
		f 4 666 -666 -585 667
		mu 0 4 417 404 370 373
		f 4 668 -641 -638 -667
		mu 0 4 417 408 406 404
		f 4 669 -659 -645 -669
		mu 0 4 417 415 409 408
		f 4 -668 -576 -662 -670
		mu 0 4 417 373 374 415
		f 4 670 671 672 673
		mu 0 4 432 418 429 356
		f 4 674 675 676 677
		mu 0 4 421 419 420 422
		f 4 -597 678 679 680
		mu 0 4 357 384 420 431
		f 4 681 -629 682 -678
		mu 0 4 422 397 399 421
		f 4 -609 683 -601 684
		mu 0 4 393 392 386 387
		f 4 -684 -624 -682 685
		mu 0 4 386 392 397 422
		f 4 -602 -686 -677 -679
		mu 0 4 384 386 422 420
		f 4 686 687 688 -672
		mu 0 4 418 434 433 430
		f 4 689 690 -615 -582
		mu 0 4 377 424 394 376
		f 4 -619 -616 691 692
		mu 0 4 396 380 394 425
		f 4 693 -675 694 -693
		mu 0 4 425 419 421 396
		f 4 -621 -695 -683 -626
		mu 0 4 383 396 421 399
		f 4 695 -690 696 697
		mu 0 4 426 424 377 427
		f 4 -599 698 -698 699
		mu 0 4 354 363 426 427
		f 4 -557 -700 -697 -581
		mu 0 4 352 354 427 377
		f 4 -699 -564 700 701
		mu 0 4 426 363 360 423
		f 4 702 -692 -691 703
		mu 0 4 428 425 394 424
		f 4 704 705 -694 -703
		mu 0 4 428 423 419 425
		f 4 -704 -696 -702 -705
		mu 0 4 428 424 426 423
		f 4 -674 -560 -681 706
		mu 0 4 432 356 357 431
		f 4 -671 707 708 -687
		mu 0 4 418 432 435 434
		f 4 -689 709 -701 -673
		mu 0 4 430 433 423 360
		f 4 -709 710 -676 711
		mu 0 4 434 435 420 419
		f 4 -688 -712 -706 -710
		mu 0 4 433 434 419 423
		f 4 -711 -708 -707 -680
		mu 0 4 420 435 432 431
		f 4 712 713 714 715
		mu 0 4 436 439 438 437
		f 4 716 717 718 -714
		mu 0 4 439 441 440 438
		f 4 719 720 -718 721
		mu 0 4 442 443 440 441
		f 4 722 723 -720 724
		mu 0 4 444 445 443 442
		f 4 725 726 -723 727
		mu 0 4 446 447 445 444
		f 4 728 729 -726 730
		mu 0 4 448 449 447 446
		f 4 731 732 733 -729
		mu 0 4 448 451 450 449
		f 4 734 -716 735 -733
		mu 0 4 451 453 452 450
		f 4 736 737 738 739
		mu 0 4 454 457 456 455
		f 4 740 741 742 -738
		mu 0 4 457 459 458 456
		f 4 743 744 -742 745
		mu 0 4 460 461 458 459
		f 4 746 747 -744 748
		mu 0 4 462 463 461 460
		f 4 749 750 -747 751
		mu 0 4 464 465 463 462
		f 4 752 753 -750 754
		mu 0 4 466 467 465 464
		f 4 755 756 757 -753
		mu 0 4 466 469 468 467
		f 4 758 -740 759 -757
		mu 0 4 469 471 470 468
		f 4 760 761 762 763
		mu 0 4 472 475 474 473
		f 4 764 765 766 -762
		mu 0 4 475 477 476 474
		f 4 767 768 769 -766
		mu 0 4 477 479 478 476
		f 4 770 771 772 -769
		mu 0 4 479 481 480 478
		f 4 773 774 775 -772
		mu 0 4 481 483 482 480
		f 4 776 777 778 -775
		mu 0 4 483 485 484 482
		f 4 779 780 781 -778
		mu 0 4 485 487 486 484
		f 4 782 -764 783 -781
		mu 0 4 487 489 488 486
		f 4 -770 784 785 786
		mu 0 4 476 478 491 490
		f 4 -773 787 788 -785
		mu 0 4 478 480 492 491
		f 4 -776 789 790 -788
		mu 0 4 480 482 493 492
		f 4 -779 791 792 -790
		mu 0 4 482 484 494 493
		f 4 -786 793 794 795
		mu 0 4 490 491 496 495
		f 4 -789 796 797 -794
		mu 0 4 491 492 497 496
		f 4 -791 798 799 -797
		mu 0 4 492 493 498 497
		f 4 -793 800 801 -799
		mu 0 4 493 494 499 498
		f 4 -798 802 803 -795
		mu 0 4 496 497 500 495
		f 4 -800 -802 804 -803
		mu 0 4 497 498 499 500
		f 4 805 806 807 -805
		mu 0 4 501 504 503 502
		f 4 808 -99 809 810
		mu 0 4 505 72 69 506
		f 4 811 812 813 -807
		mu 0 4 504 510 509 503
		f 4 814 -811 815 -813
		mu 0 4 510 505 506 509
		f 4 -809 816 817 -106
		mu 0 4 72 505 512 76
		f 4 818 819 820 -109
		mu 0 4 79 516 515 78
		f 4 821 822 823 824
		mu 0 4 517 520 519 518
		f 4 825 826 827 -823
		mu 0 4 520 522 521 519
		f 4 828 829 830 -827
		mu 0 4 522 524 523 521
		f 4 831 832 833 -830
		mu 0 4 524 526 525 523
		f 4 834 835 836 -833
		mu 0 4 526 528 527 525
		f 4 837 838 839 -836
		mu 0 4 528 530 529 527
		f 4 840 841 842 -839
		mu 0 4 530 532 531 529
		f 4 843 -825 844 -842
		mu 0 4 532 534 533 531
		f 4 845 846 847 -824
		mu 0 4 519 536 535 518
		f 4 848 849 -846 -828
		mu 0 4 521 537 536 519
		f 4 -831 850 851 -849
		mu 0 4 521 523 538 537
		f 4 -834 852 853 -851
		mu 0 4 523 525 539 538
		f 4 -837 854 855 -853
		mu 0 4 525 527 540 539
		f 4 -840 856 857 -855
		mu 0 4 527 529 541 540
		f 4 858 859 -857 -843
		mu 0 4 531 542 541 529
		f 4 -848 860 -859 -845
		mu 0 4 533 543 542 531
		f 4 861 862 863 864
		mu 0 4 544 547 546 545
		f 4 865 866 867 -863
		mu 0 4 547 549 548 546
		f 4 868 869 870 -867
		mu 0 4 549 551 550 548
		f 4 871 872 873 -870
		mu 0 4 551 553 552 550
		f 4 874 875 876 -873
		mu 0 4 553 555 554 552
		f 4 877 878 879 -876
		mu 0 4 555 557 556 554
		f 4 880 881 882 -879
		mu 0 4 557 559 558 556
		f 4 883 -865 884 -882
		mu 0 4 559 561 560 558
		f 4 -864 885 886 887
		mu 0 4 545 546 563 562
		f 4 -868 888 889 -886
		mu 0 4 546 548 564 563
		f 4 -871 890 891 -889
		mu 0 4 548 550 565 564
		f 4 -874 892 893 -891
		mu 0 4 550 552 566 565
		f 4 -877 894 895 -893
		mu 0 4 552 554 567 566
		f 4 -880 896 897 -895
		mu 0 4 554 556 568 567
		f 4 -883 898 899 -897
		mu 0 4 556 558 569 568
		f 4 -885 -888 900 -899
		mu 0 4 558 560 570 569
		f 4 -892 901 902 903
		mu 0 4 564 565 572 571
		f 4 -894 904 905 -902
		mu 0 4 565 566 573 572
		f 4 -896 906 907 -905
		mu 0 4 566 567 574 573
		f 4 -898 908 909 -907
		mu 0 4 567 568 575 574
		f 4 910 911 912 -903
		mu 0 4 572 577 576 571
		f 4 913 914 -911 -906
		mu 0 4 573 578 577 572
		f 4 -908 915 916 -914
		mu 0 4 573 574 579 578
		f 4 -910 917 918 -916
		mu 0 4 574 575 580 579
		f 4 919 920 -912 -915
		mu 0 4 578 581 576 577
		f 4 -819 -215 921 922
		mu 0 4 516 79 146 582
		f 4 923 924 925 -921
		mu 0 4 584 587 586 585
		f 4 -820 926 -925 927
		mu 0 4 515 516 586 587
		f 4 -926 928 929 930
		mu 0 4 585 586 589 588
		f 4 -812 931 932 933
		mu 0 4 510 504 591 590
		f 4 -929 -927 -923 934
		mu 0 4 589 586 516 582
		f 4 935 -817 -815 -934
		mu 0 4 590 512 505 510
		f 4 936 -922 -229 -818
		mu 0 4 512 582 146 76
		f 4 937 -933 938 -930
		mu 0 4 589 590 591 588
		f 4 -937 -936 -938 -935
		mu 0 4 582 512 590 589
		f 4 -887 939 940 941
		mu 0 4 592 595 594 593
		f 4 -901 -942 942 943
		mu 0 4 596 592 593 597
		f 4 -941 944 -239 945
		mu 0 4 593 594 599 598
		f 4 -943 -946 -242 946
		mu 0 4 597 593 598 600
		f 4 -763 947 948 949
		mu 0 4 601 604 603 602
		f 4 -950 950 951 -784
		mu 0 4 601 602 606 605
		f 4 -250 952 -949 953
		mu 0 4 607 608 602 603
		f 4 -953 -252 954 -951
		mu 0 4 602 608 609 606
		f 4 -255 955 956 -955
		mu 0 4 609 611 610 606
		f 4 957 958 959 -256
		mu 0 4 612 615 614 613
		f 4 -945 960 -958 -260
		mu 0 4 599 594 615 612
		f 4 -263 -960 961 -956
		mu 0 4 611 613 614 610
		f 4 -904 962 963 964
		mu 0 4 616 619 618 617
		f 4 965 966 967 968
		mu 0 4 620 623 622 621
		f 4 -968 969 -964 970
		mu 0 4 621 622 617 618
		f 4 -966 971 972 973
		mu 0 4 623 620 625 624
		f 4 -913 -931 974 -963
		mu 0 4 619 585 588 618
		f 4 -971 -975 -939 975
		mu 0 4 621 618 588 591
		f 4 -972 976 977 -801
		mu 0 4 625 620 626 501
		f 4 -806 -978 978 -932
		mu 0 4 504 501 626 591
		f 4 -976 -979 -977 -969
		mu 0 4 621 591 626 620
		f 4 979 980 981 -967
		mu 0 4 623 628 627 622
		f 4 -982 982 983 -970
		mu 0 4 622 627 629 617
		f 4 984 -962 985 -981
		mu 0 4 628 610 614 627
		f 4 -986 -959 986 -983
		mu 0 4 627 614 615 629
		f 4 -987 -961 -940 987
		mu 0 4 629 615 594 595
		f 4 -988 -890 -965 -984
		mu 0 4 629 595 616 617
		f 4 988 989 -980 -974
		mu 0 4 624 605 628 623
		f 4 -985 -990 -952 -957
		mu 0 4 610 628 605 606
		f 4 -918 990 991 992
		mu 0 4 630 633 632 631
		f 4 -297 993 -992 994
		mu 0 4 634 635 631 632
		f 4 995 996 -298 -995
		mu 0 4 632 637 636 634
		f 4 -947 -302 -997 997
		mu 0 4 597 600 636 637
		f 4 -900 998 999 -909
		mu 0 4 568 569 638 575
		f 4 -998 1000 -999 -944
		mu 0 4 597 637 639 596
		f 4 -991 -1000 -1001 -996
		mu 0 4 632 633 639 637
		f 4 -308 1001 1002 -994
		mu 0 4 635 641 640 631
		f 4 1003 1004 1005 1006
		mu 0 4 640 644 643 642
		f 4 1007 -919 1008 -1006
		mu 0 4 645 579 580 646
		f 4 -1009 -993 -1003 -1007
		mu 0 4 642 630 631 640
		f 4 -317 -821 1009 1010
		mu 0 4 212 78 515 648
		f 4 -1008 1011 -920 -917
		mu 0 4 579 645 581 578
		f 4 -1012 1012 1013 -924
		mu 0 4 584 643 649 587
		f 4 -928 -1014 1014 -1010
		mu 0 4 515 587 649 648
		f 4 1015 -1015 -1013 -1005
		mu 0 4 644 648 649 643
		f 4 -1004 1016 1017 1018
		mu 0 4 650 653 652 651
		f 4 -1002 -327 1019 -1017
		mu 0 4 653 655 654 652
		f 4 -1016 -1019 1020 1021
		mu 0 4 656 650 651 657
		f 4 -1011 -1022 1022 -330
		mu 0 4 658 656 657 659
		f 4 -1018 1023 1024 1025
		mu 0 4 651 652 661 660
		f 4 -1020 -336 1026 -1024
		mu 0 4 652 654 662 661
		f 4 -1021 -1026 1027 1028
		mu 0 4 657 651 660 663
		f 4 -1023 -1029 1029 -339
		mu 0 4 659 657 663 664
		f 4 1030 1031 1032 -1025
		mu 0 4 661 666 665 660
		f 4 -345 1033 -1031 -1027
		mu 0 4 662 667 666 661
		f 4 -1033 1034 1035 -1028
		mu 0 4 660 665 668 663
		f 4 -1036 1036 -348 -1030
		mu 0 4 663 668 669 664
		f 4 1037 1038 1039 1040
		mu 0 4 670 673 672 671
		f 4 1041 -1041 1042 -354
		mu 0 4 674 670 671 675
		f 4 1043 1044 1045 -1039
		mu 0 4 673 677 676 672
		f 4 1046 -361 1047 -1045
		mu 0 4 677 679 678 676
		f 4 1048 -1040 1049 1050
		mu 0 4 680 671 672 681
		f 4 -367 -1043 -1049 1051
		mu 0 4 682 675 671 680
		f 4 -1050 -1046 1052 1053
		mu 0 4 681 672 676 683
		f 4 -1053 -1048 -371 1054
		mu 0 4 683 676 678 684
		f 4 1055 1056 -1038 1057
		mu 0 4 685 686 673 670
		f 4 1058 -1058 -1042 -375
		mu 0 4 687 685 670 674
		f 4 1059 1060 -1044 -1057
		mu 0 4 686 688 677 673;
	setAttr ".fc[500:681]"
		f 4 1061 -379 -1047 -1061
		mu 0 4 688 689 679 677
		f 4 1062 -383 1063 1064
		mu 0 4 690 693 692 691
		f 4 1065 -1064 -386 1066
		mu 0 4 694 691 692 695
		f 4 1067 -1065 1068 -1056
		mu 0 4 685 690 691 686
		f 4 -390 -1063 -1068 -1059
		mu 0 4 687 693 690 685
		f 4 -1069 -1066 1069 -1060
		mu 0 4 686 691 694 688
		f 4 -1067 -392 -1062 -1070
		mu 0 4 694 695 689 688
		f 4 1070 -1051 1071 -1032
		mu 0 4 666 680 681 665
		f 4 -395 -1052 -1071 -1034
		mu 0 4 667 682 680 666
		f 4 -1072 -1054 1072 -1035
		mu 0 4 665 681 683 668
		f 4 -1073 -1055 -397 -1037
		mu 0 4 668 683 684 669
		f 4 1073 -862 1074 -847
		mu 0 4 536 547 544 535
		f 4 1075 -866 -1074 -850
		mu 0 4 537 549 547 536
		f 4 -869 -1076 -852 1076
		mu 0 4 551 549 537 538
		f 4 -872 -1077 -854 1077
		mu 0 4 553 551 538 539
		f 4 -875 -1078 -856 1078
		mu 0 4 555 553 539 540
		f 4 -878 -1079 -858 1079
		mu 0 4 557 555 540 541
		f 4 1080 -881 -1080 -860
		mu 0 4 542 559 557 541
		f 4 -1075 -884 -1081 -861
		mu 0 4 543 561 559 542
		f 4 -822 1081 1082 1083
		mu 0 4 520 517 697 696
		f 4 -826 -1084 1084 1085
		mu 0 4 522 520 696 698
		f 4 1086 -829 -1086 1087
		mu 0 4 699 524 522 698
		f 4 1088 -832 -1087 1089
		mu 0 4 700 526 524 699
		f 4 1090 -835 -1089 1091
		mu 0 4 701 528 526 700
		f 4 1092 -838 -1091 1093
		mu 0 4 702 530 528 701
		f 4 -841 -1093 1094 1095
		mu 0 4 532 530 702 703
		f 4 -844 -1096 1096 -1082
		mu 0 4 534 532 703 704
		f 4 -737 1097 -715 1098
		mu 0 4 457 454 437 438
		f 4 -741 -1099 -719 1099
		mu 0 4 459 457 438 440
		f 4 1100 -746 -1100 -721
		mu 0 4 443 460 459 440
		f 4 1101 -749 -1101 -724
		mu 0 4 445 462 460 443
		f 4 1102 -752 -1102 -727
		mu 0 4 447 464 462 445
		f 4 1103 -755 -1103 -730
		mu 0 4 449 466 464 447
		f 4 -756 -1104 -734 1104
		mu 0 4 469 466 449 450
		f 4 -759 -1105 -736 -1098
		mu 0 4 471 469 450 452
		f 4 -761 1105 -739 1106
		mu 0 4 475 472 455 456
		f 4 -765 -1107 -743 1107
		mu 0 4 477 475 456 458
		f 4 1108 -768 -1108 -745
		mu 0 4 461 479 477 458
		f 4 1109 -771 -1109 -748
		mu 0 4 463 481 479 461
		f 4 1110 -774 -1110 -751
		mu 0 4 465 483 481 463
		f 4 1111 -777 -1111 -754
		mu 0 4 467 485 483 465
		f 4 -780 -1112 -758 1112
		mu 0 4 487 485 467 468
		f 4 -783 -1113 -760 -1106
		mu 0 4 489 487 468 470
		f 4 -717 1113 1114 1115
		mu 0 4 441 439 706 705
		f 4 -722 -1116 1116 1117
		mu 0 4 442 441 705 707
		f 4 -1115 1118 1119 1120
		mu 0 4 705 706 709 708
		f 4 -1117 -1121 1121 1122
		mu 0 4 707 705 708 710
		f 4 -1119 1123 1124 1125
		mu 0 4 709 706 712 711
		f 4 -1123 1126 1127 1128
		mu 0 4 707 710 714 713
		f 4 -1125 1129 1130 1131
		mu 0 4 715 718 717 716
		f 4 -1128 1132 1133 1134
		mu 0 4 713 714 720 719
		f 4 1135 1136 1137 -1134
		mu 0 4 720 722 721 719
		f 4 -1131 1138 -1137 1139
		mu 0 4 716 717 721 722
		f 4 -1139 1140 -732 1141
		mu 0 4 721 717 451 448
		f 4 -1142 -731 1142 -1138
		mu 0 4 721 448 446 719
		f 4 -1143 -728 1143 -1135
		mu 0 4 719 446 444 713
		f 4 -1144 -725 -1118 -1129
		mu 0 4 713 444 442 707
		f 4 -1124 -1114 -713 1144
		mu 0 4 712 706 439 436
		f 4 -1130 -1145 -735 -1141
		mu 0 4 717 718 453 451
		f 4 -1133 1145 1146 -1136
		mu 0 4 723 726 725 724
		f 4 -1140 -1147 1147 -1132
		mu 0 4 727 724 725 728
		f 4 -1122 1148 -1146 -1127
		mu 0 4 729 730 725 726
		f 4 -1149 -1120 -1126 -1148
		mu 0 4 725 730 731 728
		f 4 1149 1150 1151 1152
		mu 0 4 732 735 734 733
		f 4 1153 -1153 1154 1155
		mu 0 4 736 732 733 737
		f 4 -1152 1156 1157 1158
		mu 0 4 733 734 739 738
		f 4 -1155 -1159 1159 1160
		mu 0 4 737 733 738 740
		f 4 -1157 1161 1162 1163
		mu 0 4 739 734 742 741
		f 4 -1161 1164 1165 1166
		mu 0 4 737 740 744 743
		f 4 -1163 1167 1168 1169
		mu 0 4 745 748 747 746
		f 4 -1166 1170 1171 1172
		mu 0 4 743 744 750 749
		f 4 1173 1174 1175 -1172
		mu 0 4 750 752 751 749
		f 4 -1169 1176 -1175 1177
		mu 0 4 746 747 751 752
		f 4 -1177 1178 1179 1180
		mu 0 4 751 747 754 753
		f 4 -1181 1181 1182 -1176
		mu 0 4 751 753 755 749
		f 4 -1183 1183 1184 -1173
		mu 0 4 749 755 756 743
		f 4 -1185 1185 -1156 -1167
		mu 0 4 743 756 736 737
		f 4 -1162 -1151 1186 1187
		mu 0 4 742 734 735 757
		f 4 -1168 -1188 1188 -1179
		mu 0 4 747 748 758 754
		f 4 -1171 1189 1190 -1174
		mu 0 4 759 762 761 760
		f 4 -1178 -1191 1191 -1170
		mu 0 4 763 760 761 764
		f 4 -1160 1192 -1190 -1165
		mu 0 4 765 766 761 762
		f 4 -1193 -1158 -1164 -1192
		mu 0 4 761 766 767 764
		f 4 -1083 1193 -1187 1194
		mu 0 4 696 697 757 735
		f 4 -1097 1195 -1189 -1194
		mu 0 4 704 703 754 758
		f 4 -1095 1196 -1180 -1196
		mu 0 4 703 702 753 754
		f 4 -1094 1197 -1182 -1197
		mu 0 4 702 701 755 753
		f 4 -1092 1198 -1184 -1198
		mu 0 4 701 700 756 755
		f 4 -1090 1199 -1186 -1199
		mu 0 4 700 699 736 756
		f 4 -1088 1200 -1154 -1200
		mu 0 4 699 698 732 736
		f 4 -1085 -1195 -1150 -1201
		mu 0 4 698 696 735 732
		f 4 1201 1202 -796 1203
		mu 0 4 768 771 770 769
		f 4 1204 1205 -530 1206
		mu 0 4 772 775 774 773
		f 4 -1202 1207 -1205 1208
		mu 0 4 771 768 775 772
		f 4 1209 1210 -1207 -535
		mu 0 4 776 777 772 773
		f 4 1211 1212 -538 -954
		mu 0 4 603 779 778 607
		f 4 1213 -1210 -541 -1213
		mu 0 4 779 777 776 778
		f 4 1214 -787 -1203 1215
		mu 0 4 780 781 770 771
		f 4 -767 -1215 1216 1217
		mu 0 4 604 781 780 782
		f 4 -1218 1218 -1212 -948
		mu 0 4 604 782 779 603
		f 4 -1217 1219 -1214 -1219
		mu 0 4 782 780 777 779
		f 4 -1220 -1216 -1209 -1211
		mu 0 4 777 780 771 772
		f 4 -973 -792 -782 -989
		mu 0 4 783 494 484 486
		f 4 1220 1221 -550 1222
		mu 0 4 784 787 786 785
		f 4 1223 -554 -1222 1224
		mu 0 4 788 789 786 787
		f 4 -558 -1224 1225 1226
		mu 0 4 790 789 788 791
		f 4 -562 1227 1228 1229
		mu 0 4 358 359 794 793
		f 4 1230 1231 -1228 -563
		mu 0 4 796 799 798 797
		f 4 1232 1233 -567 1234
		mu 0 4 800 803 802 801
		f 4 1235 1236 -1235 -570
		mu 0 4 804 805 800 801
		f 4 1237 -1237 1238 1239
		mu 0 4 806 800 805 807
		f 4 1240 1241 1242 1243
		mu 0 4 808 811 810 809
		f 4 1244 1245 -1225 1246
		mu 0 4 812 813 788 787
		f 4 1247 -1247 -1221 1248
		mu 0 4 814 812 787 784
		f 4 1249 -1240 1250 -1243
		mu 0 4 810 806 807 809
		f 4 1251 1252 1253 1254
		mu 0 4 814 817 816 815
		f 4 1255 1256 -1233 -1238
		mu 0 4 806 817 803 800
		f 4 -1241 1257 1258 1259
		mu 0 4 811 808 819 818
		f 4 -598 -1230 1260 1261
		mu 0 4 385 358 793 821
		f 4 -600 -1227 1262 -1231
		mu 0 4 796 790 791 799
		f 4 -603 -1262 1263 1264
		mu 0 4 387 385 821 823
		f 4 -607 1265 1266 1267
		mu 0 4 390 391 826 825
		f 4 -610 1268 1269 -1266
		mu 0 4 391 393 828 826
		f 4 -612 -1268 1270 -810
		mu 0 4 69 390 825 506
		f 4 1271 -1223 -613 -1234
		mu 0 4 803 784 785 802
		f 4 -1252 -1249 -1272 -1257
		mu 0 4 817 814 784 803
		f 4 -1248 -1255 1272 1273
		mu 0 4 812 814 815 830
		f 4 1274 -1253 -1256 -1250
		mu 0 4 810 816 817 806
		f 4 1275 1276 -1254 1277
		mu 0 4 831 832 815 816
		f 4 -1276 1278 -1260 1279
		mu 0 4 832 831 811 818
		f 4 -1279 -1278 -1275 -1242
		mu 0 4 811 831 816 810
		f 4 1280 -1270 1281 1282
		mu 0 4 833 826 828 834
		f 4 1283 1284 1285 -1259
		mu 0 4 819 836 835 818
		f 4 1286 -1283 1287 -1285
		mu 0 4 836 833 834 835
		f 4 1288 1289 -1236 -631
		mu 0 4 837 838 805 804
		f 4 1290 1291 -1289 -634
		mu 0 4 839 840 838 837
		f 4 1292 1293 -1291 -637
		mu 0 4 841 842 840 839
		f 4 1294 1295 -1293 -640
		mu 0 4 843 844 842 841
		f 4 -1295 -644 -1206 1296
		mu 0 4 844 843 774 775
		f 4 1297 1298 -1297 -1208
		mu 0 4 768 845 844 775
		f 4 1299 1300 1301 1302
		mu 0 4 846 848 509 847
		f 4 1303 -1298 1304 -1300
		mu 0 4 846 845 768 848
		f 4 1305 -1302 -816 -1271
		mu 0 4 825 847 509 506
		f 4 -814 -1301 1306 -808
		mu 0 4 503 509 848 502
		f 4 -804 -1307 -1305 -1204
		mu 0 4 769 502 848 768
		f 4 1307 1308 -1303 1309
		mu 0 4 849 850 846 847
		f 4 1310 -1304 -1309 1311
		mu 0 4 851 845 846 850
		f 4 -1308 1312 -1284 1313
		mu 0 4 850 849 836 819
		f 4 -1312 -1314 -1258 1314
		mu 0 4 851 850 819 808
		f 4 1315 -1267 -1281 1316
		mu 0 4 852 825 826 833
		f 4 -1317 -1287 -1313 1317
		mu 0 4 852 833 836 849
		f 4 -1318 -1310 -1306 -1316
		mu 0 4 852 849 847 825
		f 4 -1239 -1290 -1292 1318
		mu 0 4 807 805 838 840
		f 4 1319 -1251 -1319 1320
		mu 0 4 853 809 807 840
		f 4 -1321 -1294 -1296 1321
		mu 0 4 853 840 842 844
		f 4 -1322 -1299 -1311 1322
		mu 0 4 853 844 845 851
		f 4 -1323 -1315 -1244 -1320
		mu 0 4 853 851 808 809
		f 4 1323 1324 1325 1326
		mu 0 4 854 794 856 855
		f 4 1327 1328 1329 1330
		mu 0 4 857 824 827 829
		f 4 1331 1332 1333 -1261
		mu 0 4 793 822 827 821
		f 4 -1328 1334 -1288 1335
		mu 0 4 824 857 835 834
		f 4 -685 -1265 1336 -1269
		mu 0 4 393 387 823 828
		f 4 1337 -1336 -1282 -1337
		mu 0 4 823 824 834 828
		f 4 -1334 -1329 -1338 -1264
		mu 0 4 821 827 824 823
		f 4 -1326 1338 1339 1340
		mu 0 4 855 792 795 820
		f 4 -1245 -1274 1341 1342
		mu 0 4 813 812 830 647
		f 4 1343 1344 -1273 -1277
		mu 0 4 832 583 830 815
		f 4 -1344 1345 -1331 1346
		mu 0 4 583 832 857 829
		f 4 -1286 -1335 -1346 -1280
		mu 0 4 818 835 857 832
		f 4 1347 1348 -1343 1349
		mu 0 4 514 513 813 647
		f 4 1350 -1348 1351 -1263
		mu 0 4 791 513 514 799
		f 4 -1246 -1349 -1351 -1226
		mu 0 4 788 813 513 791
		f 4 1352 1353 -1232 -1352
		mu 0 4 514 511 798 799
		f 4 1354 -1342 -1345 1355
		mu 0 4 508 647 830 583
		f 4 -1356 -1347 1356 1357
		mu 0 4 508 583 829 511
		f 4 -1358 -1353 -1350 -1355
		mu 0 4 508 511 514 647
		f 4 1358 -1332 -1229 -1324
		mu 0 4 854 822 793 794
		f 4 -1341 1359 1360 -1327
		mu 0 4 855 820 507 854
		f 4 -1325 -1354 1361 -1339
		mu 0 4 792 798 511 795
		f 4 1362 -1330 1363 -1360
		mu 0 4 820 829 827 507
		f 4 -1362 -1357 -1363 -1340
		mu 0 4 795 511 829 820
		f 4 -1333 -1359 -1361 -1364
		mu 0 4 827 822 854 507;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "locator1" -p "|cat";
	rename -uid "35E7EA67-4139-8B93-8FC8-D4BAB32F369D";
	setAttr ".t" -type "double3" 0 3.437374119199943 2.6001648914917732 ;
createNode locator -n "locatorShape1" -p "locator1";
	rename -uid "3C7876A9-407C-7B5E-DEB8-53B5BF4F890B";
	setAttr -k off ".v";
createNode transform -n "locator2" -p "|cat";
	rename -uid "0ADA14E6-43C4-47A5-A4F2-D383166ED55E";
	setAttr ".t" -type "double3" -0.75764121100047888 0.075523487374078088 1.469327083720058 ;
createNode locator -n "locatorShape2" -p "locator2";
	rename -uid "660CE730-428A-8DB4-1022-D19237C64ED7";
	setAttr -k off ".v";
createNode transform -n "locator3" -p "|cat";
	rename -uid "35FAFE9C-48EB-8BEB-5908-9C9725D0CCAD";
	setAttr ".t" -type "double3" 0.77550990380219342 0.089846295079540991 1.469327083720058 ;
createNode locator -n "locatorShape3" -p "locator3";
	rename -uid "8312EBDC-4AAC-56CE-1D5D-DFB6E49BF730";
	setAttr -k off ".v";
createNode transform -n "locator4" -p "|cat";
	rename -uid "F9C5188D-47E3-8404-C5B3-A9B2531EA7BD";
	setAttr ".t" -type "double3" 0.74726691734442197 0.13708475715322255 -1.1464652839514977 ;
createNode locator -n "locatorShape4" -p "locator4";
	rename -uid "4B668C8F-45A7-0758-97E8-E2941BCA1A1E";
	setAttr -k off ".v";
createNode transform -n "locator5" -p "|cat";
	rename -uid "22C55953-456D-740B-489B-FAA7956D3B48";
	setAttr ".t" -type "double3" -0.77690577455531074 0.11798768021260519 -1.1464652839514977 ;
createNode locator -n "locatorShape5" -p "locator5";
	rename -uid "8FF00095-4F8F-5B05-CB4A-F89139E4582E";
	setAttr -k off ".v";
createNode transform -n "locator6" -p "|cat";
	rename -uid "26D5E506-4C5B-E607-A70D-24BF4412C0CC";
	setAttr ".t" -type "double3" 0 1.4972720696428816 -3.7272488373507273 ;
createNode locator -n "locatorShape6" -p "locator6";
	rename -uid "B75BAC0A-400C-0ADD-3D4D-6680AF8E9EDC";
	setAttr -k off ".v";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "7A11274D-40D9-E92F-10A9-49A1EEF09D63";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "A6641060-4C14-FB19-A8AF-EE9DFE078D94";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "29F72A39-440E-6963-89B9-709E46669E26";
createNode displayLayerManager -n "layerManager";
	rename -uid "B6A044D3-4838-90B1-4E96-EE86E9B95A53";
createNode displayLayer -n "defaultLayer";
	rename -uid "C285957A-4EF7-89D7-6A0F-4E88432F4301";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "71EDBCFA-4C66-EE19-C9FE-63AA6A7E0FDC";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "894AB470-4821-E478-BCBB-CD8A01D338FB";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "5B359343-4FE6-3A2F-022C-95ACE36E3D11";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 0\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 0\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 0\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1803\n            -height 1217\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 0\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 1\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1803\n            -height 1217\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -autoExpandAnimatedShapes 1\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n"
		+ "            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -selectCommand \"look\" \n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n"
		+ "            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -autoExpandAnimatedShapes 1\n"
		+ "            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n"
		+ "            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n"
		+ "                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -autoExpandAnimatedShapes 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n"
		+ "                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -outliner \"graphEditor1OutlineEd\" \n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n"
		+ "                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -autoExpandAnimatedShapes 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n"
		+ "                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n"
		+ "                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n"
		+ "                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n"
		+ "                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n"
		+ "\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n"
		+ "                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n"
		+ "                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n"
		+ "                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n"
		+ "                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -autoExpandAnimatedShapes 1\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n"
		+ "            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n"
		+ "            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap true\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1803\\n    -height 1217\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1803\\n    -height 1217\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "E18A13B6-4A1A-BDA8-D0B2-0DB65A652D1B";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 200 -ast 1 -aet 6000 ";
	setAttr ".st" 6;
createNode shadingEngine -n "blinn1SG";
	rename -uid "948DF3E3-4891-C0DB-B093-06983DBED631";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "CD033FA5-4454-464D-780A-138836BBB491";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "138CCA58-4022-9B4E-060F-18A27083CFA9";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1776.5109184187854 -352.38093837859071 ;
	setAttr ".tgi[0].vh" -type "double2" 2658.6537405084414 848.80949008086645 ;
	setAttr -s 10 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -812.76275634765625;
	setAttr ".tgi[0].ni[0].y" 312.9334716796875;
	setAttr ".tgi[0].ni[0].nvs" 18305;
	setAttr ".tgi[0].ni[1].x" 221.5579833984375;
	setAttr ".tgi[0].ni[1].y" 272.46514892578125;
	setAttr ".tgi[0].ni[1].nvs" 18313;
	setAttr ".tgi[0].ni[2].x" -375.71429443359375;
	setAttr ".tgi[0].ni[2].y" 477.14285278320313;
	setAttr ".tgi[0].ni[2].nvs" 18313;
	setAttr ".tgi[0].ni[3].x" -852.11627197265625;
	setAttr ".tgi[0].ni[3].y" -220.08758544921875;
	setAttr ".tgi[0].ni[3].nvs" 18312;
	setAttr ".tgi[0].ni[4].x" -852.11627197265625;
	setAttr ".tgi[0].ni[4].y" -118.65901947021484;
	setAttr ".tgi[0].ni[4].nvs" 18312;
	setAttr ".tgi[0].ni[5].x" -68.009902954101563;
	setAttr ".tgi[0].ni[5].y" 438.21502685546875;
	setAttr ".tgi[0].ni[5].nvs" 18312;
	setAttr ".tgi[0].ni[6].x" -852.11627197265625;
	setAttr ".tgi[0].ni[6].y" -321.51617431640625;
	setAttr ".tgi[0].ni[6].nvs" 18312;
	setAttr ".tgi[0].ni[7].x" -852.11627197265625;
	setAttr ".tgi[0].ni[7].y" -524.373291015625;
	setAttr ".tgi[0].ni[7].nvs" 18312;
	setAttr ".tgi[0].ni[8].x" -852.11627197265625;
	setAttr ".tgi[0].ni[8].y" -422.94473266601563;
	setAttr ".tgi[0].ni[8].nvs" 18312;
	setAttr ".tgi[0].ni[9].x" -847.56915283203125;
	setAttr ".tgi[0].ni[9].y" -608.7847900390625;
	setAttr ".tgi[0].ni[9].nvs" 18312;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 1;
	setAttr -av -k on ".unw" 1;
	setAttr -av -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr -k on ".ihi";
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr -av ".ta";
	setAttr -av ".tq";
	setAttr -av ".etmr";
	setAttr -av ".tmr";
	setAttr -av ".aoon";
	setAttr -av ".aoam";
	setAttr -av ".aora";
	setAttr -av ".hfs";
	setAttr -av ".hfe";
	setAttr -av ".hfc";
	setAttr -av ".hfa";
	setAttr -av ".mbe";
	setAttr -av -k on ".mbsof";
	setAttr -av ".msaa" yes;
	setAttr ".aasc" 16;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
select -ne :lambert1;
	setAttr ".c" -type "float3" 0.12987013 0.12987013 0.12987013 ;
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".dsm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".macc";
	setAttr -k on ".macd";
	setAttr -k on ".macq";
	setAttr -k on ".mcfr" 30;
	setAttr -cb on ".ifg";
	setAttr -k on ".clip";
	setAttr -k on ".edm";
	setAttr -k on ".edl";
	setAttr -k on ".ren" -type "string" "arnold";
	setAttr -av -k on ".esr";
	setAttr -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av -k on ".outf";
	setAttr -k on ".imfkey";
	setAttr -k on ".gama";
	setAttr -k on ".an";
	setAttr -cb on ".ar";
	setAttr -k on ".fs";
	setAttr -k on ".ef";
	setAttr -av -k on ".bfs";
	setAttr -cb on ".me";
	setAttr -cb on ".se";
	setAttr -k on ".be";
	setAttr -cb on ".ep";
	setAttr -k on ".fec";
	setAttr -av -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -cb on ".pff";
	setAttr -k on ".peie";
	setAttr -cb on ".ifp";
	setAttr -k on ".rv";
	setAttr -k on ".comp";
	setAttr -k on ".cth";
	setAttr -k on ".soll";
	setAttr -cb on ".sosl";
	setAttr -k on ".rd";
	setAttr -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -k on ".shs";
	setAttr -av -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -k on ".mm";
	setAttr -k on ".npu";
	setAttr -k on ".itf";
	setAttr -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -k on ".uf";
	setAttr -k on ".oi";
	setAttr -k on ".rut";
	setAttr -k on ".mot";
	setAttr -av -cb on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -k on ".mbso";
	setAttr -k on ".mbsc";
	setAttr -av -k on ".afp";
	setAttr -k on ".pfb";
	setAttr -k on ".pram";
	setAttr -k on ".poam";
	setAttr -k on ".prlm";
	setAttr -k on ".polm";
	setAttr -cb on ".prm";
	setAttr -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -av -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -k on ".ubc";
	setAttr -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -k on ".udbx";
	setAttr -k on ".smc";
	setAttr -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -k on ".tlwd";
	setAttr -k on ".tlht";
	setAttr -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -k on ".ope";
	setAttr -k on ".oppf";
	setAttr -k on ".rcp";
	setAttr -k on ".icp";
	setAttr -k on ".ocp";
	setAttr -cb on ".hbl";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".w";
	setAttr -av -k on ".h";
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar";
	setAttr -av -k on ".ldar";
	setAttr -av -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -k on ".isu";
	setAttr -av -k on ".pdu";
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "C:/MJCG/modules/OCIO/aces_1.0.3/config.ocio";
	setAttr ".vtn" -type "string" "sRGB (ACES)";
	setAttr ".wsn" -type "string" "ACES - ACEScg";
	setAttr ".otn" -type "string" "sRGB (ACES)";
	setAttr ".potn" -type "string" "sRGB (ACES)";
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k off -cb on ".ctrs" 256;
	setAttr -av -k off -cb on ".btrs" 512;
	setAttr -k off -cb on ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off -cb on ".enpt";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr" 30;
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
connectAttr "catShape.w" "scatterShape.mesh1";
connectAttr ":time1.o" "growShape.JobPorts__time";
connectAttr "locator1.t" "growShape.locators[0]";
connectAttr "locator2.t" "growShape.locators[1]";
connectAttr "locator3.t" "growShape.locators[2]";
connectAttr "locator4.t" "growShape.locators[3]";
connectAttr "locator5.t" "growShape.locators[4]";
connectAttr "locator6.t" "growShape.locators[5]";
connectAttr "scatterShape.attractors" "growShape.attractors";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "blinn1SG.msg" "materialInfo2.sg";
connectAttr "catShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "growShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "scatterShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "locator2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "locator1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr ":time1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "locator3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn";
connectAttr "locator5.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn";
connectAttr "locator4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn";
connectAttr "locator6.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn";
connectAttr "blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "growShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "scatterShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "catShape.iog" ":initialShadingGroup.dsm" -na;
// End of venation_cat.ma
