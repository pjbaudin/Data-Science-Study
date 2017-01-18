# Set working directory
setwd("D:/Data Science/R-Data-Science-Study/Exploratory Analysis/Expl Analysis week 4")

# Load libraries
library(dplyr)
library(tidyr)
library(magrittr)
library(lubridate)

## Import the data 1999 and 2012 and filter to keep PM2.5 data

data1999 <- read.csv("annual_all_1999.csv")
data1999$Parameter.Code <- as.factor(data1999$Parameter.Code)
df1999PM25 <- data1999 %>%
        filter(Parameter.Code == "88101") %>%
        droplevels()

data2012 <- read.csv("annual_all_2012.csv")
data2012$Parameter.Code <- as.factor(data2012$Parameter.Code)
df2012PM25 <- data2012 %>%
        filter(Parameter.Code == "88101") %>%
        droplevels()

# Notes can use make,names to have valid column names
# Data exploration
x1 <-  df1999PM25$Arithmetic.Mean
x2 <- df2012PM25$Arithmetic.Mean
boxplot(x1, x2)
boxplot(log10(x1), log10(x2))

# Subset New York state (can control the change on sitel location)
site36_19 <- df1999PM25 %>%
        filter(State.Code == "36") %>%
        droplevels()

site36_12 <- df2012PM25 %>%
        filter(State.Code == "36") %>%
        droplevels()

# Explore data site.Num
# table(site36_19$Site.Num)
# table(site36_12$Site.Num)

site19 <- unique(subset(df1999PM25, State.Code == "36", c(County.Code, Site.Num)))

site12 <- unique(subset(df2012PM25, State.Code == "36", c(County.Code, Site.Num)))

site19 <- paste(site19[, 1], site19[, 2], sep = ".")
site12 <- paste(site12[, 1], site12[, 2], sep = ".")

# Observations in both dataset
both <- intersect(site19, site12)
