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