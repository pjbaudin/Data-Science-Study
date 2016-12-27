## R_Programming Week 4
## Programming Assignment 3

# Set working directory
setwd("D:/Data Science/R-Data-Science-Study/R_Programming/Week 4/Assignment_3")

# Load useful package
library(dplyr)

# Import data
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
# head(outcome)
# str(outcome)
glimpse(outcome) 
dim(outcome)

# outcome_colnames <- names(outcome)
# outcome_colnames

# Plot the 30-day mortality rates for heart attack

outcome[, 11] <- as.numeric(outcome[, 11])
# Message NAs introduced by coersion is ok
hist(outcome[, 11])

# Save graph
png("30-day mortality rate HA.png")
hist(outcome[, 11])
dev.off()