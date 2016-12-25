library(dplyr)
library(sqldf)

# Q2 and Q3 to investigate SQL-type queries

path <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

download.file(path, destfile = "temp.csv")
acs <- read.csv("temp.csv")

glimpse(acs)

head(sqldf("select pwgtp1 from acs where AGEP < 50"))

head(sqldf("select distinct AGEP from acs"))
head(unique(acs$AGEP))


# Q4 - Using coursera material
library(XML)

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])



# Q5 using stackoverflow help to understand how to use read.fwf()
# Method 1
# Width give the number of digits per columns
# There are 9 columns in this fixed width file format
# 
tmp <- read.fwf(
      file=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"),
      skip=4,
      widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
head(tmp)
sum(tmp[, 4])
# Result is 36515.1, my guess is that the column widths is innacurate (see method 2)

# Method 2
# Read lines from the url to check out the structure
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
lines <- readLines(url, n=10)
# Manually check and count the number of digit for each column and filler width
w <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
# name all columns, filler are empty
colNames <- c("filler", "week", "filler", "sstNino12", "filler", "sstaNino12", "filler", "sstNino3", "filler", "sstaNino3", "filler", "sstNino34", "filler", "sstaNino34", "filler", "sstNino4", "filler", "sstaNino4")
# Read the url and use read,fwf to import the file in a dataframe using the colNames
d <- read.fwf(url, w, header=FALSE, skip=4, col.names=colNames)
# Clean up dataframe to remove filler, could have used dplyr package and select function
d <- d[, grep("^[^filler]", names(d))]
sum(d[, 4])
# Result is 32426.7 (seems to be correct)