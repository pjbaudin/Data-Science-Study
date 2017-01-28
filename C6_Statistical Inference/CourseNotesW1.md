# Course notes - Statistical Inference

## Probability

Given a random experiment, a probability measure is a population quantity that summarizes the randomness.

Specifically, probability takes a possible outcome from the experiment and:
- assigns it a number between 0 and 1
- so that the probability that something occurs is 1 and
- so that the probability of the union of any two sets of outcomes that have nothing in common (mutually exclusive) is their respective probabilities

P(A U B) = P(A) + P(B)

**Rules probability must follow:**

The probability that nothing occurs is 0

The probability that something occurs is 1

The probability of something is 1 minus the probability that the opposite occurs

The probability of at least one or two (or more) things that can not simultaneously occur (mutually exclusive) is the sum of their respective probabilities.

If an event A implies the occurrence of event B, then the probability of A occurring is less than the probability that B occurs. If A is a subset of B, then P(A) < P(B).

For nay two events the probability that at least one occurs is the sum of their probabilities minus their intersection.

P(A U B) = P(A) + P(B) - P(A N B)

## Probability Mass Function

Probability calculus is useful for understanding the rules that probabilities must follow.

However, we need ways to model and think about probabilities for numeric outcomes of experiments (broadly defined).

Densities and mass functions for random variables are the best starting point for this.

Remember, everything we're talking about up to this point is a population quantity not a statement about what occurs in the data.

-> Use the data to estimate properties of the population

**Random variables**

A random variable is a numerical outcome of an experiment discrete or continuous.

A **probability mass function (PMF)** evaluated at a value corresponds to the probability that a random variable takes that value. To be valid PMF a function p() must satisfy:
 - It must always be larger than or equal to 0
 - The sum of the possible values that the random variable can take has to add up to one

A **probability density function (PDF)** is a function associated with a continuous random variable.
To be valid a PDF must satisfy:
- It must be larger than or equal to zero everywhere
- The total area under it must be one

Areas under PDFs correspond to probabilities for that random variable
