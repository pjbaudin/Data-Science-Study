# Week 1
# Exploratory Analysis

# Principle 1: show comparisons
# Principle 2: show causality, mechanism, explanation, systematic structure
# Principle 3: show multivariate data
# Principle 4: integration of evidence
# Principle 5: Describe and document the evidence with appropriate labels,
# scales, sources, etc.
# Principle 6: Content is king
# 
# Edward Tufte - Beautiful Evidence


# Exploratory Graphs

setwd("D:/Data Science/R-Data-Science-Study/Exploratory Analysis")
# url <- "https://github.com/pjbaudin/modules/blob/master/04_ExploratoryAnalysis/exploratoryGraphs/data/avgpm25.csv"
# download.file(url, destfile = "avgpm25.csv")

pollution <- read.csv("avgpm25.csv",
                      colClasses = c("numeric", "character",
                                     "factor", "numeric", "numeric"))

head(pollution)

summary(pollution)

summary(pollution$pm25)

boxplot(pollution$pm25, col = "blue")

hist(pollution$pm25, col = "green")
rug(pollution$pm25)

hist(pollution$pm25, col = "green", breaks = 100)
rug(pollution$pm25)

boxplot(pollution$pm25, col = "blue")
abline(h = 12)

hist(pollution$pm25, col = "green")
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)
rug(pollution$pm25)

barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each Region")