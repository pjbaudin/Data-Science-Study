## Week 4 Getting and Cleaning Data - Quizz 4


# Question 1
# Get data from URL path
Url <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(Url, destfile = "ACS4.csv", method = "curl")

# Load the data
ACS <- read.csv("ACS4.csv")

# Extract names
ACSnames <- names(ACS)

# String split
strsplit(ACSnames, "wgtp")[123]


# Question 2
# download data
Url <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(Url, destfile = "GDP4.csv", method = "curl")

# Read the data
# # After check, need to skip 4 rows to clean up dataset
GDP <- read.csv("GDP4.csv", skip = 4, nrows = 190)

# Remove the commas from the GDP numbers in millions of dollars
head(GDP)
# refer to column X.4 for GDP numbers
GDPclean <- GDP
GDPclean$X.4 <- gsub(",", "", GDP$X.4)

head(GDPclean)

# convert to numeric and compute mean
GDPclean$X.4 <- as.numeric(GDPclean$X.4)
summary(GDPclean$X.4)


# Question 3
 
summary(grepl("^United", GDPclean$X.3))


# Question 4
# Match the data based on the country shortcode.
# Of the countries for which the end of
# the fiscal year is available, how many end in June?

Url <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(Url, destfile = "GDP4.csv", method = "curl")
GDP2 <- read.csv("GDP4.csv", skip=4, nrows=190)

Url <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(Url, destfile = "edu.csv", method = "curl")
edu <- read.csv("edu.csv")

# Brief look
head(GDP2)
head(edu)

# Combine the datasets
df <- merge(GDP2, edu, by.x = "X", by.y = "CountryCode")

# extract the information
fisc_year_june <- grep("Fiscal year end: June", df$Special.Notes)
length(fisc_year_june)


# Question 5

library(quantmod)
library(dplyr)
library(magrittr)
library(lubridate)

amzn = getSymbols("AMZN", auto.assign = FALSE)
sampleTimes = index(amzn)

# Table the dataset by year
sampleTimes %>% year() %>% table()

# Create index for year 2012 
Timesyear <- year(sampleTimes)
ind <- Timesyear == "2012"

# Table the dataset by week days (Monday is 2)
sampleTimes2012 <- subset(sampleTimes, ind)

sampleTimes2012 %>% wday() %>% table()
      