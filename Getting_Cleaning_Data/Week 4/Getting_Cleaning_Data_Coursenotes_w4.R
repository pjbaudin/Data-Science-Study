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
