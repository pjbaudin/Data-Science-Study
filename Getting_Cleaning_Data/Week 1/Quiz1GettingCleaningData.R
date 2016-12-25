# Getting an Cleaning data
# Quiz - week 1

library(dplyr)
library(purrr)

# Import csv file
# Codebook: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# 2006 Microdata survey from American Community Survey

path<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

df <- source(path)
dateDownloaded <- date()

dateDownloaded
#str(df)

rich <- sum(na.omit(df$VAL == 24))
print(rich)

# Import Excel file
# From Natural Gas Acquisition Program

library(readxl)

if(!file.exists("excel_data")) {dir.create("Excel_data")}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

download.file(fileURL, destfile = "./Excel_dataNaturalGAS.xlsx", method = "curl")

dateDownloaded2 <- date()

df2 <- read_excel("./Excel_dataNaturalGAS.xlsx", col_names = FALSE)

dateDownloaded2
#str(df2)
dim(df2)

# Question 3 of quiz
cnames <- df2[18, 7:15]
dat <- df2[19:23, 7:15]
colnames(dat) <- cnames
dat$Zip <- as.numeric(dat$Zip)
dat$Ext <- as.numeric(dat$Ext)
sum(dat$Zip*dat$Ext,na.rm=T)

# Read xml file
# Baltimore restaurant

library(XML)

# fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
# is not URL http of ftp

fileURL2 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

doc <- xmlTreeParse(fileURL2, useInternalNodes = TRUE)

dateDownloaded3 <- date()

dateDownloaded3
str(doc)

rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

rootNode[[1]][[1]]

df3 <- xpathSApply(rootNode, "//zipcode", xmlValue)
summary(df3)
head(df3)
sum(df3 == "21231")

# Comparing performance of different function - question 5
# Using crude approach and tictoc package for timing
# Figure it was DT that was faster as mentionned in the course.
# 
# Correct approach is to replicate experiment a number of time,
# let say race = 1000 and time appropriately
# see https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-week-1/


library(data.table)
library(tictoc)
fileURL3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

DT <- fread(fileURL3)
tic()
system.time(mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15))
toc()

DT <- fread(fileURL3)
tic()
system.time(mean(DT$pwgtp15,by=DT$SEX))
toc()

DT <- fread(fileURL3)
tic()
system.time(DT[,mean(pwgtp15),by=SEX])
toc()

DT <- fread(fileURL3)
tic()
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
toc()

# Error in the paramters of the function (no time to investigate)
#DT <- fread(fileURL3)
#tic()
#system.time(rowMeans(DT)[DT$SEX==1], rowMeans(DT)[DT$SEX==2])
#toc()

DT <- fread(fileURL3)
tic()
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
toc()