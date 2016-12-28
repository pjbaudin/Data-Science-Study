## R_Programming Week 4
## Programming Assignment 3

# Set working directory
setwd("D:/Data Science/R-Data-Science-Study/R_Programming/Week 4/Assignment_3")

# Load useful package
library(dplyr)
library(magrittr)

# Import data
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
# head(outcome)
# str(outcome)
glimpse(outcome) 
dim(outcome)

# outcome_colnames <- names(outcome)
# outcome_colnames

# Plot the 30-day mortality rates for heart attack

outcome[, 11] <- as.numeric(outcome[, 11])
# Message NAs introduced by coersion is ok
hist(outcome[, 11])

# Save graph
png("30-day mortality rate HA.png")
hist(outcome[, 11])
dev.off()

# Finding the best hospital in a state
# Function best

best4 <- function(state, outcome) {
      # Invalid outcome check
      # Assume that input is lower case
      if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
            stop("invalid outcome")
      }
      
      # Read dataset
      dataset <- read.csv("outcome-of-care-measures.csv", colClasses="character")
      
      #Invalid state check
      if (sum(dataset[, 7] == state) == 0) {
            stop("invalid state")
      }
      
      # Assign index for the outcome input
      # After checking the Flatfiles:
      # col 2: hospital name
      # col 7: state
      # col 11: heart attack
      # col 17: heart failure
      # col 23: Pneumonia
      # This could also be done by searching the column names (names())
      # for the corresponding character string (not necessary here)
      ind <- ifelse(outcome == "heart attack", 11, ifelse(outcome == "heart failure", 17, 23))
      
      # Coerce the dataset for processing 
      # Suppressing warnings and remove NA's.
      dataset[,ind] <- suppressWarnings(as.numeric(dataset[,ind]))
      dataset <- na.omit(dataset)
      
      # Return hospital name in that state
      # with lowest 30-day death rate
      # Subset by state and sort by outcome value and then hospital name.
      hosp <- subset(dataset, State==state)
      hosp <- hosp[order(hosp[, ind], hosp[, 2], na.last = TRUE), ]
      hosp <- na.omit(hosp)
      
      #Output hospital name with the lowest 30-day mortality rate.
      hosp[1, 2]
}

# Rank hospitals by outcome in a state

rankhospital <- function(state, outcome, num = "best") {
      # Invalid outcome check
      # Assume that input is lower case
      if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
            stop("invalid outcome")}
      
      # Read dataset
      dataset <- read.csv("outcome-of-care-measures.csv", colClasses="character")
      
      #Invalid state check
      if (sum(dataset[, 7] == state) == 0) {
            stop("invalid state")}
      
      # Assign index for the outcome input
      # After checking the Flatfiles:
      # col 2: hospital name
      # col 7: state
      # col 11: heart attack
      # col 17: heart failure
      # col 23: Pneumonia
      # This could also be done by searching the column names (names())
      # for the corresponding character string (not necessary here)
      ind <- ifelse(outcome == "heart attack", 11, ifelse(outcome == "heart failure", 17, 23))
      
      # Coerce the dataset for processing 
      # Suppressing warnings and remove NA's.
      dataset[,ind] <- suppressWarnings(as.numeric(dataset[,ind]))
      dataset <- na.omit(dataset)
      
      # Return hospital name in that state
      # with lowest 30-day death rate
      # Subset by state and sort by outcome value and then hospital name.
      hosp <- subset(dataset, State==state)
      hosp <- hosp[order(hosp[, ind], hosp[, 2], na.last = TRUE), ]
      hosp <- na.omit(hosp)
      
      # Assign value to num as per input
      num <- ifelse(num == "best", 1, ifelse(num == "worst", nrow(hosp), as.numeric(num)))
      
      #Output hospital name with the 30-day mortality rate for a given outcome, state and rank.
      hosp[num, 2]
}



# Rank hospital in all states

# Ranking hospitales in all states

rankall <- function(outcome, num = "best"){
      # Invalid outcome check
      # Assume that input is lower case
      if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
            stop("invalid outcome")}
      
      # Read dataset
      dataset <- read.csv("outcome-of-care-measures.csv", colClasses="character")
      
      # Assign index for the outcome input
      # After checking the Flatfiles:
      # col 2: hospital name
      # col 7: state
      # col 11: heart attack
      # col 17: heart failure
      # col 23: Pneumonia
      # This could also be done by searching the column names (names())
      # for the corresponding character string (not necessary here)
      # select only relevant columns
      dataset <- dataset[,c(2,7,11,17,23)]
      # Rename columns
      colnames(dataset) <- c("hospital","state","heart attack","heart failure","pneumonia")
      # Coerce Hospital as character
      dataset$hospital <- as.character(dataset$hospital)
      
      # Create a unique list of  state and coerce into character
      statelist<-as.character(unique(dataset$state))
      
      # Function to rank hospital by state
      rankhosp <- function(ST) {
            ind <- ifelse(outcome == "heart attack", 3, ifelse(outcome == "heart failure", 4, 5))
            
            # Coerce the dataset for processing 
            # Suppressing warnings and remove NA's.
            dataset[, ind] <- suppressWarnings(as.numeric(dataset[, ind]))
            dataset <- na.omit(dataset)
            
            # Return hospital name in that state
            # with lowest 30-day death rate
            # Subset by state and sort by outcome value and then hospital name.
            hosp <- subset(dataset, state == ST)
            hosp <- hosp[order(hosp[, ind], hosp[, 1], na.last = TRUE), ]
            #hosp <- na.omit(hosp)
            
            # Assign value to num as per input
            num <- ifelse(num == "best", 1, ifelse(num == "worst", nrow(hosp), as.numeric(num)))
            
            #Output hospital name with the 30-day mortality rate for a given outcome, state and rank.
            res <- c(hosp[num, 1], ST)
      }
      
      # Loop over statelist using rankhosp function
      # Sort statelist
      statelist<-sort(statelist)
      df <- lapply(statelist, rankhosp)
      df<- as.data.frame(do.call(rbind, df), row.names = statelist)
      colnames(df) <- c("hospital", "state")
      
      return (df)
}