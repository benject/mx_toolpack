//Maya ASCII 2020 scene
//Name: venation_sphere.ma
//Last modified: Wed, Dec 30, 2020 03:11:49 AM
//Codeset: 932
requires maya "2020";
requires -nodeType "bifrostGraphShape" -dataType "bifData" "bifrostGraph" "2.2.0.1-202011260743-32fc074";
requires "stereoCamera" "10.0";
requires "mtoa" "4.1.1";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2020";
fileInfo "version" "2020";
fileInfo "cutIdentifier" "202011110415-b1e20b88e2";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 18363)\n";
fileInfo "UUID" "2A8786A0-497D-2EEA-C9F9-4F80BE0F46F5";
createNode transform -s -n "persp";
	rename -uid "9EE7B2FF-4F68-964B-F5E4-E094DF8026C5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -13.730790068449645 7.0973361242429025 -4.6876327756047065 ;
	setAttr ".r" -type "double3" -3977.1383531381853 -26029.399999948899 0 ;
	setAttr ".rp" -type "double3" 8.8817841970012523e-16 -4.4408920985006262e-16 0 ;
	setAttr ".rpt" -type "double3" -3.2262909005411243e-15 -1.2836648441545219e-15 1.0771400118932786e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "D937AF17-4CDB-B6C1-3C73-ECBDA162526E";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".fs" 64;
	setAttr ".fd" 1e-10;
	setAttr ".coi" 14.528502559491496;
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
	addAttr -r false -ci true -k true -sn "JobPorts__Math_epsilonFloat" -ln "JobPorts__Math_epsilonFloat" 
		-at "float";
	addAttr -w false -ci true -sn "seeds" -ln "seeds" -dt "bifData";
	addAttr -w false -ci true -sn "Core__Graph__terminal__final" -ln "Core__Graph__terminal__final" 
		-dt "bifData";
	addAttr -w false -ci true -sn "Core__Graph__terminal__proxy" -ln "Core__Graph__terminal__proxy" 
		-dt "bifData";
	addAttr -w false -ci true -sn "Core__Graph__terminal__diagnostic" -ln "Core__Graph__terminal__diagnostic" 
		-dt "bifData";
	addAttr -w false -ci true -sn "sphere_mesh" -ln "sphere_mesh" -dt "bifData";
	setAttr -k off ".v";
	setAttr -s 2 ".iog";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sc" -type "string" (
		"{\"header\": {\"metadata\": [{\"metaName\": \"adskFileFormatVersion\", \"metaValue\": \"100L\"}]}, \"dependencies\": [{\"uri\": \"file:///bifrost_object_i.json\"}, {\"uri\": \"file:///Math_types.json\"}, {\"uri\": \"file:///scatter_types.json\"}, {\"uri\": \"file:///geometry_types.json\"}, {\"uri\": \"file:///bifrost_geometry_query_types.json\"}, {\"uri\": \"file:///Math_long.json\"}, {\"uri\": \"file:///Math_float.json\"}, {\"uri\": \"file:///Math_double.json\"}, {\"uri\": \"file:///Math_char.json\"}, {\"uri\": \"file:///Math_int.json\"}, {\"uri\": \"file:///Math_short.json\"}, {\"uri\": \"file:///Math_uchar.json\"}, {\"uri\": \"file:///Math_uint.json\"}, {\"uri\": \"file:///Math_ulong.json\"}, {\"uri\": \"file:///Math_ushort.json\"}, {\"uri\": \"file:///riv_types.json\"}, {\"uri\": \"file:///point_types.json\"}, {\"uri\": \"file:///FCurve.json\"}, {\"uri\": \"file:///riv_ops.json\"}, {\"uri\":"
		+ " \"file:///get_indexer_element.json\"}, {\"uri\": \"file:///math_util.json\"}, {\"uri\": \"file:///get_loc_element.json\"}, {\"uri\": \"file:///invalid_index.json\"}, {\"uri\": \"file:///get_mesh_geo_loc_data.json\"}, {\"uri\": \"file:///Math_constants.json\"}, {\"uri\": \"file:///max_weight.json\"}, {\"uri\": \"file:///mesh_v_interp.json\"}, {\"uri\": \"file:///CoreArrayOps.json\"}, {\"uri\": \"file:///get_property_any.json\"}, {\"uri\": \"file:///get_property.json\"}, {\"uri\": \"file:///get_geo_property.json\"}, {\"uri\": \"file:///create_object_from_schema.json\"}, {\"uri\": \"file:///is_a.json\"}, {\"uri\": \"file:///is_a_range_geo_property.json\"}, {\"uri\": \"file:///get_range_geo_property.json\"}, {\"uri\": \"file:///mesh_fv_interp.json\"}, {\"uri\": \"file:///mesh_f_interp.json\"}, {\"uri\": \"file:///Core_Array_empty_array.json\"}, {\"uri\": \"file:///choose_mesh_values.json\"},"
		+ " {\"uri\": \"file:///get_sub_object.json\"}, {\"uri\": \"file:///get_point_count.json\"}, {\"uri\": \"file:///get_geo_component_count.json\"}, {\"uri\": \"file:///get_mesh_structure.json\"}, {\"uri\": \"file:///Math_bool.json\"}, {\"uri\": \"file:///has_property.json\"}, {\"uri\": \"file:///get_point_geo_loc_data.json\"}, {\"uri\": \"file:///point_p_interp.json\"}, {\"uri\": \"file:///sample_volume_property.json\"}, {\"uri\": \"file:///Math_conversion.json\"}, {\"uri\": \"file:///get_strands_structure.json\"}, {\"uri\": \"file:///get_strand_geo_loc_data.json\"}, {\"uri\": \"file:///Core_Constants_default_value.json\"}, {\"uri\": \"file:///strand_p_interp.json\"}, {\"uri\": \"file:///strand_s_interp.json\"}, {\"uri\": \"file:///choose_strand_values.json\"}, {\"uri\": \"file:///get_geo_schema_type.json\"}, {\"uri\": \"file:///switch_is_a.json\"}, {\"uri\": \"file:///sample_property.json\"},"
		+ " {\"uri\": \"file:///Math_matrix_to_quaternion.json\"}, {\"uri\": \"file:///Math_length_squared.json\"}, {\"uri\": \"file:///normal_and_tangent_to_orientation.json\"}, {\"uri\": \"file:///Core_Array_array_is_empty.json\"}, {\"uri\": \"file:///get_geo_property_check.json\"}, {\"uri\": \"file:///get_geo_target_count.json\"}, {\"uri\": \"file:///CoreStringOps.json\"}, {\"uri\": \"file:///volume_types.json\"}, {\"uri\": \"file:///volume_nodedefs.json\"}, {\"uri\": \"file:///interpret_auto_port_as_scalar.json\"}, {\"uri\": \"file:///Math_multiply_quaternions.json\"}, {\"uri\": \"file:///Math_rotate_by_quaternion.json\"}, {\"uri\": \"file:///create_volume_geo_prop.json\"}, {\"uri\": \"file:///is_a_mesh.json\"}, {\"uri\": \"file:///is_a_strands.json\"}, {\"uri\": \"file:///is_a_points.json\"}, {\"uri\": \"file:///is_a_volume.json\"}, {\"uri\": \"file:///get_target_component.json\"}, {\"uri\": \"file:///create_data_geo_prop.json\"},"
		+ " {\"uri\": \"file:///set_property_any.json\"}, {\"uri\": \"file:///set_property.json\"}, {\"uri\": \"file:///set_geo_property.array.json\"}, {\"uri\": \"file:///set_geo_property.scalar.json\"}, {\"uri\": \"file:///Math_axis_angle_to_quaternion.json\"}, {\"uri\": \"file:///Math_vector4_to_vector3.json\"}, {\"uri\": \"file:///interpret_auto_port_as_vector.json\"}, {\"uri\": \"file:///rotate_points.json\"}, {\"uri\": \"file:///Math_almost_equal.json\"}, {\"uri\": \"file:///Math_quaternion_to_axis_angle.json\"}, {\"uri\": \"file:///Math_array.json\"}, {\"uri\": \"file:///set_geo_property_data.json\"}, {\"uri\": \"file:///get_point_normal.json\"}, {\"uri\": \"file:///get_point_position.json\"}, {\"uri\": \"file:///build_closest_accelerator.json\"}, {\"uri\": \"file:///sample_closest_point_accelerator.json\"}, {\"uri\": \"file:///get_closest_point.json\"}, {\"uri\": \"file:///sample_interpreted_auto_port_as_vector.json\"},"
		+ " {\"uri\": \"file:///erase_property.json\"}, {\"uri\": \"file:///Core_Array_slice_array.json\"}, {\"uri\": \"file:///update_mesh_normals.json\"}, {\"uri\": \"file:///access_offset_array.json\"}, {\"uri\": \"file:///increment_decrement.json\"}, {\"uri\": \"file:///get_indexed_geo_property_check.json\"}, {\"uri\": \"file:///UV_set_name.json\"}, {\"uri\": \"file:///UV_type_filter.json\"}, {\"uri\": \"file:///UV_type_converter.json\"}, {\"uri\": \"file:///get_mesh_UVs.json\"}, {\"uri\": \"file:///int_filter.json\"}, {\"uri\": \"file:///project_vector.json\"}, {\"uri\": \"file:///orient_points_by_geometry.json\"}, {\"uri\": \"file:///add_points_to_points.json\"}, {\"uri\": \"file:///validate_points.json\"}, {\"uri\": \"file:///construct_points.json\"}, {\"uri\": \"file:///generate_sample_locations.json\"}, {\"uri\": \"file:///get_max_index.json\"}, {\"uri\": \"file:///scatter_points_internal.json\"},"
		+ " {\"uri\": \"file:///sample_closest_accelerator.json\"}, {\"uri\": \"file:///get_closest_locations.json\"}, {\"uri\": \"file:///jotun_rand.json\"}, {\"uri\": \"file:///fluids_types.json\"}, {\"uri\": \"file:///fluids_nodedefs.json\"}, {\"uri\": \"file:///random_value.json\"}, {\"uri\": \"file:///find_all_in_array.json\"}, {\"uri\": \"file:///sample_closest_in_radius_accelerator.json\"}, {\"uri\": \"file:///Core_Array_sum_array_impl.json\"}, {\"uri\": \"file:///Core_Array_sum_array.json\"}, {\"uri\": \"file:///half_of.json\"}, {\"uri\": \"file:///Core_Array_flatten_nested_array.json\"}, {\"uri\": \"file:///sample_interpreted_auto_port_as_scalar.json\"}, {\"uri\": \"file:///set_point_position.json\"}, {\"uri\": \"file:///weighted_sample_elimination.json\"}, {\"uri\": \"file:///scatter_points_blue_noise.json\"}, {\"uri\": \"file:///mask_and_number_interaction.json\"}, {\"uri\": \"file:///compute_mesh_surface_area.json\"},"
		+ " {\"uri\": \"file:///scatter_points_on_mesh.json\"}, {\"uri\": \"file:///twice_of.json\"}, {\"uri\": \"file:///compute_bounding_sphere.json\"}, {\"uri\": \"file:///delete_points_in_points.json\"}, {\"uri\": \"file:///delete_points.json\"}, {\"uri\": \"file:///cull_overlapping_positions.json\"}, {\"uri\": \"file:///merge_meshes.json\"}, {\"uri\": \"file:///merge_points.json\"}, {\"uri\": \"file:///merge_strands.json\"}, {\"uri\": \"file:///merge_geometry.json\"}, {\"uri\": \"file:///cull_overlapping_points.json\"}, {\"uri\": \"file:///cull_points.json\"}, {\"uri\": \"file:///density_to_radius.json\"}, {\"uri\": \"file:///get_volume_tile_info.json\"}, {\"uri\": \"file:///scatter_points.json\"}, {\"uri\": \"file:///set_sub_object_property.json\"}, {\"uri\": \"file:///validate_mesh.json\"}, {\"uri\": \"file:///construct_mesh.json\"}, {\"uri\": \"file:///Math_quaternion_to_matrix.json\"}, {\"uri\":"
		+ " \"file:///Math_compose_transform_matrix.json\"}, {\"uri\": \"file:///Math_vector3_to_vector4.json\"}, {\"uri\": \"file:///rotation_between_vectors.json\"}, {\"uri\": \"file:///set_point_normal.json\"}, {\"uri\": \"file:///create_mesh_sphere.json\"}], \"namespaces\": [], \"types\": [], \"compounds\": [{\"name\": \"scatterShape\", \"metadata\": [{\"metaName\": \"io_nodes\", \"metadata\": [{\"metaName\": \"io_inodes\"}, {\"metaName\": \"io_onodes\", \"metadata\": [{\"metaName\": \"output\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"io_ports\", \"metadata\": [{\"metaName\": \"sphere_mesh\"}, {\"metaName\": \"attractors\"}, {\"metaName\": \"seeds\"}]}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"707.626 300.898\"}]}]}]}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\":"
		+ " \"BifrostGraph,Core::Graph,terminal\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"BifrostGraph,Modeling::Primitive,create_mesh_sphere\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"BifrostGraph,Modeling::Points,scatter_points_blue_noise\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"input\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"BifrostGraph,MJCG::Modeling::Strands,extrude_strands\"}, {\"metaName\": \"ViewportRect\", \"metaType\": \"string\", \"metaValue\": \"-599.469 -214.163 1879.63 1234.14\"}, {\"metaName\": \"backdrop\", \"metadata\": [{\"metaName\": \"type\", \"metaType\": \"string\", \"metaValue\": \"backdrop\"}, {\"metaName\": \"coords\", \"metaType\": \"string\", \"metaValue\": \"253.319 -63.4102 357.706 396.558\"}, {\"metaName\": \"color\", \"metaType\":"
		+ " \"string\", \"metaValue\": \"#6d4545\"}, {\"metaName\": \"text\", \"metaType\": \"string\", \"metaValue\": \"Generate attractor points\"}]}, {\"metaName\": \"backdrop1\", \"metadata\": [{\"metaName\": \"type\", \"metaType\": \"string\", \"metaValue\": \"backdrop\"}, {\"metaName\": \"coords\", \"metaType\": \"string\", \"metaValue\": \"255.014 407.412 357.706 396.558\"}, {\"metaName\": \"color\", \"metaType\": \"string\", \"metaValue\": \"#456d48\"}, {\"metaName\": \"text\", \"metaType\": \"string\", \"metaValue\": \"Generate seed points\"}]}, {\"metaName\": \"blackListed\", \"metaValue\": \"true\"}], \"ports\": [{\"portName\": \"sphere_mesh\", \"portDirection\": \"output\", \"portType\": \"Amino::Object\"}, {\"portName\": \"attractors\", \"portDirection\": \"output\", \"portType\": \"Amino::Object\"}, {\"portName\": \"seeds\", \"portDirection\": \"output\", \"portType\": \"Amino::Object\"}],"
		+ " \"compounds\": [{\"name\": \"push\", \"metadata\": [{\"metaName\": \"io_nodes\", \"metadata\": [{\"metaName\": \"io_inodes\", \"metadata\": [{\"metaName\": \"input\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"io_ports\", \"metadata\": [{\"metaName\": \"sphere_mesh\"}, {\"metaName\": \"amount\"}]}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"-732.682 -105.233\"}]}]}, {\"metaName\": \"io_onodes\", \"metadata\": [{\"metaName\": \"output\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"io_ports\", \"metadata\": [{\"metaName\": \"out_sphere_mesh\"}]}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"800 -113\"}]}]}]}, {\"metaName\": \"ViewportRect\", \"metaType\": \"string\", \"metaValue\": \"-1025 -673 2050"
		+ " 1346\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"BifrostGraph,Core::Math,multiply\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"BifrostGraph,Geometry::Properties,set_point_position\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"BifrostGraph,Simulation::Particles,set_particle_property_from_age\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"BifrostGraph,Core::Math,add\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"BifrostGraph,Geometry::Properties,get_point_normal\"}], \"ports\": [{\"portName\": \"sphere_mesh\", \"portDirection\": \"input\", \"portType\": \"Amino::Object\"}, {\"portName\": \"out_sphere_mesh\", \"portDirection\": \"output\", \"portType\": \"Amino::Object\"}, {\"portName\": \"amount\", \"portDirection\": \"input\","
		+ " \"portType\": \"float\"}], \"compoundNodes\": [{\"nodeName\": \"get_point_position\", \"nodeType\": \"Geometry::Properties::get_point_position\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"-212.134 41.3968\"}]}, {\"nodeName\": \"get_point_normal\", \"nodeType\": \"Geometry::Properties::get_point_normal\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"-226.02 302.73\"}]}, {\"nodeName\": \"add\", \"nodeType\": \"Core::Math::add\", \"multiInPortNames\": [\"point_position\", \"point_normal\"], \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\":"
		+ " \"290.181 46.29\"}]}, {\"nodeName\": \"set_point_position\", \"nodeType\": \"Geometry::Properties::set_point_position\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"552.557 -130.316\"}]}, {\"nodeName\": \"multiply\", \"nodeType\": \"Core::Math::multiply\", \"multiInPortNames\": [\"point_normal\", \"port\"], \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"38.5 178\"}]}], \"connections\": [{\"source\": \"get_point_position.point_position\", \"target\": \"add.first.point_position\"}, {\"source\": \"add.output\", \"target\": \"set_point_position.positions\"}, {\"source\": \"set_point_position.out_geometry\", \"target\": \".out_sphere_mesh\"}, {\"source\":"
		+ " \".sphere_mesh\", \"target\": \"get_point_position.geometry\"}, {\"source\": \".sphere_mesh\", \"target\": \"get_point_normal.geometry\"}, {\"source\": \".sphere_mesh\", \"target\": \"set_point_position.geometry\"}, {\"source\": \"get_point_normal.point_normal\", \"target\": \"multiply.first.point_normal\"}, {\"source\": \"multiply.output\", \"target\": \"add.first.point_normal\"}, {\"source\": \".amount\", \"target\": \"multiply.first.port\"}], \"values\": [], \"reservedNodeNames\": [{\"name\": \"input\"}, {\"name\": \"output\"}]}], \"compoundNodes\": [{\"nodeName\": \"scatter_points1\", \"nodeType\": \"Modeling::Points::scatter_points\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"PortExpandedState\", \"metadata\": [{\"metaName\": \"Scatter Settings.Max Number\", \"metaType\": \"string\", \"metaValue\": \"0\"}, {\"metaName\":"
		+ " \"Scatter Settings\", \"metaType\": \"string\", \"metaValue\": \"0\"}]}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"310.415 -4.67029\"}]}, {\"nodeName\": \"scatter_points2\", \"nodeType\": \"Modeling::Points::scatter_points\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"PortExpandedState\", \"metadata\": [{\"metaName\": \"Scatter Settings.Max Number\", \"metaType\": \"string\", \"metaValue\": \"1\"}, {\"metaName\": \"Scatter Settings\", \"metaType\": \"string\", \"metaValue\": \"0\"}]}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"318.131 465.362\"}]}, {\"nodeName\": \"create_mesh_sphere\", \"nodeType\": \"Modeling::Primitive::create_mesh_sphere\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"LayoutPos\","
		+ " \"metaType\": \"string\", \"metaValue\": \"-384.084 299.476\"}]}, {\"nodeName\": \"push\", \"nodeType\": \"push\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"-93.1806 386.257\"}]}], \"connections\": [{\"source\": \"scatter_points1.points\", \"target\": \".attractors\"}, {\"source\": \"scatter_points2.points\", \"target\": \".seeds\"}, {\"source\": \"create_mesh_sphere.sphere_mesh\", \"target\": \".sphere_mesh\"}, {\"source\": \"push.out_sphere_mesh\", \"target\": \"scatter_points2.geometry\"}, {\"source\": \"push.out_sphere_mesh\", \"target\": \"scatter_points1.geometry\"}, {\"source\": \"create_mesh_sphere.sphere_mesh\", \"target\": \"push.sphere_mesh\"}], \"values\": [{\"valueName\": \"scatter_points1.amount\", \"valueType\": \"float\", \"value\": \"100000f\"},"
		+ " {\"valueName\": \"scatter_points1.seed\", \"valueType\": \"long\", \"value\": \"0\"}, {\"valueName\": \"scatter_points2.geometry\", \"valueType\": \"Amino::Object\", \"value\": {}}, {\"valueName\": \"scatter_points2.scatter_mode\", \"valueType\": \"Modeling::Points::ScatteringMode\", \"value\": \"Random\"}, {\"valueName\": \"scatter_points2.amount_mode\", \"valueType\": \"Modeling::Points::AmountMode\", \"value\": \"Number\"}, {\"valueName\": \"scatter_points2.amount\", \"valueType\": \"float\", \"value\": \"20f\"}, {\"valueName\": \"scatter_points2.density_weights_mode\", \"valueType\": \"Modeling::Points::DensityWeightsMode\", \"value\": \"Random\"}, {\"valueName\": \"scatter_points2.cull_overlapping\", \"valueType\": \"bool\", \"value\": \"false\"}, {\"valueName\": \"scatter_points2.overlapping_radius\", \"valueType\": \"float\", \"value\": \"0.100000001f\"}, {\"valueName\": \"scatter_points2.transfer_properties\","
		+ " \"valueType\": \"string\", \"value\": \"point_normal\"}, {\"valueName\": \"scatter_points2.set_emit_location\", \"valueType\": \"bool\", \"value\": \"true\"}, {\"valueName\": \"scatter_points2.set_orientations_from_geometry\", \"valueType\": \"bool\", \"value\": \"true\"}, {\"valueName\": \"scatter_points2.normal_mode\", \"valueType\": \"Modeling::Points::OrientPointsNormalMode\", \"value\": \"point_normal\"}, {\"valueName\": \"scatter_points2.tangent_mode\", \"valueType\": \"Modeling::Points::OrientPointsTangentMode\", \"value\": \"UV\"}, {\"valueName\": \"scatter_points2.prioritize_normal\", \"valueType\": \"bool\", \"value\": \"true\"}, {\"valueName\": \"scatter_points2.seed\", \"valueType\": \"long\", \"value\": \"2\"}, {\"valueName\": \"scatter_points2.max_number\", \"valueType\": \"long\", \"value\": \"1000000\"}, {\"valueName\": \"create_mesh_sphere.radius\", \"valueType\": \"float\","
		+ " \"value\": \"3f\"}, {\"valueName\": \"create_mesh_sphere.height_segments\", \"valueType\": \"int\", \"value\": \"20L\"}, {\"valueName\": \"create_mesh_sphere.axis_segments\", \"valueType\": \"int\", \"value\": \"20L\"}, {\"valueName\": \"create_mesh_sphere.base_to_pivot\", \"valueType\": \"bool\", \"value\": \"true\"}, {\"valueName\": \"push.amount\", \"valueType\": \"float\", \"value\": \"0.0199999996f\"}], \"reservedNodeNames\": [{\"name\": \"output\"}]}]}");
createNode transform -n "grow";
	rename -uid "8BA0E7A7-47EC-0141-432F-F1B1E869244C";
	setAttr ".s" -type "double3" 1.000000000000004 1.000000000000004 1.000000000000004 ;
createNode bifrostGraphShape -n "growShape" -p "grow";
	rename -uid "CAE348AD-4FFC-D2D6-FF4A-3EA0800334DC";
	addAttr -r false -ci true -k true -m -sn "JobPorts___Amino_IsEnabledTerminal_Table" 
		-ln "JobPorts___Amino_IsEnabledTerminal_Table" -min 0 -max 1 -at "bool";
	addAttr -w false -ci true -sn "Core__Graph__terminal__final" -ln "Core__Graph__terminal__final" 
		-dt "bifData";
	addAttr -w false -ci true -sn "Core__Graph__terminal__proxy" -ln "Core__Graph__terminal__proxy" 
		-dt "bifData";
	addAttr -w false -ci true -sn "Core__Graph__terminal__diagnostic" -ln "Core__Graph__terminal__diagnostic" 
		-dt "bifData";
	addAttr -r false -ci true -k true -sn "sphere_mesh" -ln "sphere_mesh" -dt "bifData" 
		-dt "vectorArray" -dt "doubleArray" -dt "nurbsCurve" -dt "mesh";
	addAttr -r false -ci true -k true -sn "attractors" -ln "attractors" -dt "bifData" 
		-dt "vectorArray" -dt "doubleArray" -dt "nurbsCurve" -dt "mesh";
	addAttr -r false -ci true -k true -sn "seeds" -ln "seeds" -dt "bifData" -dt "vectorArray" 
		-dt "doubleArray" -dt "nurbsCurve" -dt "mesh";
	addAttr -w false -ci true -sn "out_sphere_mesh" -ln "out_sphere_mesh" -dt "bifData";
	addAttr -w false -ci true -sn "out_geometry" -ln "out_geometry" -dt "bifData";
	addAttr -r false -ci true -k true -sn "JobPorts__time" -ln "JobPorts__time" -at "time";
	setAttr -k off ".v";
	setAttr -s 2 ".iog";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sc" -type "string" (
		"{\"header\": {\"metadata\": [{\"metaName\": \"adskFileFormatVersion\", \"metaValue\": \"100L\"}]}, \"dependencies\": [{\"uri\": \"file:///bifrost_object_i.json\"}, {\"uri\": \"file:///Math_types.json\"}, {\"uri\": \"file:///CoreArrayOps.json\"}, {\"uri\": \"file:///bifrost_geometry_query_types.json\"}, {\"uri\": \"file:///geometry_types.json\"}, {\"uri\": \"file:///get_property_any.json\"}, {\"uri\": \"file:///get_property.json\"}, {\"uri\": \"file:///get_geo_property.json\"}, {\"uri\": \"file:///get_point_position.json\"}, {\"uri\": \"file:///Math_conversion.json\"}, {\"uri\": \"file:///has_property.json\"}, {\"uri\": \"file:///create_volume_geo_prop.json\"}, {\"uri\": \"file:///is_a.json\"}, {\"uri\": \"file:///create_object_from_schema.json\"}, {\"uri\": \"file:///is_a_mesh.json\"}, {\"uri\": \"file:///is_a_strands.json\"}, {\"uri\": \"file:///is_a_points.json\"}, {\"uri\": \"file:///is_a_volume.json\"},"
		+ " {\"uri\": \"file:///get_geo_schema_type.json\"}, {\"uri\": \"file:///switch_is_a.json\"}, {\"uri\": \"file:///get_target_component.json\"}, {\"uri\": \"file:///create_data_geo_prop.json\"}, {\"uri\": \"file:///set_property_any.json\"}, {\"uri\": \"file:///set_property.json\"}, {\"uri\": \"file:///get_geo_component_count.json\"}, {\"uri\": \"file:///set_geo_property.array.json\"}, {\"uri\": \"file:///set_geo_property.scalar.json\"}, {\"uri\": \"file:///Math_long.json\"}, {\"uri\": \"file:///Math_float.json\"}, {\"uri\": \"file:///Math_double.json\"}, {\"uri\": \"file:///Math_bool.json\"}, {\"uri\": \"file:///Math_char.json\"}, {\"uri\": \"file:///Math_int.json\"}, {\"uri\": \"file:///Math_short.json\"}, {\"uri\": \"file:///Math_uchar.json\"}, {\"uri\": \"file:///Math_uint.json\"}, {\"uri\": \"file:///Math_ulong.json\"}, {\"uri\": \"file:///Math_ushort.json\"}, {\"uri\": \"file:///Math_constants.json\"},"
		+ " {\"uri\": \"file:///Core_Array_array_bounds_impl.json\"}, {\"uri\": \"file:///Core_Array_array_bounds.json\"}, {\"uri\": \"file:///Core_Constants_default_value.json\"}, {\"uri\": \"file:///riv_types.json\"}, {\"uri\": \"file:///point_types.json\"}, {\"uri\": \"file:///FCurve.json\"}, {\"uri\": \"file:///riv_ops.json\"}, {\"uri\": \"file:///Math_change_range.json\"}, {\"uri\": \"file:///processing_type.json\"}, {\"uri\": \"file:///venation_node_type.json\"}, {\"uri\": \"file:///Math_array.json\"}, {\"uri\": \"file:///get_geo_property_check.json\"}, {\"uri\": \"file:///get_sub_object.json\"}, {\"uri\": \"file:///get_point_count.json\"}, {\"uri\": \"file:///add_points_to_points.json\"}, {\"uri\": \"file:///validate_points.json\"}, {\"uri\": \"file:///construct_points.json\"}, {\"uri\": \"file:///jotun_rand.json\"}, {\"uri\": \"file:///increment_decrement.json\"}, {\"uri\": \"file:///random_value.json\"},"
		+ " {\"uri\": \"file:///get_property_keys.json\"}, {\"uri\": \"file:///is_empty.json\"}, {\"uri\": \"file:///materials.json\"}, {\"uri\": \"file:///erase_property.json\"}, {\"uri\": \"file:///set_point_shape.json\"}, {\"uri\": \"file:///set_point_size.json\"}, {\"uri\": \"file:///set_point_length.json\"}, {\"uri\": \"file:///int_filter.json\"}, {\"uri\": \"file:///get_array_indices.json\"}, {\"uri\": \"file:///get_strands_structure.json\"}, {\"uri\": \"file:///access_offset_array.json\"}, {\"uri\": \"file:///update_point_strand_index.json\"}, {\"uri\": \"file:///check_point_strand_index.json\"}, {\"uri\": \"file:///update_strands_ratio.json\"}, {\"uri\": \"file:///set_sub_object_property.json\"}, {\"uri\": \"file:///validate_strands.json\"}, {\"uri\": \"file:///construct_strands.json\"}, {\"uri\": \"file:///find_all_in_array.json\"}, {\"uri\": \"file:///remove_first_in_array.json\"}, {\"uri\":"
		+ " \"file:///Core_Array_flatten_nested_array.json\"}, {\"uri\": \"file:///set_strands_shape.json\"}, {\"uri\": \"file:///Math_lerp_with_clamp.json\"}, {\"uri\": \"file:///Core_Array_slice_array.json\"}, {\"uri\": \"file:///Core_Array_empty_array.json\"}, {\"uri\": \"file:///Core_Array_array_is_empty.json\"}, {\"uri\": \"file:///sort_array_and_remove_duplicates.json\"}, {\"uri\": \"file:///object_terminal.json\"}, {\"uri\": \"file:///delete_points_in_points.json\"}, {\"uri\": \"file:///Math_axis_angle_to_quaternion.json\"}, {\"uri\": \"file:///Math_degrees_to_radians.json\"}, {\"uri\": \"file:///Math_multiply_quaternions.json\"}, {\"uri\": \"file:///Math_rotate_by_quaternion.json\"}, {\"uri\": \"file:///build_closest_accelerator.json\"}, {\"uri\": \"file:///sample_closest_point_accelerator.json\"}, {\"uri\": \"file:///simulation_types.json\"}, {\"uri\": \"file:///simulation_nodedefs.json\"},"
		+ " {\"uri\": \"file:///fluids_types.json\"}, {\"uri\": \"file:///volume_types.json\"}, {\"uri\": \"file:///fluids_nodedefs.json\"}, {\"uri\": \"file:///venation_branch_type.json\"}, {\"uri\": \"file:///generate_venation_core.json\"}, {\"uri\": \"file:///get_geo_target_count.json\"}, {\"uri\": \"file:///CoreStringOps.json\"}, {\"uri\": \"file:///volume_nodedefs.json\"}, {\"uri\": \"file:///interpret_auto_port_as_scalar.json\"}, {\"uri\": \"file:///Profiler.json\"}, {\"uri\": \"file:///object_profiler.json\"}, {\"uri\": \"file:///check_point_ratio.json\"}, {\"uri\": \"file:///set_strands_size_profile.json\"}, {\"uri\": \"file:///cumulative_sum_array.json\"}, {\"uri\": \"file:///get_strands_end_points.json\"}, {\"uri\": \"file:///set_strand_length.json\"}, {\"uri\": \"file:///sample_closest_in_radius_accelerator.json\"}, {\"uri\": \"file:///get_points_in_radius.json\"}, {\"uri\": \"file:///generate_venation.json\"}],"
		+ " \"namespaces\": [], \"types\": [], \"compounds\": [{\"name\": \"growShape\", \"metadata\": [{\"metaName\": \"io_nodes\", \"metadata\": [{\"metaName\": \"io_inodes\", \"metadata\": [{\"metaName\": \"scatterShape\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"io_ports\", \"metadata\": [{\"metaName\": \"sphere_mesh\"}, {\"metaName\": \"attractors\"}, {\"metaName\": \"seeds\"}]}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"-1188.66 97.1016\"}]}]}, {\"metaName\": \"io_onodes\", \"metadata\": [{\"metaName\": \"output\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"io_ports\", \"metadata\": [{\"metaName\": \"out_sphere_mesh\"}]}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"-908.468 223.521\"}]}, {\"metaName\":"
		+ " \"output1\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"io_ports\", \"metadata\": [{\"metaName\": \"out_geometry\"}]}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"844.406 148.787\"}]}]}]}, {\"metaName\": \"backdrop\", \"metadata\": [{\"metaName\": \"type\", \"metaType\": \"string\", \"metaValue\": \"backdrop\"}, {\"metaName\": \"color\", \"metaType\": \"string\", \"metaValue\": \"#496d55\"}, {\"metaName\": \"text\", \"metaType\": \"string\", \"metaValue\": \"set color from world position\"}, {\"metaName\": \"coords\", \"metaType\": \"string\", \"metaValue\": \"-321.432 50.7044 1104.36 472.265\"}]}, {\"metaName\": \"backdrop1\", \"metadata\": [{\"metaName\": \"type\", \"metaType\": \"string\", \"metaValue\": \"backdrop\"}, {\"metaName\": \"color\", \"metaType\": \"string\", \"metaValue\": \"#6d4141\"},"
		+ " {\"metaName\": \"text\", \"metaType\": \"string\", \"metaValue\": \"Grow veins\"}, {\"metaName\": \"coords\", \"metaType\": \"string\", \"metaValue\": \"-648.743 58.6463 294.1 410.998\"}]}, {\"metaName\": \"blackListed\", \"metaValue\": \"true\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"BifrostGraph,MJCG::Modeling::Growth,generate_venation\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"BifrostGraph,Geometry::Properties,get_geo_property\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"BifrostGraph,Core::Math,lerp\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"BifrostGraph,Geometry::Strands::Internal,update_strands_ratio\"}, {\"metaName\": \"_recentNode_\", \"metaType\": \"string\", \"metaValue\": \"output\"}, {\"metaName\": \"ViewportRect\", \"metaType\": \"string\","
		+ " \"metaValue\": \"-1268.52 -503.683 2419.38 1580.05\"}], \"ports\": [{\"portName\": \"out_sphere_mesh\", \"portDirection\": \"output\", \"portType\": \"Amino::Object\"}, {\"portName\": \"sphere_mesh\", \"portDirection\": \"input\", \"portType\": \"Amino::Object\"}, {\"portName\": \"attractors\", \"portDirection\": \"input\", \"portType\": \"Amino::Object\"}, {\"portName\": \"seeds\", \"portDirection\": \"input\", \"portType\": \"Amino::Object\"}, {\"portName\": \"out_geometry\", \"portDirection\": \"output\", \"portType\": \"Amino::Object\"}], \"compoundNodes\": [{\"nodeName\": \"get_point_position\", \"nodeType\": \"Geometry::Properties::get_point_position\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"-301.812 210.935\"}]}, {\"nodeName\": \"set_geo_property\", \"nodeType\":"
		+ " \"Geometry::Properties::set_geo_property\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"513.973 75.3135\"}]}, {\"nodeName\": \"array_bounds\", \"nodeType\": \"Core::Array::array_bounds\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"-27.3622 297.619\"}]}, {\"nodeName\": \"change_range\", \"nodeType\": \"Core::Math::change_range\", \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"247.544 189\"}]}, {\"nodeName\": \"generate_venation\", \"nodeType\": \"MJCG::Modeling::Growth::generate_venation\", \"deactivatedTerminals\": [\"Core::Graph::terminal::final\","
		+ " \"Core::Graph::terminal::diagnostic\", \"Core::Graph::terminal::proxy\"], \"metadata\": [{\"metaName\": \"DisplayMode\", \"metaType\": \"string\", \"metaValue\": \"2\"}, {\"metaName\": \"LayoutPos\", \"metaType\": \"string\", \"metaValue\": \"-612.717 99.3506\"}]}], \"connections\": [{\"source\": \"array_bounds.min_bound\", \"target\": \"change_range.from_start\"}, {\"source\": \"array_bounds.max_bound\", \"target\": \"change_range.from_end\"}, {\"source\": \".sphere_mesh\", \"target\": \".out_sphere_mesh\"}, {\"source\": \".attractors\", \"target\": \"generate_venation.attractor_points\"}, {\"source\": \".seeds\", \"target\": \"generate_venation.seed_points\"}, {\"source\": \"set_geo_property.out_geometry\", \"target\": \".out_geometry\"}, {\"source\": \"get_point_position.point_position\", \"target\": \"array_bounds.array\"}, {\"source\": \"get_point_position.point_position\", \"target\":"
		+ " \"change_range.value\"}, {\"source\": \"change_range.result\", \"target\": \"set_geo_property.data\"}, {\"source\": \"generate_venation.strands\", \"target\": \"set_geo_property.geometry\"}, {\"source\": \"generate_venation.strands\", \"target\": \"get_point_position.geometry\"}], \"values\": [{\"valueName\": \"set_geo_property.property\", \"valueType\": \"string\", \"value\": \"color\"}, {\"valueName\": \"set_geo_property.target\", \"valueType\": \"string\", \"value\": \"point_component\"}, {\"valueName\": \"change_range.to_start\", \"valueType\": \"Math::float3\", \"value\": {\"x\": \"0f\", \"y\": \"0f\", \"z\": \"0f\"}}, {\"valueName\": \"change_range.to_end\", \"valueType\": \"Math::float3\", \"value\": {\"x\": \"1f\", \"y\": \"1f\", \"z\": \"1f\"}}, {\"valueName\": \"generate_venation.processing_mode\", \"valueType\": \"MJCG::processingType\", \"value\": \"Simulation\"}, {\"valueName\":"
		+ " \"generate_venation.start_frame\", \"valueType\": \"float\", \"value\": \"1f\"}, {\"valueName\": \"generate_venation.use_end_frame\", \"valueType\": \"bool\", \"value\": \"false\"}, {\"valueName\": \"generate_venation.end_frame\", \"valueType\": \"float\", \"value\": \"100f\"}, {\"valueName\": \"generate_venation.max_iterations\", \"valueType\": \"long\", \"value\": \"100\"}, {\"valueName\": \"generate_venation.attraction_radius\", \"valueType\": \"float\", \"value\": \"0.100000001f\"}, {\"valueName\": \"generate_venation.kill_radius\", \"valueType\": \"float\", \"value\": \"0.0399999991f\"}, {\"valueName\": \"generate_venation.min_step_length\", \"valueType\": \"float\", \"value\": \"0.0199999996f\"}, {\"valueName\": \"generate_venation.seed_points\", \"valueType\": \"Amino::Object\", \"value\": {}}, {\"valueName\": \"generate_venation.seed_size\", \"valueType\": \"float\", \"value\": \"0.00999999978f\"},"
		+ " {\"valueName\": \"generate_venation.size_profile\", \"valueType\": \"Amino::FCurve\", \"value\": {\"version\": \"1\", \"preExtrapolation\": \"0\", \"postExtrapolation\": \"0\", \"points\": [{\"point\": {\"locked\": \"1\", \"interpolation\": \"1\", \"pcn\": {\"xp\": \"-0.182148\", \"yp\": \"0.998942\", \"x\": \"0\", \"y\": \"1\", \"xn\": \"0.182148\", \"yn\": \"1.001058\"}}}, {\"point\": {\"locked\": \"1\", \"interpolation\": \"1\", \"pcn\": {\"xp\": \"0.86513099999999998\", \"yp\": \"0.113507\", \"x\": \"1\", \"y\": \"0.10000000000000001\", \"xn\": \"1.1348689999999999\", \"yn\": \"0.086493\"}}}]}}, {\"valueName\": \"generate_venation.max_step_length\", \"valueType\": \"float\", \"value\": \"0.0299999993f\"}, {\"valueName\": \"generate_venation.step_length_seed\", \"valueType\": \"long\", \"value\": \"0\"}, {\"valueName\": \"generate_venation.clamp_step_angle\", \"valueType\": \"bool\","
		+ " \"value\": \"true\"}, {\"valueName\": \"generate_venation.min_step_angle\", \"valueType\": \"float\", \"value\": \"0f\"}, {\"valueName\": \"generate_venation.max_step_angle\", \"valueType\": \"float\", \"value\": \"10f\"}, {\"valueName\": \"generate_venation.clamp_branch_angle\", \"valueType\": \"bool\", \"value\": \"true\"}, {\"valueName\": \"generate_venation.min_branch_angle\", \"valueType\": \"float\", \"value\": \"0f\"}, {\"valueName\": \"generate_venation.max_branch_angle\", \"valueType\": \"float\", \"value\": \"30f\"}, {\"valueName\": \"generate_venation.display_nodes\", \"valueType\": \"bool\", \"value\": \"true\"}, {\"valueName\": \"generate_venation.display_attraction_radius\", \"valueType\": \"bool\", \"value\": \"false\"}, {\"valueName\": \"generate_venation.display_kill_radius\", \"valueType\": \"bool\", \"value\": \"false\"}], \"reservedNodeNames\": [{\"name\": \"output\"}, {\"name\": \"scatterShape\"}, {\"name\": \"output1\"}]}]}");
	setAttr ".dirtyFlag" yes;
	setAttr -k on ".sphere_mesh";
	setAttr -k on ".attractors";
	setAttr -k on ".seeds";
	setAttr -k on ".JobPorts__time";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "9FA72B26-4E34-F22E-0696-A68D7C544690";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "9F5A2E2A-4E97-13B3-8B5B-17A430699ED2";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "8D4B5DBD-4E38-1654-41AF-168F202E3D3F";
createNode displayLayerManager -n "layerManager";
	rename -uid "6C0D94AE-48DD-3917-3D09-0EA2F18C65CC";
createNode displayLayer -n "defaultLayer";
	rename -uid "C285957A-4EF7-89D7-6A0F-4E88432F4301";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "57E17C24-42D6-1A23-F03B-DAAEA8C8D30B";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "894AB470-4821-E478-BCBB-CD8A01D338FB";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "5B359343-4FE6-3A2F-022C-95ACE36E3D11";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 0\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 0\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 0\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 0\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 1\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1803\n            -height 534\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"\")) -mbv $menusOkayInPanels  $panelName;\n"
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
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -connectionMinSegment 0.03\n"
		+ "                -connectionOffset 0.03\n                -connectionRoundness 0.8\n                -connectionTension -100\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -connectionMinSegment 0.03\n                -connectionOffset 0.03\n                -connectionRoundness 0.8\n                -connectionTension -100\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n"
		+ "                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n"
		+ "                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n"
		+ "                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n"
		+ "            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -autoExpandAnimatedShapes 1\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n"
		+ "            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n"
		+ "\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap true\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1803\\n    -height 534\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1803\\n    -height 534\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
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
	rename -uid "58466B88-4E3B-1CC6-2ECF-90A30107721A";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -9266.6662984424329 -1152.6277525664643 ;
	setAttr ".tgi[0].vh" -type "double2" 9263.0948700129211 2693.1717352261567 ;
	setAttr -s 3 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 221.5579833984375;
	setAttr ".tgi[0].ni[0].y" 272.46514892578125;
	setAttr ".tgi[0].ni[0].nvs" 18313;
	setAttr ".tgi[0].ni[1].x" -375.71429443359375;
	setAttr ".tgi[0].ni[1].y" 477.14285278320313;
	setAttr ".tgi[0].ni[1].nvs" 18313;
	setAttr ".tgi[0].ni[2].x" -68.009902954101563;
	setAttr ".tgi[0].ni[2].y" 438.21502685546875;
	setAttr ".tgi[0].ni[2].nvs" 18312;
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
	setAttr -s 2 ".dsm";
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
connectAttr "scatterShape.sphere_mesh" "growShape.sphere_mesh";
connectAttr "scatterShape.attractors" "growShape.attractors";
connectAttr "scatterShape.seeds" "growShape.seeds";
connectAttr ":time1.o" "growShape.JobPorts__time";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "blinn1SG.msg" "materialInfo2.sg";
connectAttr "growShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "scatterShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr ":time1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "growShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "scatterShape.iog" ":initialShadingGroup.dsm" -na;
// End of venation_sphere.ma
