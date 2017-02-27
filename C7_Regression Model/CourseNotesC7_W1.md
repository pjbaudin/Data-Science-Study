# Regression Model - Week 1

## Introduction to regression and least squares

### Regression

Regression models are the workhorse of data science. They are the most well described, practical and theoretically understood models in statistics. A data scientist well versed in regression models will be able to solve an incredible array of problems.

Perhaps the key insight for regression models is that they produce highly interpretable model fits. This is unlike machine learning algorithms, which often sacrifice interpretability for improved prediction performance or automation. These are, of course, valuable attributes in their own rights. However, the benefit of simplicity, parsimony and interpretability offered by regression models (and their close generalizations) should make them a first tool of choice for any practical problem.

### Basic least squares

The physical center of mass of the histogram
mu = Ybar

The least square estimate is the empirical mean

### Regression through the origin

- Consider picking the slope beta that minimizes sum()(Yi - Xi * beta)^2)
- This is exactly using the origin as a pivot point picking the line that minimizes the sum of the sqared vertical distances of the points to the line
- Substract the means so that the origin is the mean of the parent and children's heights

## Least squares

**Ordinary least squares (OLS)** is the workhorse of statistics. It gives a way of taking complicated outcomes and explaining behavior (such as trends) using linearity. The simplest application of OLS is fitting a line through some data.

### Notations
- Minimizing/centering: substract mean from each point in the dataset
- Scaling: divide Xi by the standard deviation

Normalization is just doing minimizing and scaling at the same time.

Empirical covariance is used with paired data (Xi, Yi)

Cor(X,Y) = Cov(X, Y) / (Sx * Sy)

Cor(X,Y) measures the strength of the linear relationship between the X and Y data, with stronger relationships as Corr(x, Y) heads towards -1 or 1.

### Least squares estimation of regression lines

see practice in R script

## Regression to the mean

Regression to the mean, was invented by Francis Galton in the paper “Regression towards mediocrity in hereditary stature” The Journal of the Anthropological Institute of Great Britain and Ireland , Vol. 15, (1886). The idea served as a foundation for the discovery of linear regression.
