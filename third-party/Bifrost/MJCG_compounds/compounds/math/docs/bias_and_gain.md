# `bias and gain`

An implementation of Jonathan T. Barron’s "A Convenient Generalization of Schlick’s Bias and Gain Functions".

Paper: https://arxiv.org/pdf/2010.09714.pdf

## Inputs

### `value`
A value or an array of scalar values between 0 and 1.

### `slope`
A value less than 1 will make the curve more sloped (exponential easing).
A value greater than 1 will make the curve to be straighter (linear easing).
A value of 1 will make the curve to keep a linear slope.

### `threshold`
This has to be a value between 0 and 1.
A value close to 0 will yield an "in" easing.
A value close to 1 will yield an "out" easing.
A value of 0.5 will yield a curve similar to an "in out" easing.

## Outputs

### `output`
The smoothed value.
