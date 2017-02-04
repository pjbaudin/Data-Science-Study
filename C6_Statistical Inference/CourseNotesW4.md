# Course notes - Statistical Inference Week 4

## Power

We've talked about a Type I error, rejecting the null hypothesis when it's true. We've structured our hypothesis test so that the probability of this happening is small. The other kind of error we could make is to fail to reject when the alternative is true (Type II error). Or we might think about the probability of rejecting the null when it is false. This is called Power = 1 - Type II error. We don't have as much control over this probability, since we've spent all of our flexibility guaranteeing that the Type I error rate is small.

One avenue for the control of power is at the design phase. There, assuming our finances let us, we can pick a large enough sample size so that we'd be likely to reject if the alternative is true. Thus the most frequent use of power is to help us design studies.

### Introduction

Power is the probability of rejecting the null hypothesis when it is false

A type II error (a bad thing) is failing to reject the null hypothesis when it's false; the probability of a type II error is usually called beta.

Note: Power = 1 - beta

### Calculating power

For gaussian data, we reject if z-statistic is lower than z1 - alpha

See R practice script

### Notes on power

Calculation for Ha : mu < mu0 is similar to mu > mu0

For Ha : mu != mu0, calculate the one sided power using alpha/2 (this is only approximately right, it excluded the probability of getting a large TSnin the opposite direction of the truth)

- Power goes up as alpha gets larger
- Power of a one sided test is greater than the power of the associated two-sided test
- Power goes up as mu1 gets further away from mu0
- Power goes up as n goes up
- Power goes up as sigma goes down

Power doesn't need mua, sigma and n, instead only:
sqrt(n)*(mua - mu0) / sigma
- The quantity (mua - mu0)/sigma is called the **effect size**, the difference in the means in standard deviation units
- The effect size, being unit freee, it has some hope of interpretability across settings

### T test power

Consider calculating power for a Gossett's T test four our example using power.t.test()
- Omit one of the arguments and it solves for it
