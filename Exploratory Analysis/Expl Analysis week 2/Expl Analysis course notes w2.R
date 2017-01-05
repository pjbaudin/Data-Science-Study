## Week 2 Exploratory Data Analysis
## Course notes


# Lesson 1: Lattice Plotting System

# lattice: xyplot, bwplot, levelplot
# grid
# The lattince plotting system does not have a two-phased
# aspect with separate plotting and annotation like in base plotting
# 
# All plotting/annotation is done at once with a single function call

library(lattice)

# Lattice function
# xyplot
# bwplot
# histogram
# stripplot
# dotplot
# splom
# levelplot, countourplot

# xyplot(y ~ x | f * g, data)
# using the formula notation (~)
# 
# f and g are conditionning variables (optional)
# They indicate an interaction between two variables

library(datasets)
# simple scatterplot
xyplot(Ozone ~ Wind, data = airquality)

# convert 'Month' to a factor variable
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))

# lattice return an object class 'trellis'
# but auto-printed

# Lattice panel function
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group1", "Group 2"))
xyplot(y ~ x | f, layout = c(2, 1))

# Custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...){
      panel.xyplot(x, y, ...) # first call the default panel function for 'xyplot'
      panel.abline(h = median(y), lty = 2) # Add a horizontal line at the median
      })

xyplot(y ~ x | f, panel = function(x, y, ...){
      panel.xyplot(x, y, ...) # first call the default panel function for 'xyplot'
      panel.lmline(x, y, col = 2) # Overlay a simple linear regression line
})

# Many panel lattice plot help to look quickly at a lot of data

## Summary
## 1- Lattice plots are constructed with a single fucntion call
## to a core lattice function
## 
## 2- Aspects like margins and spacing are automatically handled
## and defaults are usually sufficient
## 
## 3- The lattice system is ideal for creating conditioning plots
## where you examine the same kind of plot under many different
## conditions.
## 
## 4- Panel functions can be specified/customized to modify
## what is plotted in each of the plot panels


## ggplot
# see http://ggplot2.org
# 
# Theory of graphic
# shorten the distance from the mind to the page
# 
# Grammar of graphic
# "in brief, the grammar tells us that a statistical graphic is a mapping from data to aesthetic attributes (colour, shape, size) of geometric objects (points, lines, bars). The plot may also contain statistical transformations of the data and is drawn on a specific coordinate system"
# from ggplot2 book
# 
# qplot() stands for quick plot
# 
# ggplot() is the core function and very flexible for doing things qplot cannot do.
# 
# 