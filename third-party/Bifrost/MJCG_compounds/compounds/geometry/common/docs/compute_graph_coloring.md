# `compute_graph_coloring`

Applies color labels to a set of component. Graph coloring ensures two neighbors can not have the same color label, while trying to use the minimum number of colors.

This is an implementation of the parallel `Largest-Degree-First` graph coloring algorithm. This compound uses only neighbor indices to performs the coloring which makes it component agnostic, meaning that it can be used to color any type of component such as points, edges, faces or custom.

For more information on graph coloring: https://en.wikipedia.org/wiki/Graph_coloring

## Inputs

### `neighbors`
A two-dimensional array holding the neighbor indices of each component.

### `algorithm`

The algorithm to use to color the input components.

* `Greedy:` Iterates on each component sequentially and use the smallest available color among its neighbors. This algorithm is slow due to it's sequential computation but may uses the less colors.

* `Jones-Plassmann:` For each component, check if its unique random value is the highest among its uncolored neighbors. If true, colors the component with the smallest available color. The operation is repeated until all components are colored. This algorithm is fast due to its parallel computation but may use more colors.

* `Welsh-Powell:` For each component, check if its neighbor count is the highest among its uncolored neighbors. If true, colors the component with the smallest available color.
In case of conflicts (equal neighbor counts), The highest index value is used to determinate if the component should be colored. The operation is repeated until all components are colored. This algorithm is fast due to its parallel computation but can get slow when used on homogenous graphs. Though, it may use the optimal number of colors.

### `seed`
A random seed to change the random value distribution for the `Jones-Plassmann` algorithm.

## Outputs

### `colored`
The component's color labels.
