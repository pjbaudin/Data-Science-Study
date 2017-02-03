# Statistical Inference - Week 3

# Simulation example - t distribution and t intervals

data(sleep)
# data originally analyzed in Gosset's Biometrika paper,
# which shows the increase in hours for 10 patient on two soporific drugs.
# R treats the data as two groups rather than paired
head(sleep)
summary(sleep)

# Plotting the data
library(ggplot2)
g <- ggplot(sleep, aes(x = group,
                       y = extra,
                       group = factor(ID)))
g <- g + geom_line(size = 1, aes(colour = ID)) +
        geom_point(size =10, pch = 21,
                   fill = "salmon", alpha = .5)
g

g1 <- sleep$extra[1:10]
g2 <- sleep$extra[11:20]
difference <- g2 - g1
mn <- mean(difference)
s <- sd(difference)
n <- 10

mn + c(-1, 1) * qt(0.975, n - 1) * s / sqrt(n)
t.test(difference)
t.test(g2, g1, paired = TRUE)
t.test(extra ~ I(relevel(group, 2)), paired = TRUE, data = sleep)

# formating to get only the interval
rbind(
        mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n),
        as.vector(t.test(difference)$conf.int),
        as.vector(t.test(g2, g1, paired = TRUE)$conf.int),
        as.vector(t.test(extra ~ I(relevel(group, 2)), paired = TRUE, data = sleep)$conf.int)
)

# Independent group T intervals
# Based in Rosner, Fundamentals of Biostatistics
sp <- sqrt((7 * 15.34^2 + 20 * 18.23^2) / (8 + 21 - 2) )
132.86 - 127.44 + c(-1, 1) * qt(0.975, 27) * sp * (1 / 8 + 1/21)^0.5

# Mistakenly treating the sleep data as grouped
n1 <- length(g1)
n2 <- length(g2)
sp <- sqrt(((n1 - 1) * sd(g1)^2 + (n2-1) * sd(g2)^2) / (n1 + n2-2))
md <- mean(g2) - mean(g1)
semd <- sp * sqrt(1 / n1 + 1/n2)

rbind(
        md + c(-1, 1) * qt(.975, n1 + n2 - 2) * semd,  
        t.test(g2, g1, paired = FALSE, var.equal = TRUE)$conf,
        t.test(g2, g1, paired = TRUE)$conf
)

library(ggplot2)
g <- ggplot(sleep, aes(x = group, y = extra, group = factor(ID)))
g <- g + geom_line(size = 1, aes(colour = ID)) + geom_point(size =10, pch = 21, fill = "salmon", alpha = .5)
g

# Chickweight data
library(datasets)
data("ChickWeight")
library(reshape2)

##define weight gain or loss
wideCW <- dcast(ChickWeight, Diet + Chick ~ Time, value.var = "weight")
# rename
names(wideCW)[-(1 : 2)] <- paste("time", names(wideCW)[-(1 : 2)], sep = "")

library(dplyr)
wideCW <- mutate(wideCW, gain = time21 - time0)

# Plotting the raw data
g <- ggplot(ChickWeight, aes(x = Time, y = weight, colour = Diet, group = Chick))
g <- g + geom_line()
g <- g + stat_summary(aes(group = 1), geom = "line", fun.y = mean, size = 1, col = "black")
g <- g + facet_grid(. ~ Diet)
g

# Weight gain by diet
g <- ggplot(wideCW, aes(x = factor(Diet), y = gain, fill = factor(Diet)))
g <- g + geom_violin(col = "black", size = 2)
g

# Making a t interval
wideCW14 <- subset(wideCW, Diet %in% c(1, 4))
rbind(
        t.test(gain ~ Diet, paired = FALSE, var.equal = TRUE, data = wideCW14)$conf,
        t.test(gain ~ Diet, paired = FALSE, var.equal = FALSE, data = wideCW14)$conf
)

# T test in R and hypothesis testing
library(UsingR)
data(father.son)
t.test(father.son$sheight - father.son$fheight)


# One Sample t-test
# 
# data:  father.son$sheight - father.son$fheight
# t = 11.789, df = 1077, p-value < 2.2e-16
# alternative hypothesis: true mean is not equal to 0
# 95 percent confidence interval:
#         0.8310296 1.1629160
# sample estimates:
#         mean of x 
# 0.9969728 


# Using the chickweight dataset
# Chickweight data
library(datasets)
data("ChickWeight")
library(reshape2)

##define weight gain or loss
wideCW <- dcast(ChickWeight, Diet + Chick ~ Time, value.var = "weight")
# rename
names(wideCW)[-(1 : 2)] <- paste("time", names(wideCW)[-(1 : 2)], sep = "")

library(dplyr)
wideCW <- mutate(wideCW, gain = time21 - time0)

# Unequal variance T test comparing diets 1 and 4
wideCW14 <- subset(wideCW, Diet %in% c(1, 4))
t.test(gain ~ Diet, paired = FALSE, var.equal = TRUE, data = wideCW14)

# Two Sample t-test
# 
# data:  gain by Diet
# t = -2.7252, df = 23, p-value = 0.01207
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#         -108.14679  -14.81154
# sample estimates:
#         mean in group 1 mean in group 4 
# 136.1875        197.6667 

# P-value
pt(2.5, 15, lower.tail = FALSE)

# Computation of p-value for the 8 children, 7 daugthers
choose(8, 7) * 0.5^8 + choose(8, 8) * 0.5^8

pbinom(6, size = 8, prob = 0.5, lower.tail = FALSE)

# computation of p-value for a Poisson distribution
# Example of a hospital with infection rate
# strictly greater than 9 (double-sided)
ppois(9, 5, lower.tail = FALSE)

# Then the Poisson rate is 0.05 times the 100 person days at risk, so 5.
# And then we want to specify lower.tail equals false, to make sure
# that we don't get 9 and fewer, but we want strictly greater than 9,
# which is 10 or more. And that will give us our realm of p-value.
# So what is this probability? This is the probability of obtaining 10
# or more infections if, in fact, the true rate of infections
# we've should've seen on a 100 person days at risk is 5.
