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