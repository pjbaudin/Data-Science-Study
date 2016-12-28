# Set working directory
# setwd("D:/Data Science/R-Data-Science-Study/R_Programming/Week 4/Assignment_3")

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