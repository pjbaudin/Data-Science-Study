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

See practice in the corresponding R script

**CDF and survival function**

The **cumulative distribution function** (CDF) of a random variable, X, returns the probability that the random variable is less than or equal to the value x:

F(x) = P(X <= x)  (use the pbeta function)

The **survival function** of a random variable X is defined as the probability that the random variable is greater than the valuex:

S(x) = P(X > x) = 1 - F(x)

**Quantiles**

The alpha th quantile of a distribution with distribution function  is thepoint x alpha so that:

F(x alpha) = alpha

- A **percentile** is simply a quantile with alpha expressed as a percent
- The **median** is the 50th percentile

R can approximate quantiles for common distributions: qbeta function

**Summary**
- Reference to **population quantities**, therefore the median being discussed is the **population median**
- A probability model connects the data to the population using assumptions
- Therefore the median we're discussing is the **estimand**, the smaple median wil be the **estimator**

## Module 3: Conditional Probabiltiy

*Conditional probability is a very intuitive idea: What is the probability given partial information about what has occurred?. The probability of getting hit by lighting is small. However, it's much larger for people playing outside in open fields during a lighting storm!*

**Conditional Probability**

Let B be  an event so that P(B) > 0

P(A | B) = P(A N B) / P(B)

P(A | B) = P(A) x P(B) / P(B) = P(A)

**Bayes's rule**

Conditional probability in the context of diagnostic tests

Let + and - be the events that the result of a diagnostic test is positive or negative respectively

Let D and Dc be the event that the subject of the test has or does not have the disease respectively

Sensitivity = P(+ | D)

For a good test, we want the Sensitivity to be high

Specificity = P(- | Dc)

For a good test, we want the Specificity to be high

Positive Predictive Value = P(D | +)

Negative Predictive Value = P(Dc | -)

Prevalence of the disease = P(D)

**Likelihood ratios**

P(D | +) = (P(+ | D) x P(D)) / (P(+ | D)P(D) + P(+ | Dc) x P(Dc))

P(Dc | +) = (P(+ | Dc) x P(Dc)) / (P(+ | D)P(D) + P(+ | Dc) x P(Dc))

Denominator is identical

Odds of disease given a positive test result:

P(D | +) / P(Dc | +) = P(+ | D) / P(+ | Dc) x P(D) / P(Dc)

First factor is the *diagnostic likelihood ratio* (DLR) for a positive test result.

In other words:

**post-test odds of D = DLR+ x pre-test odds of D**


**Independence**

Event A is independent of event B if P(A | B) = P(A) where P(B) >0

In other words: P(A N B) = P(A) x P(B)

**Multiplying probabilities without independence, that is P(A1 N A2) is not necessarily equal to P(A1)P(A2)**

**Independent and Identically distributed (IID) random variables**

Random variables are said to be IID if they are independent and identically distributed:
- Independent: statistically unrelated from one and another
- Identically distributed: all having been drawn from the same population distribution

IID random variables are the default model for random samples

## Module 4:  Expected Values

*The empirical average is a very intuitive idea; it's the middle of our data in a sense. But waht is estimating? We can formally define the middle of a population distribution. This is the expected value. Expected values are very useful for characterizing populations and usually represent the first thing that we're interested in estimating.*

**Expected Values**

Based on statistical inference:
The process of making conclusions about popultations from noisy data that was drawn from it.

The **mean** is a characterization of its center.

The **variance** and **standard deviation** are characterizatiosn of how spread out is the data.

Our sample expected values (the sample mean and variance) will estimate the populatio versions.

The center of mass of the data is the empirical mean.

**Expected Values for PDFs**

For a continuous random variable, X, with density f, the expected value is again exactly the center of mass of the density.

**Facts about expected values**

Recall that expected values are properties of distributions.

Note the average of random variables is itself a random variable and its associated distribution has an expected value.

The center of this distribution is the same as that of the original distribution.

The sample mean is unbiased because its distribution is centered at what it's trying to estimate.

**Summary**

- Expected values are properties of distributions
- The population mean is the center of mass of population
- The sample mean is the center of amss of the observed data
- The sample mean is an estimate of the population mean
- The sample mean is unbiased
      - The population mean of its distribution is the mean that it's trying to estimate
- The more data that goes into the sample mean, the more concentrated its density / mass function is around the population mean.

## From SWIRL Practice

First, a statistic (singular) is a number computed from a sample of data. We use statistics to infer information about a population. Second, a random variable is an outcome from an experiment. Deterministic processes, such as computing means or variances, applied to random variables, produce additional random variables which have their own distributions.

Finally, there are two broad flavors of inference. The first is frequency, which uses "long run proportion of times an event occurs in independent, identically distributed repetitions." The second is Bayesian in which the probability estimate for a hypothesis is updated as additional evidence is acquired.

A random variable is a numerical outcome of an experiment. It can be discrete (take on only a countable number of possibilities), or continuous (take on any value on the real line or subset of it).

integrate(mypdf, lower = 0, upper = 1.6)

From the definition of P(A|B), we can write P(A&B) = P(A|B) * P(B)

P(B|A) = P(B&A)/P(A) = P(A|B) * P(B)/P(A). This is a simple form of Bayes' Rule which relates the two conditional probabilities.

Suppose we don't know P(A) itself, but only know its conditional probabilities, that is, the probability that it occurs if B occurs and the probability that it occurs if B doesn't occur. These are P(A|B) and P(A|~B), respectively. We use ~B to represent 'not B' or 'B complement'.

We can then express P(A) = P(A|B) * P(B) + P(A|~B) * P(~B) and substitute this is into the denominator of Bayes' Formula.

P(B|A) = P(A|B) * P(B) / ( P(A|B) * P(B) + P(A|~B) * P(~B) )

By Bayes' Formula, P(D|+) = P(+|D) * P(D) / ( P(+|D) * P(D) + P(+|~D) * P(~D) )

P(+|D) and P(-|~D), (test sensitivity and specificity respectively) are accuracy rates of a diagnostic test for the two possible results. They should be close to 1 because no one would take an inaccurate test.

Since DLR_+ = P(+|D) / P(+|~D) we recognize the numerator as test sensitivity and the denominator as the complement of test specificity.

P(D|+) / P(~D|+) = P(+|D) * P(D) / (P(+|~D) * P(~D)) = P(+|D)/P(+|~D) * P(D)/P(~D)

A DLR_+ value equal to N indicates that the hypothesis of disease is N times more supported by the data than the hypothesis of no disease.

The expected value of a random variable X, E(X), is a measure of its central tendency. For a discrete random variable X with PMF p(x), E(X) is defined as a sum, over all possible values x, of the quantity x*p(x). E(X) represents the center of mass of a collection of locations and weights, {x, p(x)}.
