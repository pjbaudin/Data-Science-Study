# Week 3 Quizz practice

library(dplyr)
library(magrittr)

# Create a logical vector that identifies the households
# on greater than 10 acres who sold more than $10,000 worth
# of agriculture products.
# Assign that logical vector to the variable agricultureLogical.
# Apply the which() function like this to identify
# the rows of the data frame where the logical vector is TRUE.

agrdf <- read.csv("getdata_data-ss06hid.csv")

glimpse(agrdf)

agriculturalLogical <- agrdf %>%
      filter(  >10 & > 10000) %>%
      select(households)

which(agricultureLogical)