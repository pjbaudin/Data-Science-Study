# Regression model - week 1

library(UsingR)
data("galton")
library(reshape2)

long <- melt(galton)

g <- ggplot(long, aes(x = value, fill = variable))
g <- g + geom_histogram(colour = "black", binwidth = 1)
g <- g + facet_grid(.~ variable)
g

# Least square concept exploration
library(manipulate)
myHist <- function(mu){
        mse <- mean((galton$child - mu)^2)
        g <- ggplot(galton, aes(x = child)) + geom_histogram(fill = "salmon", colour = "black", binwidth=1)
        g <- g + geom_vline(xintercept = mu, size = 3)
        g <- g + ggtitle(paste("mu = ", mu, ", MSE = ", round(mse, 2), sep = ""))
        g
}
manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))

# Regression through the origin
library(manipulate)
y <- galton$child - mean(galton$child)
x <- galton$parent - mean(galton$parent)
freqData <- as.data.frame(table(x, y))
names(freqData) <- c("child", "parent", "freq")
freqData$child <- as.numeric(as.character(freqData$child))
freqData$parent <- as.numeric(as.character(freqData$parent))
myPlot <- function(beta){
      g <- ggplot(filter(freqData, freq > 0), aes(x = parent, y = child))
      g <- g  + scale_size(range = c(2, 20), guide = "none" )
      g <- g + geom_point(colour="grey50", aes(size = freq+20, show_guide = FALSE))
      g <- g + geom_point(aes(colour=freq, size = freq))
      g <- g + scale_colour_gradient(low = "lightblue", high="white")                     
      g <- g + geom_abline(intercept = 0, slope = beta, size = 3)
      mse <- mean( (y - beta * x) ^2 )
      g <- g + ggtitle(paste("beta = ", beta, "mse = ", round(mse, 3)))
      g
}
manipulate(myPlot(beta), beta = slider(0.6, 1.2, step = 0.02))

# Using the power of R function to find beta
#  through the origin
lm(I(child - mean(child))~ I(parent - mean(parent)) - 1, data = galton)

# Ploting with lm function
freqData <- as.data.frame(table(galton$child, galton$parent))
names(freqData) <- c("child", "parent", "freq")
freqData$child <- as.numeric(as.character(freqData$child))
freqData$parent <- as.numeric(as.character(freqData$parent))
g <- ggplot(filter(freqData, freq > 0), aes(x = parent, y = child))
g <- g  + scale_size(range = c(2, 20), guide = "none" )
g <- g + geom_point(colour="grey50", aes(size = freq+20, show_guide = FALSE))
g <- g + geom_point(aes(colour=freq, size = freq))
g <- g + scale_colour_gradient(low = "lightblue", high="white")                    
lm1 <- lm(galton$child ~ galton$parent)
g <- g + geom_abline(intercept = coef(lm1)[1], slope = coef(lm1)[2], size = 3, colour = grey(.5))
g

# with intercept
lm(I(child)~ I(parent), data = galton)

# Regression to the mean - example
library(UsingR)
data(father.son)
y <- (father.son$sheight - mean(father.son$sheight)) / sd(father.son$sheight)
x <- (father.son$fheight - mean(father.son$fheight)) / sd(father.son$fheight)
rho <- cor(x, y)
library(ggplot2)
g = ggplot(data.frame(x = x, y = y), aes(x = x, y = y))
g = g + geom_point(size = 6, colour = "black", alpha = 0.2)
g = g + geom_point(size = 4, colour = "salmon", alpha = 0.2)
g = g + xlim(-4, 4) + ylim(-4, 4)
g = g + geom_abline(intercept = 0, slope = 1)
g = g + geom_vline(xintercept = 0)
g = g + geom_hline(yintercept = 0)
g = g + geom_abline(intercept = 0, slope = rho, size = 2)
g = g + geom_abline(intercept = 0, slope = 1 / rho, size = 2, lty = 2)