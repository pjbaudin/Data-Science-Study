# Course notes - Statistical Inference Week 4

## Power

We've talked about a Type I error, rejecting the null hypothesis when it's true. We've structured our hypothesis test so that the probability of this happening is small. The other kind of error we could make is to fail to reject when the alternative is true (Type II error). Or we might think about the probability of rejecting the null when it is false. This is called Power = 1 - Type II error. We don't have as much control over this probability, since we've spent all of our flexibility guaranteeing that the Type I error rate is small.

One avenue for the control of power is at the design phase. There, assuming our finances let us, we can pick a large enough sample size so that we'd be likely to reject if the alternative is true. Thus the most frequent use of power is to help us design studies.

### Introduction

Power is the probability of rejecting the null hypothesis when it is false

A type II error (a bad thing) is failing to reject the null hypothesis when it's false; the probability of a type II error is usually called beta.

Note: Power = 1 - beta
