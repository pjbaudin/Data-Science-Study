# Course notes - Statistical Inference Week 3

## Confidence Intervals

When we estimate something using statistics, usually that estimate comes with uncertainty. Take, for example, election polling. When we get a polled percentage of voters that favor a candidate, we were only able to sample a small subset of voters. Therefore, our estimate has uncertainty associated with it.

Confidence intervals are a convenient way to communicate that uncertainty in estimates.

## T confidence intervals

Estimate +/- ZQ x SEest

For small sample size:

Estimate +/- TQ x SEest

TQ: T quantile

These intervals are wider.

**Gosset's t distribution**

Invented by William Gosset (under the pseudonym Student) in 1908
- Has thicker tails than the normal
- Is indexed by a degrees of freedom; gets more like a standard normal as degree of freedom df gets larger

It assumes that the underlying data are iid Gaussian with teh result that:

(Xbar - mu) / (S / sqrt(N))

Follows Gosset's t distribution with n-1 degrees of freedom

Interval is Xbar +/- t(n-1) x S / sqrt(n) where t(n-1) is the relevant quantile

**Notes about the t interval**

- The t interval technically assumes that the data are iid normal, though it is robust to this assumption.
- It works well whenever the distribution of the data is roughly symetric and mound shaped.
- Paired observations are often analyzed using the t interval by taking differences.
- For large degrees of freedom, t quantiles become the same as standard normal quantiles; therefore this interval converges to the same interval as the CLT yielded.
- For skewed distributions, the spirit of the t interval assumptions are violated.
      - Also, for skewed distributions, it doesn't make a lot of sense to center the interval at the mean
      - In this case, consider taking logs or using a different summary like the median
- For highly discrete data, like binary, other intervals are available

### Independent group T intervals

- Suppose that we want to compare the mean blood pressure between two groups in a randomized trial; those who received the treatment to those whoe received a placebo

A - B testing or randomized trial

In this case, we cannot use a paired t test because the groups are independent and may have different sample sizes

S2p is the pooled standard deviation. Average estimate of the two variance for each group.

Note, this interval is assuming a constant variance across the two groups.

If there is some doubt, assume a different variance per goup.

 ### Practice and simulation

 See R script

 ### Note on unequal variances

 Change of formula for the calculation of the degree of freedom

 In R, use t.test(..., var.equal = FALSE)

 ### Comparing other kinds of data

 For binomial data, there's lots of ways to compare two groups:
 - relative risk, risk difference, odds ratio
 - Chi-squared tests, normal approximations, exact tests

 For count data, there is also Chi-squared test and exact tests.

## Hypothesis testing

Deciding between two hypotheses is a core activity in scientific discovery. Statistical hypothesis testing is the formal inferential framework around choosing between hypotheses.

### Introduction

Hypothesis testing is concerned with making decisions using data.

A null hypothesis is specified that represents the status quo, usually labeled H0

The null hypothesis is assumed true and statistical evidence is required to reject it in favor of a research or alternative hypothesis.

The alternative hypothesis Ha are typically of the form <, > or !=

Note that there are four possible outcomes of our statistical decision process

| Truth | Decide | Result |
| --- | --- | --- |
| H0 | H0 | Correctly accept null |
| H0 | Ha | Type I error |
| Ha | Ha | Correctly reject null |
| Ha | H0 | Type II error |

**Discussion**

- Consider a court of law; the null hypothesios is that the defendant is innocent
- We require a standard on the available evidence to reject the null hypothesis (convict)
- If we set a low standard then we would increase the percentage of innocent people conviceted (Type I errors) however, we would increase the percentage of guilty people conviceted (correctly rejecting the null)
- If we set a high standard then we increase the percentage of innocent people let free (correctly accepting the null) while also increase the percentage of guilty people let free (type II errors)

**Example**

A reasonalble strategy would reject the null hypothesis if Xbar was larger than some constant C.

Typically C is chosen so that the probability of a Type I error, alpha, is 0.06 (or some other relevant constant)

**Alpha = Type I error rate** = probability of rejecting the null hypothesis when, in fact, the hypothesis is correct.

**Discussion**

- In general we don't convert C back to the original scale
- We would just reject because the Z-score; which is how many standard errors the sample mean is above the hypothesized mean

### T test and hypothesis testing

Two sided tests:
- Suppose that we would reject the null hypothesis if in fact the mean was too large or to small
- That is, we want to test the alternative Ha: mu != 30 (example mean)
- We will reject if the test statistic, 0.8, is either too large or too small
- Then we want the probability of rejecting under the null to be 5%, split equally as 2.5% in the upper tail and 2.5 % in the lower tail.
- Thus we reject if our test statisticis larger than qt(0.975, 15) or smaller than qt(0.025, 15)
      - This is the same as saying: reject if the absolute value of our statistic is larger than qt(0.975, 15) = 2.1314
      - So we fail to reject the two sided test as well
      - (If you fail to reject the one sided test, you know that you will fail to reject the two sided test as well)

**T test in R**

See R script practice

### Two group testing

See R script practice

**Connection with confidence intervals**
- Consider testing H0 : mu = mu0 versus Ha : mu != mu0
- Take the set of all possible values for which you fail to reject H0, this set is a (1 - alpha) x 100% confidence interval for mu
- The same works in reverse; if a (1- alpha) x 100% interval contains mu0, then we failt to reject H0

**Two groups intervals**
- First, now you know how to group T tests since we already covered independent group T intervals
- Rejection rules are the same
- Test H0 : mu1 != mu2

**Exact binomial test**

Recall this problem:
- Suppose a friend has 8 children, 7 of which are girls and none are twins

Perform the relevant hypothesis test H0 : p =0.5 Ha : p > 0.5
      - What is the relevant rejection region so that the probability of rejecting is (less than) 5%?

**Notes**
- It's impossible to get an exact 5% level test for this case due to the discreteness fo the binomial
      - The closest rejection rejion is [7, 8]
      - Any alpha level lower than 0.0039 is not attainable
- For larger sample sizes, we could do a normal approximation
- Two sided test isn't obvious
      - Given a way to do two sided tests, we could take the set of values of p0 for which we fail to reject to get an exact binomial confidence interval (called Clopper/Pearson interval)
- For these problems, people always create a P-value rather than computing the rejection region


## P-values

P-values are a convenient way to communicate the results of a hypothesis test. When communicating a P-value, the reader can perform the test at whatever Type I error rate that they would like. Just compare the P-value to the desired Type I error rate and if the P-value is smaller, reject the null hypothesis.

Formally, the P-value is the probability of getting data as or more extreme than the observed data in favor of the alternative. The probability calculation is done assuming that the null is true. In other words if we get a very large T statistic the P-value answers the question "How likely would it be to get a statistic this large or larger if the null was actually true?". If the answer to that question is "very unlikely", in other words the P-value is very small, then it sheds doubt on the null being true, since you actually observed a statistic that extreme.

### Introduction

- Most common measure of statistical significance
- Their ubiquity, along with concern over their interpretation and use makes them controversial among statisticians

What is a P-value?

**Idea:** Suppose nothing is going on - how unusual is it to see the estimate we got?

**Approach**
1. Define the hypothetical distribution of a data summary (statistic) when nothing is going on (null hypothesis)
2. Caclculate the summary/statistic with the data we have (test statistic)
3. Compare what we calculated to our hypothetical distribution and see if the value is "extreme" (p-value)

### P-value

The P-value is the probability under the null hypothesis of obtaining evidence as extreme or more extreme than obtained.

If the p-value is small, then either H0 is true and we have observed a rare event or H0 is false.

in R: pt(2.5, 15, lower.tail = FALSE)

**The attained significance level**

**Notes**

By reporting a p-value the reader can perform the hypothesis test at whatever alpha level he or she choses

If the p-value is less than alpha you reject the null hypothesis

For two sided hypothesis test, double the smaller or the two one sided hypothesis test p-values
