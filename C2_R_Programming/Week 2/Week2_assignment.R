#############################################################################
# R Programming assignment
# 

library(dplyr)
library(purrr)
library(magrittr)

############################
## PART 1
############################

pollutantmean <- function(directory, pollutant, id = 1:332){
      # 'directory is a character vector of length 1 indicating
      # the location of the csv files
      filedir <- paste("C:/Users/PB/Desktop/Data Science Coursera/DataScienceCoursera/R_Programming/")
      setwd(filedir)
      
      # 'pollutant is a character vector of length 1 indicating
      # the name of the pollutatn for which we will calculate the
      # mean; either "sulfate or "nitrate"
     
      # 'id' is an integer vector indicating the monitor ID numbers
      # to be used
      
      # Return the mean of the pollutant across all monitors list
      # in the 'id' vector (ignoring NA values)
      # Note: do not round the result

      data <- list.files(directory, full.names=TRUE)[id]%>%
            map(read.csv) %>%
            bind_rows()
            

      #str(data)
      mean(na.omit(data[, pollutant]))
      
      }
# Test Output

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

############################
## PART 2
############################

complete <- function(directory, id = 1:332){
      ## 'directory is a character vector of length 1 indicating
      ## the location of the CSV files
      ## 'id is an integer vector indicating the monitor ID numbers
      ## to be used
      
      ## Return a data frame of the form:
      ## id nobs
      ## 1 117
      ## 2 1041
      ## ...
      ## where 'id is the monitor ID number and 'nobs is the 
      ## number of complete cases
      
      fileslist <- list.files(directory, full.names=TRUE)[id]
      nobs <- c(id)
      
      for (i in seq_along(fileslist)){
            x <- sum(complete.cases(read.csv(fileslist[i])))
            nobs[i] <- x
            }
      
      data.frame(id, nobs)     
}



complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

############################
## PART 3
############################

corr <- function(directory, threshold = 0) {
      # 'directory is a character vector of length 1 indicating
      # the location of the CSV files
      # 'threshold' is a numeric vector of length 1 indicating the
      # number of completely observed observations (on all
      # variables) required to compute correlation between
      # nitrate and sulfate; the default is 0
      # Return a numeric vector of correlations
      # Note: do not round the result!
      
      fileslist <- list.files(directory, full.names=TRUE)
      
      for (i in seq_along(fileslist)){
            x <- sum(complete.cases(read.csv(fileslist[i])))
            nobs[i] <- x
      }
      
      don <- data.frame(id = 1:length(fileslist), nobs)
      donf <- subset(don, nobs > threshold)
      id <- donf$id
      filetocor <- list.files(directory, full.names=TRUE)[id]
      Don <- c(id)
      
      for (i in seq_along(filetocor)){
            dat <- read.csv(filetocor[i])
            ind <- complete.cases(dat)
            dat <- dat[ind == TRUE, ]
            cr <- cor(dat$sulfate, dat$nitrate)
            Don[i] <- cr
      }
      
      Don
      
      # need to filter each file and calculate cor parameter
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)
