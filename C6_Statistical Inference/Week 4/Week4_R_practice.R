# Statistical Inference - week 4
# 
# Calculating power for gaussian data
mu0 <- 30
sigma <- 4
n <- 16
mua <- 32

# mean = mu0
z <- qnorm(1 - alpha)
pnorm(mu0 + z * sigma/sqrt(n),
      mean = mu0,
      sd = sigma/sqrt(n),
      lower.tail = FALSE)

# mean =mua
z <- qnorm(1 - alpha)
pnorm(mu0 + z * sigma/sqrt(n),
      mean = mua,
      sd = sigma/sqrt(n),
      lower.tail = FALSE)

# Plotting the power curve
library(ggplot2)
nseq = c(8, 16, 32, 64, 128)
mua = seq(30, 35, by = 0.1)
z = qnorm(.95)
power = sapply(nseq, function(n)
        pnorm(mu0 + z * sigma / sqrt(n), mean = mua, sd = sigma / sqrt(n), 
              lower.tail = FALSE)
)
colnames(power) <- paste("n", nseq, sep = "")
d <- data.frame(mua, power)
library(reshape2)
d2 <- melt(d, id.vars = "mua")
names(d2) <- c("mua", "n", "power")    
g <- ggplot(d2, 
            aes(x = mua, y = power, col = n)) + geom_line(size = 2)
g

# Graphical depiction of Power
library(manipulate)
mu0 <- 30
myplot <- function(sigma, mua, n, alpha){
        g = ggplot(data.frame(mu = c(27, 36)), aes(x = mu))
        g = g + stat_function(fun=dnorm, geom = "line", 
                              args = list(mean = mu0, sd = sigma / sqrt(n)), 
                              size = 2, col = "red")
        g = g + stat_function(fun=dnorm, geom = "line", 
                              args = list(mean = mua, sd = sigma / sqrt(n)), 
                              size = 2, col = "blue")
        xitc = mu0 + qnorm(1 - alpha) * sigma / sqrt(n)
        g = g + geom_vline(xintercept=xitc, size = 3)
        g
}
manipulate(
        myplot(sigma, mua, n, alpha),
        sigma = slider(1, 10, step = 1, initial = 4),
        mua = slider(30, 35, step = 1, initial = 32),
        n = slider(1, 50, step = 1, initial = 16),
        alpha = slider(0.01, 0.1, step = 0.01, initial = 0.05)
)

# T test power
# H0 : mu = mu0 / Ha : mu > mu0
# if delta is negative: Ha : mu < mu0

power.t.test(n = 16, delta = 2 / 4, sd=1, type = "one.sample",  alt = "one.sided")$power
power.t.test(n = 16, delta = 2, sd=4, type = "one.sample",  alt = "one.sided")$power
power.t.test(n = 16, delta = 100, sd=200, type = "one.sample", alt = "one.sided")$power

power.t.test(n = 16, delta = 2 / 4, sd=1, type = "one.sample",  alt = "one.sided")
power.t.test(n = 16, delta = 2, sd=4, type = "one.sample",  alt = "one.sided")
power.t.test(n = 16, delta = 100, sd=200, type = "one.sample", alt = "one.sided")

power.t.test(power = .8, delta = 2 / 4, sd=1, type = "one.sample",  alt = "one.sided")$n
power.t.test(power = .8, delta = 2, sd=4, type = "one.sample",  alt = "one.sided")$n
power.t.test(power = .8, delta = 100, sd=200, type = "one.sample", alt = "one.sided")$n

power.t.test(power = .8, delta = 2 / 4, sd=1, type = "one.sample",  alt = "one.sided")
power.t.test(power = .8, delta = 2, sd=4, type = "one.sample",  alt = "one.sided")
power.t.test(power = .8, delta = 100, sd=200, type = "one.sample", alt = "one.sided")

power.t.test(n = 10, power = .8, sd=1, type = "one.sample",  alt = "one.sided")$delta
power.t.test(n = 130, power = .8, sd=4, type = "one.sample",  alt = "one.sided")$delta
power.t.test(n = 350000, power = .8, sd=200, type = "one.sample", alt = "one.sided")$delta