# Roadmap

#### TODO
	● "generate_ivy" fix issue with time node triggering per frame recomputation, even with "Iteration" mode.
	● "generate_venation" fix issue with time node triggering per frame recomputation, even with "Iteration" mode.
	● Do an optimization pass on all compounds: 
		● Pre-allocate array and use set_in_array inside loops instead of using build_array.
		● Remove slice nodes and use start as current_index instead.
	● "update_strands_orientations". Add a check on rotate_orientations so skip compute when zeroed.
	● "update_strands_orientations_from_closest". replace internal update_tangents.

#### Future enhancements
	● generate_ivy: 
		● Add scene_scale parameters to scale all length / scale related parameters.
		● Add curve tropism.
		● Add petiole support for more realistic leaf generation.
		● Improve performance.
	● generate_venation: 
		● Add ability to art direct growth speed (using attractor geo property, field sampling, fcurve)...
		● Add tropism.
	● generate_L_system: 
		●Add partial generation support.
		● Add tropism.
	● compute_graph_coloring: Improve algorithms when the sort array with indices node is released (greedy and degrees).
	● strands_wrap_deformer: add options to disable deformation (xform only).
	● Add Interpreted auto port to more eligible compounds.
	● Switch slice method in strands compounds ( slice size >= 5000 ? array_slice : small_slice).

#### Hair system
	● Hair interpolation between guides.
	● Hair generation from mesh.
	● Hair clumping.
	● Hair parting (by region map, split by curve...).
	● Many modifiers with interpreted auto ports, paintable maps...