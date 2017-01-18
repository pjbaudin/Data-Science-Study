library(datasets)
library(dplyr)
library(magrittr)
data(iris)

iris %>%
      filter(Species == "virginica") %>%
      summary()

summary(iris)

apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)
#How can one calculate the average miles per gallon
#(mpg)
#by number of cylinders in the car (cyl)?

tapply(mtcars$mpg, mtcars$cyl, mean)

sapply(split(mtcars$mpg, mtcars$cyl), mean)

with(mtcars, tapply(mpg, cyl, mean))

# Absolute difference between the average horsepower of 4-cylinder cars
# and the average horsepower of 8-cylinder cars
x <- tapply(mtcars$hp, mtcars$cyl, mean)
x['8'] - x['4']
