## Simulation -Random sampling
#

dnorm(x, mean = 0, sd = 1, log = FALSE)
pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
rnorm(n, mean = 0, sd = 1)

# to ensure reproducibility use set.seed
set.seed(1)
rnorm(10)

rnorm(10)

set.seed(1)
rnorm(10)


rpois(10, 1)

ppois(2, 2) # Cumulative distribution

# Linear model of random variables
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
# Linear model y = b + ax + E
y <- 0.5 + 2 * x + e
summary(y)

plot(x, y)

# Linear model of binary variables
set.seed(20)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
# Linear model y = b + ax + E
y <- 0.5 + 2 * x + e
summary(y)

plot(x, y)

# Simulate from a Poisson model
# Y ~ Poisson(mu)
# log(mu) = b + a*x
# and b = 0.5 and a = 0.3

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)

plot(x, y)

# Random sampling
set.seed(1)
sample(1:10, 4)
sample(1:10, 4)
sample(letters, 5)
sample(1:10) # permutation
sample(1:10)
sample(1:10, replace = TRUE) # sample w/ replacement

# R Profiler
# check:
# Rprof()
# summaryRprof() $by.total or $by.self