# `sample_points_by_radius`

Sample points by radius does a weighted average of a point-property. 

This node combines the functionality of `get_points_in_radius` and `sample_property` to give a weighted average of the found points. For each position input, it will search a radius for points of another geometry, and return a weighted average of some property. 

To use it, plug in a target `geometry`, `positions` to search, and a property to use. 

## Search

`max_radius`, `enable_max_number`, and `max_number` control how many points are considered. These settings control the search, the same as `get_points_in_radius`. 

## Property

Here a property is specified, in the same way as `sample_property`. 

## Weights

The found points are weighted so that further away ones have less effect than nearby ones.  

`exponent` controls the falloff curve. 

When `use_inverse_distance` is on, closer points will have far more influence than further away ones, with a falloff similar to the inverse square law. The forumala is (1 / distance) ^ exponent. `max_radius` has no effect. This results in a sharper result. 

When `use_inverse_distance` is on, the falloff is linear from 0 to max_distance, with an exponent applied. This means that nearly points tend to all have similar weights, resultingin a "blurrier" result. 

## Distance Falloff

With the distance falloff F-Curve enabled, values themselves get weaker with distance. Values softly blend to zero as the samples found get further away. For example, if only one values were found for a position at the edge of the search radius, the value returned may be almost zero. Ther result of this is a soft falloff (governed by the F-Curve) to the default value where points get further away. 

With distance falloff enabled, values are a pure weighted average. If a single sample is found anywhere in the search radius, that value is returned exactly. The result of this are full values, but that go sharply to zero when the radius is exceeded. 