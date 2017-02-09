# Statistical Inference week 4

# Bootstrap

library(UsingR)
data(father.son)
x <- father.son$sheight
n <- length(x)
B <- 10000
resamples <- matrix(sample(x,
                           n * B,
                           replace = TRUE),
                    B, n)
resampledMedians <- apply(resamples, 1, median)

hist(resampledMedians, freq = TRUE)


B <- 10000
resamples <- matrix(sample(x,
                           n * B,
                           replace = TRUE),
                    B, n)
medians <- apply(resamples, 1, median)
sd(medians)

## [1] 0.08424

quantile(medians, c(.025, .975))

g = ggplot(data.frame(medians = medians), aes(x = medians))
g = g + geom_histogram(color = "black", fill = "lightblue", binwidth = 0.05)
g

## Permutations

subdata <- InsectSprays[InsectSprays$spray %in% c("B", "C"),]
y <- subdata$count
group <- as.character(subdata$spray)
testStat <- function(w, g) mean(w[g == "B"]) - mean(w[g == "C"])
observedStat <- testStat(y, group)
permutations <- sapply(1 : 10000, function(i) testStat(y, sample(group)))
observedStat

mean(permutations > observedStat)


## Quiz question practice

# Consider testing the hypothesis that there was a mean reduction in blood pressure? Give the P-value for the associated two sided T test. 

bl <- c(140, 138, 150, 148, 135)
fu <- c(132, 135, 151, 146, 130)
t.test(fu, bl, alternative = "two.sided", paired = TRUE)

t.test(fu - bl, alternative = "two.sided")

# for two-sided test
t.test(fu, bl, alternative = "less", paired = TRUE)

# A sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. What is the complete set of values of μ0 that a test of H0:μ=μ0 would fail to reject the null hypothesis in a two sided 5% Students t-test?

1100 + c(-1, 1) * qt(0.975, 8) * 30/sqrt(9)

# Researchers conducted a blind taste test of Coke versus Pepsi. Each of four people was asked which of two blinded drinks given in random order that they preferred. The data was such that 3 of the 4 people chose Coke. Assuming that this sample is representative, report a P-value for a test of the hypothesis that Coke is preferred to Pepsi using a one sided exact test.

pbinom(2, size = 4, prob = 0.5, lower.tail = FALSE)

choose(4, 3) * 0.5^4 + choose(4, 4) * 0.5^4

# Researchers would like to conduct a study of 100 healthy adults to detect a four year mean brain volume loss of .01 mm3. Assume that the standard deviation of four year volume loss in this population is .04 mm3. About what would be the power of the study for a 5% one sided test versus a null hypothesis of no volume loss?

pnorm(1.645 * 0.004, mean = 0.01, sd = 0.004, lower.tail = FALSE)

# Researchers would like to conduct a study of n healthy adults to detect a four year mean brain volume loss of .01 mm3. Assume that the standard deviation of four year volume loss in this population is .04 mm3. About what would be the value of n needed for 90% power of type one error rate of 5% one sided test versus a null hypothesis of no volume loss?

ceiling((4 * (qnorm(0.95) - qnorm(0.1)))^2)