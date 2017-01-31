# Statistical Inference - Week 2

# Simulation example

nosim <- 1000
n <- 10

sd(apply(matrix(rnorm(nosim * n), nosim), 1, mean))

1 / sqrt(n)

# Simulation example 2

sd(apply(matrix(runif(nosim * n), nosim), 1, mean))

1 / sqrt(12 * n)

# Simualtion example with Poisson distribution

sd(apply(matrix(rpois(nosim * n, 4), nosim), 1, mean))

2 / sqrt(n)

# Simulation of a fair coin flip

sd(apply(matrix(sample(0:1, nosim * n, replace = TRUE), nosim), 1, mean))

1 / (2 * sqrt(n))

# Data example
library(UsingR)
data(father.son)

x <- father.son$sheight
n <- length(x)

# Estimate of the population density

hist(x)

# Interpret the numbers
round(c(var(x), var(x) / n, sd(x) / sqrt(n)), 2)

# Binomial Distribution example
choose(8, 7) * 0.5 ^ 8 + choose(8, 8) * 0.5 ^ 8
pbinom(6, size = 8, prob = 0.5, lower.tail = FALSE)


# Normal distribution practice
mu <- 0
sd <- 1
qnorm(0.95, mean = mu, sd = sd)

x <- 2
pnorm(x, mean = mu, sd = sd, lower.tail = FALSE)

(x - mu) / (sd^2)

pnorm(1160, mean = 1020, sd = 50, lower.tail = FALSE)
pnorm(2.8, lower.tail = FALSE)

qnorm(0.75, mean = 1020, sd = 50)

# Poisson distribution
ppois(3, lambda = 2.5 * 4)

# Poisson approximation to the binomial
pbinom(2, size = 500, prob = 0.01)

ppois(2, lambda = 500 * 0.01)


# Law of large numbers
# 
n <-  1000
mean <- cumsum(rnorm(n))/(1:n)

plot(mean, type = "l")

means <- cumsum(sample(0:1, n, replace = TRUE))/(1:n)

plot(means, type = "l")


# Central Limit Theorem
# Simulate a standard normal variable by rolling n (six sided)

# Confidence interval
library(UsingR)
data(father.son)
x <- father.son$sheight
(mean(x) + c(-1, 1) * qnorm(0.975) * sd(x) / sqrt(length(x))) / 12

# Binomial interval
0.56 + c(-1, 1) * qnorm(0.975) * sqrt(0.56 * 0.44 / 100)

binom.test(56, 100)$conf.int
binom.test(50, 100)$conf.int
binom.test(64, 100)$conf.int

# simulation
n <- 10
pvals <- seq(0.1, 0.9, by = 0.05)
nosim <- 1000
coverage <- sapply(pvals, function(p){
        phats <- rbinom(nosim, prob = p, size = n) / n
        ll <- phats - qnorm(0.975) * sqrt(phats * (1 - phats)/n)
        ul <- phats + qnorm(0.975) * sqrt(phats * (1 - phats)/n)
        mean(ll < p & ul > p)
}
)

plot(pvals, coverage, type = "l")

# increase the sample size to 100
n <- 100
pvals <- seq(0.1, 0.9, by = 0.05)
nosim <- 1000
coverage <- sapply(pvals, function(p){
        phats <- rbinom(nosim, prob = p, size = n) / n
        ll <- phats - qnorm(0.975) * sqrt(phats * (1 - phats)/n)
        ul <- phats + qnorm(0.975) * sqrt(phats * (1 - phats)/n)
        mean(ll < p & ul > p)
}
)

plot(pvals, coverage, type = "l")

# Using the Agresti, Coull interval
n <- 20
pvals <- seq(0.1, 0.9, by = 0.05)
nosim <- 1000
coverage <- sapply(pvals, function(p){
        phats <- (rbinom(nosim, prob = p, size = n) + 2) / (n + 4)
        ll <- phats - qnorm(0.975) * sqrt(phats * (1 - phats)/n)
        ul <- phats + qnorm(0.975) * sqrt(phats * (1 - phats)/n)
        mean(ll < p & ul > p)
}
)

plot(pvals, coverage, type = "l")

# Poisson interval
x <- 5
t <- 94.32
lambda <-  x / t
round(lambda + c(-1, 1) * qnorm(0.975) *  sqrt(lambda/t), 3)

poisson.test(x, T = 94.32)$conf

# Simulating the Poisson coverage
lambdavals <- seq(0.005, 0.1, by = 0.01)
nosim <- 1000
t <- 100
coverage <-  sapply(lambdavals, function(lambda){
        lhats <- rpois(nosim, lambda = lambda * t)/t
        ll <- lhats - qnorm(0.975) * sqrt(lhats/t)
        ul <- lhats + qnorm(0.975) * sqrt(lhats/t)
        mean(ll < lambda & ul > lambda)
})

plot(lambdavals, coverage, type = "l")
# very bad for small values of lambda

# change t to 1000
lambdavals <- seq(0.005, 0.1, by = 0.01)
nosim <- 1000
t <- 1000
coverage <-  sapply(lambdavals, function(lambda){
        lhats <- rpois(nosim, lambda = lambda * t)/t
        ll <- lhats - qnorm(0.975) * sqrt(lhats/t)
        ul <- lhats + qnorm(0.975) * sqrt(lhats/t)
        mean(ll < lambda & ul > lambda)
})

plot(lambdavals, coverage, type = "l")

