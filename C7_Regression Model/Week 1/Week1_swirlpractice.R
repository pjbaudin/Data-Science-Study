# Regression Models - Week 1
# Swirl practice

# Introduction

# Residuals
# The first equation says that the "errors" in our estimates, the residuals, have mean zero. In other words, the residuals are "balanced" among the data points; they're just as likely to be positive as negative. The second equation says that our residuals must be uncorrelated with our predictors, the parents’ height. This makes sense - if the residuals and predictors were correlated then you could make a better prediction and reduce the distances (residuals) between the actual outcomes and the predictions.

fit <- lm(child ~ parent, galton)
mean(fit$residuals)

cov(fit$residuals, galton$parent)

# sqe(ols.slope+sl,ols.intercept+ic) == deviance(fit) + sum(est(sl,ic)ˆ2 )
# sqe(ols.slope+sl,ols.intercept+ic) == sqe(ols.slope, ols.intercept) + sum(est(sl,ic)ˆ2 )

 #The left side of the equation represents the squared residuals of a new line, the "tweaked" regression line.
 #The terms "sl" and "ic" represent the variations in the slope and intercept respectively. The right side has
 #two terms. The first represents the squared residuals of the original regression line and the second is the
 #sum of squares of the variations themselves.
ols.ic <- fit$coef[1]
ols.slope <- fit$coef[2]

#Here are the vectors of variations or tweaks
sltweak <- c(.01, .02, .03, -.01, -.02, -.03) #one for the slope
ictweak <- c(.1, .2, .3, -.1, -.2, -.3)  #one for the intercept
lhs <- numeric()
rhs <- numeric()
#left side of eqn is the sum of squares of residuals of the tweaked regression line
for (n in 1:6) lhs[n] <- sqe(ols.slope+sltweak[n],ols.ic+ictweak[n])
#right side of eqn is the sum of squares of original residuals + sum of squares of two tweaks
for (n in 1:6) rhs[n] <- sqe(ols.slope,ols.ic) + sum(est(sltweak[n],ictweak[n])^2)

all.equal(lhs, rhs)


varChild <- var(galton$child)

varRes <- var(fit$residuals)

#Recall that the function "est" calculates the estimates (y-coordinates) of values along the regression line
#defined by the variables "ols.slope" and "ols.ic". Compute the variance in the estimates and store it in the variable varEst.

varEst <- var(est(ols.slope, ols.ic))

all.equal(varChild, varEst + varRes)

efit <- lm(accel ~ mag + dist, attenu)

mean(efit$residuals)

cov(efit$residuals, attenu$mag)
cov(efit$residuals, attenu$dist)



## Least squares

myPlot <- function(beta){
        y <- galton$child - mean(galton$child)
        x <- galton$parent - mean(galton$parent)
        freqData <- as.data.frame(table(x, y))
        names(freqData) <- c("child", "parent", "freq")
        plot(
                as.numeric(as.vector(freqData$parent)), 
                as.numeric(as.vector(freqData$child)),
                pch = 21, col = "black", bg = "lightblue",
                cex = .15 * freqData$freq, 
                xlab = "parent", 
                ylab = "child"
        )
        abline(0, beta, lwd = 3)
        points(0, 0, cex = 2, pch = 19)
        mse <- mean( (y - beta * x)^2 )
        title(paste("beta = ", beta, "mse = ", round(mse, 3)))
}
manipulate(myPlot(beta), beta = manipulate::slider(0.4, .8, step = 0.02))

cor(gpa_nor, gch_nor)

l_nor <- lm(gch_nor ~ gpa_nor)

#plot the original Galton data points with larger dots for more freq pts
y <- galton$child
x <- galton$parent
freqData <- as.data.frame(table(galton$child, galton$parent))
names(freqData) <- c("child", "parent", "freq")
plot(as.numeric(as.vector(freqData$parent)), 
     as.numeric(as.vector(freqData$child)), 
     pch = 21, col = "black", bg = "lightblue",
     cex = .07 * freqData$freq, xlab = "parent", ylab = "child")

#original regression line, children as outcome, parents as predictor
abline(mean(y) - mean(x) * cor(y, x) * sd(y) / sd(x), #intercept
       sd(y) / sd(x) * cor(y, x),  #slope
       lwd = 3, col = "red")

#new regression line, parents as outcome, children as predictor
abline(mean(y) - mean(x) * sd(y) / sd(x) / cor(y, x), #intercept
       sd(y) / cor(y, x) / sd(x), #slope
       lwd = 3, col = "blue")

#assume correlation is 1 so slope is ratio of std deviations
abline(mean(y) - mean(x) * sd(y) / sd(x), #intercept
       sd(y) / sd(x),  #slope
       lwd = 2)
points(mean(x), mean(y), cex = 2, pch = 19) #big point of intersection