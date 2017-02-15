# Regression Models - Week 2 Course notes

 Estimation is useful, but we also need to know how to extend our estimates to a population. This is the process of statistical inference. Our approach to statistical inference will be through a statistical model. At the bare minimum, we need a few distributional assumptions on the errors. However, we’ll focus on full model assumptions under Gaussianity.

## Basic regression model with additive Gaussian errors

- Least squares is an estimation tool. How do we do inference?
- Consider developing a probabilistic model for linear regression

Yi = beta0 + beta1 * Xi + espi

## Interpreting regression coefficients, the itc

beta0 is the expected value of the response when the predictor is 0

- Note: this is not always of interest
- Consider that:
      - Yi = beta0 + beta1 * Xi + espi = beta0 + alpha * betai + betai(Xi - alpha) + epsi
      - Yi = betahtilder + betai(Xi - alpha) + epsi
- So shifting the X values by alpha changes the intercept but not the slope
- Often, alpha is set to Xbar so that the intercept is interpretted as the expected response at the average X value.

## Interpretting regression coefficients, the slope

- beta1 is the expected change in response for a 1 unit change in the predicator
- Consider the impact of changing the units of X
- Therefore multiplication of X by a factor alpha results in dividing the coefficient by a factor of alpha

## Regression coeficients for prediction

- Guess the outcome at a particular value of the predictor, say X, the
      - beta0tilder + beta1tilder * X

See R code practice script and how to make a linear model and use the function predict to estimate new values.

## Residuals

Residuals represent variation left unexplained by our model. We emphasize the difference between residuals and errors. The errors unobservable true errors from the known coefficients, while residuals are the observable errors from the estimated coefficients. In a sense, the residuals are estimates of the errors.
