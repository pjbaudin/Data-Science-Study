# ggplot practice
# part 1

library(MASS)

library(ggplot2)
ggplot(mammals, aes(x = body, y = brain)) +
      geom_point() +
      stat_smooth(method = "lm",
                  col = "red",
                  se = FALSE)

ggplot(mammals, aes(x = body, y = brain)) +
      geom_point(alpha = 0.6) +
      coord_fixed() +
      scale_x_log10() +
      scale_y_log10() +
      stat_smooth(method = "lm",
                  col = "#C42126",
                  se = FALSE, size = 1)

library(scales) # function trans_breaks and trans_format
ggplot(mammals, aes(x = body, y = brain)) +
      annotation_logticks() +
      geom_point(alpha = 0.6) +
      coord_fixed(xlim = c(10^-3, 10^4), ylim = c(10^-1, 10^4)) +
      scale_x_log10(expression("Body weight (log"["10"]*"(Kg))"),
                    breaks = trans_breaks("log10", function(x) 10^x),
                    labels = trans_format("log10", math_format(10^.x)))+
      scale_y_log10(expression("Brain weight (log"["10"]*"(g))"),
                    breaks = trans_breaks("log10", function(x) 10^x),
                    labels = trans_format("log10", math_format(10^.x))) +
      stat_smooth(method = "lm", col = "#C42126", se = FALSE, size = 1)+
      theme_classic()


# Load the ggplot2 package
library(ggplot2)

# Explore the mtcars data frame with str()
str(mtcars)

# Execute the following command
ggplot(mtcars, aes(x = cyl, y = mpg)) +
      geom_point()

ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
      geom_point()


# A scatter plot has been made for you
ggplot(mtcars, aes(x = wt, y = mpg)) +
      geom_point()

# Replace ___ with the correct vector
ggplot(mtcars, aes(x = wt, y = mpg, col = disp)) +
      geom_point()

# Replace ___ with the correct vector
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +
      geom_point()

# The dia_plot object has been created for you
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))

# Expand dia_plot by adding geom_point() with alpha set to 0.2

dia_plot <- ggplot(diamonds, aes(x = carat, y = price)) + geom_point(alpha = 0.2)

# Plot dia_plot with additional geom_smooth() with se set to FALSE

dia_plot + geom_smooth(se = FALSE)

# Copy the command from above and add aes() with the correct mapping to geom_smooth()

dia_plot + geom_smooth(se = FALSE, aes(col = clarity))

# Basic plot
mtcars$cyl <- as.factor(mtcars$cyl)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

# Use lm() to calculate a linear model and save it as carModel
carModel <- lm(mpg ~ wt, data = mtcars)

# Call abline() with carModel as first argument and set lty to 2
abline(carModel, lty = 2)

# Plot each subset efficiently with lapply
# You don't have to edit this code
lapply(mtcars$cyl, function(x) {
      abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
})

# This code will draw the legend of the plot
# You don't have to edit this code
legend(x = 5, y = 33, legend = levels(mtcars$cyl),
       col = 1:3, pch = 1, bty = "n")

# Convert cyl to factor (don't need to change)
mtcars$cyl <- as.factor(mtcars$cyl)

# Plot 1: add geom_point() to this command to create a scatter plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
      geom_point() # Fill in using instructions Plot 1

# Plot 2: include the lines of the linear models, per cyl
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
      geom_point() + # Copy from Plot 1
      geom_smooth(method = "lm", se = FALSE)   # Fill in using instructions Plot 2

# Plot 3: include a lm for the entire dataset in its whole
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
      geom_point() + # Copy from Plot 2
      geom_smooth(method = "lm", se = FALSE) + # Copy from Plot 2
      geom_smooth(aes(group = 1), method = "lm", se = FALSE, linetype = 2) # Fill in using instructions Plot 3

# Load the tidyr package
library(tidyr)

# Fill in the ___ to produce to the correct iris.tidy dataset
iris.tidy <- iris %>%
      gather(key, Value, -Species) %>%
      separate(key, c("Part", "Measure"), "\\.")

ggplot(iris.tidy, aes(x = Species, y = Value, col = Part)) +
      geom_jitter() +
      facet_grid(. ~ Measure)

# Load the tidyr package
library(tidyr)

# Add column with unique ids (don't need to change)
iris$Flower <- 1:nrow(iris)

# Fill in the ___ to produce to the correct iris.wide dataset
iris.wide <- iris %>%
      gather(key, value, -Species, -Flower) %>%
      separate(key, c("Part", "Measure"), "\\.") %>%
      spread(Measure, value)

ggplot(iris.wide, aes(x = Length, y = Width, col = Part)) +
      geom_jitter() +
      facet_grid(. ~ Species)