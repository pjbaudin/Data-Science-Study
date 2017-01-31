# Course notes - Statistical Inference Week 2

## Variability, Distribution, & Asymptotics

An important characterization of a population is how spread out it is. One of the key measures of spread is variability. We measure population variability with the sample variance, or more often we consider the square root of both, called the standard deviation. The reason for taking the standard deviation is because that measure has the same units as the population. So if our population is a length measurement in meters, the standard deviation is in meters (whereas the variance is in meters squared).

Variability has many important uses in statistics. First, the population variance is itself an intrinsically interesting quantity that we want to estimate. Secondly, variability in our estimates is what makes them not imprecise. An important aspect of statistics is quantifying the variability in our estimates.

### Introduction to variability

The variance of a random variable is a measure of spread.

Var(X) = E[(X - mu)^2]

The squre root of the variance is called the **standard deviation**

Var(X) = E[X^2] - E[X]^2 = p(1 - p)

The sample variance

It has and associate population distribution

Its expected value is the population variance

### Standard Error of the Mean

The average of random sample from a population is itself a random variable.

E[Xbar] = mu

The standard deviation of a statistic standard error:

Var(Xbar) = sigma^2 / n

**Summary**

The sample variance, S^2, esptimates the population variance, sigma^2

The distribution os the sample variance is centered around sigma^2

The variance of a sample mean is sigma^2 / n:
- its logical estimate is s^2 / n
- the logical estimate of the **standard error** is S / sqrt(n)

S, the standard deviation, talks abtou how variable the population is

S / sqrt(n), the standard error, talks about how variable averages of random samples of size n from the population are.

(see simulation example in R script)

Standard uniforms have variance 1/12 means of random sample of n uniforms have sd 1 / sqrt(12 * n)

Poisson (4) have variance 4 means of random samples of n Poisson(4) have sd 2 / sqrt(n)

**Summary about variances**

- The sample variance estimates the population variance
- The distribution of the sample variance is centered at what it's estimating (unbiased)
- It gets more concentrated around the population variance with larger sample sizes (mroe data = better estimate)
- The variance of the sample mean is the population variance divided by n

## Distributions

Some probability distributions are so important that we need to internalize their characteristics. In these lectures we cover the most important probability distributions.

### The Bernoulli Distribution

The Bernoulli distribution arises as the result of a binary outcome.

Bernoulli random variables take (only) the values 1 and 0 with probabilities of (say) p and 1 - p respectively.

P(X = x) = p^x (1 - p)^(1-x)

The mean fo a Bernoulli random variable is p.

The variance is p(1-p)

### Binomial trials

Example of the family and sex of the cildren

```{r}
choose(8, 7) * 0.5 ^ 8 + choose(8, 8) * 0.5 ^ 8

pbinom(6, size = 8, prob = 0.5, lower.tail = FALSE)
```

### The normal distribution

Gaussian distribution with mean mu and variance sigma^2

mu = 0 and sigma = 1

1 standard deviations: 68%
2 standard deviations: 95%
3 standard deviations: 99%

Facts about the normal density

If X ~ N(mu, sigma^2), then:

Z = (X - mu) / sigma ~ N(0,1)

If Z is standard normal, then:
X = mu + sigma * Z ~ N(mu, sigma^2)

1. Approximately 68%, 95% and 99% of hte normal density lies within 1, 2 and 3 standard deviations from teh mean, respectively.
2. -1.28, -1.645, -1.96 and -2.33 are the 10th, 5th, 2.5th and 1st percentiles of the standard normal distribution, respectively.
3. By symmetry, 1.28, 1.645, 1.96 and 2.33 are the 90th, 95th, 97.5th and 99th percentiles of the standard normal distribution respectively.

(Recall mu - 1.96*sigma...)

### The Poisson distribution

Used to model counts

The mean of this distribution is lambda.

The variance of this distribution is lambda.

- Modeling count data
- Modeling event-time or survival data
- Modeling contingency tables
- Approximating binomials when n is large and p is small

Rates and Poisson random variables

Poisson random variables are used to model rates

X ~ Poisson(lambda x t) where
- lambda = E[X/t] is the expected count per unit of time
- t is the total monitoring time

Poisson approximation to the binomial

When n is large and p is small, the Poisson distribution is an accurate approximation to the binomial distribution

Notation: X ~ Binomial(n, p)
- lambda = n x p
- n gets large
- p get small

## Asymptotics

Asymptotics refers to the behavior of estimators as the sample size goes to infinity. Our very notion of probability depends on the idea of asymptotics. For example, many people define probability as the proportion of times an event would occur in infinite repetitions. That is, the probability of a head on a coin is 50% because we believe that if we were to flip it infinitely many times, we would get exactly 50% heads.

We can use asymptotics to help is figure out things about distributions without knowing much about them to begin with. A profound idea along these lines is the Central Limit Theorem. It states that the distribution of averages is often normal, even if the distribution that the data is being sampled from is very non-normal. This helps us create robust strategies for creating statistical inferences when we're not willing to assume much about the generating mechanism of our data.

### Asymptotics and LLN

Asymptotics is the term for the behavior f statistics as the sample size (or some other relevant quantity) limits to infinity (or some other relevant number)

Asymptotics are incredibly useful for simple statistical inference and approximations

Asymptotics form the basis for frequency interpretation of probabilities (the long run proportion of times an event occurs)

**Limits of random variables**

These results allows us to talk about the large sample distribution of sample means of a collection of iid observations.

The first of these results, the Law of the Large Numbers, we intuitively know:
- it says that the average limits to what its estimating, the population mean
- Example Xbar.n could be teh average of the result of n coin flips (i.e. the sample proportion of heads)
- As we flips a fair coin over and over, it eventually converges to the true probability of a head

**Discussion**

An estimator is **consistent** if it converges to what you want to estimate

The LLN says that the sample mean of iid samples is consistent for the population mean

Typically, good estimators are consistent; it's not too much to ask that if we go to the trouble of collecting an infinite amount of data that we get the right answer

The sample variance and the sample standard deviation of iid random variables are consistent as well

### The Central Limit Theorem

For our purposes, the CLT states that the distribution of averages of iid variables (properly normalized) becomes that of a standard normal as the sample size increases.

(Estimate - Mean of Estimate) / Standard Error of Estimate

## Confidence Intervals

Xbar, is approximately normal with mean mu and sd = sigma / sqrt(n)

n isnt large enaough for the CLT to be applicable for many of the values of p

Quick fix, for the interval with (X + 2) / (n + 4)

(Add two successes and failrues, Agresti, Coull interval)

## Summary
- THe LLN states that averages of iid samples converge to the population means that they are estimating
- The CLT states that averages are approximately normal, with distributions
      - centered at the population mean
      - with standard deviation equal to the standard error of the mean
      - CLT gives no garantee that n is large enough
- Taking the mean and adding and substracting the relevant normal quantile times the SE yields a confidence interval for the mean
      - Adding and substracting 2 SEs works for 95% intervals
- Confidence intervals gets wider as the coverage increases
- The Poisson and binomial case have exact intervals that don't require the CLT
      - But a quick fix for small sample size binomial calculations is to add 2 successes and failures
      -
