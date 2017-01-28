# Statistical Inference - Course Notes Week 1

x <- c(-0.5, 0, 1, 1, 1.5)
y <- c(0, 0, 2, 0, 0)
plot(x, y, lwd = 3, frame = FALSE, type = "l")


# Calculate the area of the triangle
# area is 1
# This is a valid probability density function

# What is the probability that 75% or fewer calls get addressed?

# Probability from the beta distribution function
pbeta(0.75, 2, 1)

# CDF
pbeta(c(0.4, 0.5, 0.6), 2, 1)

# SDF
1- pbeta(c(0.4, 0.5, 0.6), 2, 1)

# Quantile
qbeta(0.5, 2, 1)

# Expected Values using the galton dataset from the package
# Histdata

library(HistData)
library(manipulate)
library(ggplot2)

data(galton)

myHist <- function(mu){
      g <- ggplot(Galton, aes(x = child))
      g <- g + geom_histogram(fill = "salmon", 
                              binwidth=1, aes(y = ..density..), colour = "black")
      g <- g + geom_density(size = 2)
      g <- g + geom_vline(xintercept = mu, size = 2)
      mse <- round(mean((Galton$child - mu)^2), 3)  
      g <- g + labs(title = paste('mu = ', mu, ' MSE = ', mse))
      g
}
manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))