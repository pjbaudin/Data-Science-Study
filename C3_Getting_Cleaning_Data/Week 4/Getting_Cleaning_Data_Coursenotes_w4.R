# Week 4 Getting and Cleaning data Course Notes

# Set working directory

setwd("D:/Data Science/R-Data-Science-Study/Getting_Cleaning_Data/Week 4")

# Course provided in video

if(!file.exists("./data")) {dir.create("./data")}

fileURL <- "http://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=Download"

download.file(fileURL, destfile = "./data/cameras.csv", method = "curl")

cameraData <- read.csv("./data/cameras.csv")

names(cameraData)

# lower case col names
tolower(names(cameraData))

# separate variables with a defined period
splitNames <- strsplit(names(cameraData), "\\.")
splitNames[[5]]
splitNames[[6]]

# List example
myList <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(myList)

splitNames[[6]][1]
firstElement <- function(x) {x[1]}
sapply(splitNames, firstElement)

# Peer review Data
#fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
# link don't work in China (Dropbox)
# 
# 
# sub("_", "", names(reviews))
# gsub("_", "", names(reviews))


# Finding values

grep("Alameda", cameraData$intersection)

table(grepl("Alameda", cameraData$intersection))

# Subset using grepl
cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection), ]

grep("Alameda", cameraData$intersection, value = TRUE)

grep("JeffStreet", cameraData$intersection)

length(grep("JeffStreet", cameraData$intersection))

# More useful string function

library(stringr)

nchar("Pierre Baudin")

substr("Pierre Baudin", 1, 6)

paste("Pierre", "Baudin")

paste0("Pierre", "Baudin")

str_trim("Pierre       ")


# Regular expressions
# a combination of literals and metacharacters
# text = words
# metacharacters = grammar
# 
# Literals
# Regular expressions
# use metacharacters
# ^text will match the line from the start
# text$ will match the line from the end
# Character classes with []
# combine ^[Ii] am
# 
# Specify range of letters
# [a-z] or [a-zA-Z]
# ^[0-9][a-zA-Z]
# 
# When used at the beginning of a character class
# the "?" is also a metacharacter and indicates matching
# characters NOT in the indicated class
# [^?.]$
# 
# Regular expression 2
# "." is used to refer to any character
# 9.11
# 
# | translates to "or", we can use it to combine two expressions,
# the sub expressions, teh subexpressions being called alternatives
# flood|fire
# 
# more combine
# ^[Gg]ood|[Bb]ad
# ^([Gg]ood|[Bb]ad)
# [Gg]eorge( [Ww\.)? [Bb]ush
# 
# The + and * signs are metacharacters used to indicate repetition
# * means any number including none of the item
# + mean at least one of the item
# (.*) match whatever is in parenthesis
# 
# [0-9]= (*.)[0-9]+
# 
# { and } are referred to as interval quantifiers
# They let us specify the minimum and maximum number
# of matches of an expression
# [Bb]ush( +[^ ]+ +){1,5} debate
# 
# m,n means at least m but not more than n matches
# m means exactly m matches
# m, means at least m matches
# 
# number of match numbers \1, \2 ...
#  +([a-zA-Z]+) +1\ +
#  
#  The * is "greedy" so it always matches the longest possible
#  string that satisfies the regular expression
#  ^s(.*)s
#  The greediness of * can be turned off with the ? as in:
#  ^s(.*?)s
#  
#  Used with the functions grep, grepl, sub, gsub


## Working with dates
library(lubridate)
d1 <- date()
d1

class(d1)

d2 <- Sys.Date()
d2
class(d2)

format(d2, "%a %b %d")

# as.Date(x, "%d%M") ...
# weekdays
# months(d2)
attr("origin")

Sys.timezone()

wday(Sys.Date(), label = TRUE)

# Data resources
# http://www.data.gouv.fr
# Gapminder
# Kaggle
# 