# Subsetting and sorting

set.seed(13435)
X <- data.frame("var1" = sample(1:5),
                "var2" = sample(6:10),
                "var3" = sample(11:15))

X <- X[sample(1:5), ] ; X$var2[c(1, 3)] = NA

X

# Can also use %in% or table() to create table to investigate dataset
# xtabs() or ftable() are also useful to produce crosstable to check data

# Creating sequences

s1 <- seq(1, 10, by = 2) ; s1
s2 <- seq(1, 10, length = 3) ; s2

x <- c(1, 3, 8, 25, 100);
seq(along = x)

# Creating categorical variables
# use cut

# checkout Hmisch package for easier cutting by quantile for example
# use cut2()

# Creating factor variables using factor()
# and levels of factor variables

yesno <- sample(c("yes", "no"), size = 10, replace = TRUE)
yesnofac <- factor(yesno, level = c("yes", "no"))

# relevel(x, ref, ...)
# The levels of a factor are re-ordered so that the level specified by ref is first and the others are moved down. 
relevel(yesnofac, ref = "yes")

as.numeric(yesnofac)

# Use mutate function
library(dplyr)

# Common transforms
# abs()
# sqrt()
# ceiling() and floor()
# round(x, digits = n)
# signif(x, digits = n)
# cos(), sin() etc
# log()
# log2(), log10()
# exp()

# Reshaping data
# 
# The goal is tidy data:
# 1- Each variable forms a column
# 2- Each observation forms a row
# 3- Each table/file stores data about one kind of observation

library(reshape2)
head(mtcars)

# Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,
                id = c("carname", "gear", "cyl"),
                measure.vars = c("mpg", "hp"))
head(carMelt, n = 3)
tail(carMelt, n = 3)

# Casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData

cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData

# Averaging values
head(InsectSprays)

tapply(InsectSprays$count, InsectSprays$spray, sum)

# Another way - split
spIns = split(InsectSprays$count, InsectSprays$spray)
spIns

sprCount = lapply(spIns, sum)
sprCount

unlist(sprCount)

sapply(spIns, sum)

# Another way - dplyr package
library(plyr)
ddply(InsectSprays, .(spray), summarize, sum = sum(count))

spraySums <- ddply(InsectSprays, .(spray), summarize,
                   sum = ave(count, FUN = sum))
dim(spraySums)
head(spraySums)

# other links and info
# http://www.slideshare.net/jeffreybreen/reshaping-data-in-r
# 
# see also functions:
#     - acast() for castingas multi-dimensional arrays
#     - arrang() for faster reordering without using order()
#     - mutate() for adding new variables

# Manage data frames with dplyr - introduction
# arrange()
# filter()
# select()
# mutate()
# rename()
# summarize()/summarise()

setwd("D:/Data Science/R-Data-Science-Study/Getting_Cleaning_Data/Week 3")

library(dplyr)

chicago <- readRDS("chicago.rds")
dim(chicago)

str(chicago)

glimpse(chicago)

names(chicago)

head(select(chicago, city:dptp))

head(select(chicago, -(city:dptp)))

chic.f <- filter(chicago, pm25tmean2 > 30)
head(chic.f, 10)

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(chic.f)

chicago <- arrange(chicago, date)
head(chicago)
tail(chicago)

chicago <- arrange(chicago, desc(date))
head(chicago)
tail(chicago)

chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)
head(chicago)

chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
head(select(chicago, pm25, pm25detrend))

chicago <- mutate(chicago,
                  tempcat = factor(1 * (tmpd > 80),
                                   labels = c("cold", "hot")))

hotcold <- group_by(chicago, tempcat)
hotcold

summarize(hotcold, pm25 = mean(pm25), o3 = max(o3tmean2), no2 = median(no2tmean2))

summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))

chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
years <- group_by(chicago, year)

summarize(years, pm25 = mean(pm25, na.rm = TRUE),
          o3 = max(o3tmean2),
          no2 = median(no2tmean2))

chicago %>%
      mutate(month = as.POSIXlt(date)$mon + 1) %>%
      group_by(month) %>%
      summarize(pm25 = mean(pm25, na.rm = TRUE),
                o3 = max(o3tmean2),
                no2 = median(no2tmean2))

# Merging data

reviews <- read.csv("reviews.csv")
solutions <- read.csv("solutions.csv")
head(reviews, 2)
head(solutions, 2)

names(reviews)
names(solutions)

mergedData <- merge(reviews, solutions,
                    by.x = "solution_id",
                    by.y = "id",
                    all = TRUE)
head(mergedData)

intersect(names(solutions), names(reviews))

mergedData2 <- merge(reviews, solutions, all = TRUE)
head(mergedData2)

df1 <- data.fram(id = sample(1:10), x = rnom(10))
df2 <- data.fram(id = sample(1:10), y = rnom(10))
arrange(join(df1, df2), id)

df1 <- data.fram(id = sample(1:10), x = rnom(10))
df2 <- data.fram(id = sample(1:10), y = rnom(10))
df3 <- data.fram(id = sample(1:10), z = rnom(10))

dfList <- list(df1, df2, df3)
join_all(dfList)

