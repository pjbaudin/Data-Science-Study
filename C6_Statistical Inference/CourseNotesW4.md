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


## Multiple Comparisons

### Key ideas

- Hypothesis testing/significance analysis is commonly overused
- Correcting for multiple testing avoids false positives or discoveries
- Two key components
      - Error measure
      - Correction

### Error rates

- FAlse positive rate: the rate at which false results (beta = 0) are called significant E[V / m0]
- Family wise error rate (FWER): the probabiltiy of at least one false positive Pr(V>= 1)
- False discovery rate (FDR): the rate at which claims of significance are false E[V/R]
      - The false positive rate is closely related to the type I error rate

https://en.wikipedia.org/wiki/False_positive_rate

### Controlling the false positive rate

If p-values are correctly calculated calling P < alpha significant will control the false positive rate at level alpha on average.

### Controlling family-wise error rate (FWER)
The Bonferroni correction is the oldest multiple testing correction.

Basic idea:
- suppose you do m tests
- you want to control FWER at level alpha so Pr(V >= 1) < alpha
- calculate p-values normally
- set alpha_fwer = alpha / m
- call all p-values less than alpha_fwer significant

PROs: Easy to calculate, conservative

CONs: May be very conservative

### Controlling false discovery rate (FDR)

This is the most popular correction when performing lots of tests say in genomics, imaging, astronomy, or other signal-processing disciplines

Basic idea:
- suppose you do m tests
- you want to control FDR at level alpha so E[V/R]
- calculate p-values normally
- order the p-values from smallest to largest
- call any P(i) <= alpha * i / m significant

PROs: Still pretty easy to calculate, less conservative (maybe much less)

CONs: Allows for more false positives, may behave strangely under dependence

### Adjusted p-values

- One approach is to adjust the threshold alpha
- A different approach is to calculate "adjusted p-values"
- They are not p-values anymore
- But they can be used directly without adjusting alpha

### Notes and resources

- Multiple testing is an entire subfield
- A basic Bonferroni/BH correction is usually enough
- If there is strong dependencies between tests there may be problems
      - consider method = "BY"
