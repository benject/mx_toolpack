# `bias`

An implementation of Christophe Schlick’s Bias function.

Source formula taken from Jonathan T. Barron's Bias and Gain paper: https://arxiv.org/pdf/2010.09714.pdf

## Inputs

### `value`
A value or an array of scalar values between 0 and 1.

### `bias`
Defines the shape of the slope. This has to be a value between 0 and 1.
A value close to 0 will yield a slope steeper near the curve's center.
A value close to 1 will yield a slope steeper at the curve start & end.
A value of 0.5 does not affect the input value.

## Outputs

### `output`
The smoothed value.
