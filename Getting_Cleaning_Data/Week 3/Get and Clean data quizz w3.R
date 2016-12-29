# Week 3 Quizz practice

library(dplyr)
library(magrittr)

setwd("D:/Data Science/R-Data-Science-Study/Getting_Cleaning_Data/Week 3")

# Create a logical vector that identifies the households
# on greater than 10 acres who sold more than $10,000 worth
# of agriculture products.
# Assign that logical vector to the variable agricultureLogical.
# Apply the which() function like this to identify
# the rows of the data frame where the logical vector is TRUE.

agrdf <- read.csv("getdata_data_ss06hid.csv")

glimpse(agrdf)

# Logical
agriculturalLogical <- agrdf$ACR == 3 & agrdf$AGS == 6 
# Vector
which(agriculturalLogical)[1:3]

# Q2
# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)

library(jpeg)
# Import image
img <- readJPEG("getdata_jeff.jpg", native = TRUE)
# Compute quantile
quantile(img, probs = c(0.3, 0.8))


# Q3
# Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame?

GDPdf <- tbl_df(read.csv("getdata_data_GDP.csv", skip = 4,
                         nrows = 215))

names(GDPdf)[c(1, 2, 5)] <- c("CountryCode", "Ranking", "GDP")

head(GDPdf)

EDCountry <- tbl_df(read.csv("getdata_data_EDSTATS_Country.csv"))

DF_merged <- merge(GDPdf, EDCountry, by = "CountryCode")

DF_merged %>%
      filter(Ranking != "") %>%
      summarize(n_distinct(CountryCode),
                n_distinct(Ranking))

DF_merged %>%
      arrange(desc(Ranking)) %>%
      select(Long.Name) %>%
      head(n = 15)

# Q4
# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group? 

DF_merged %>%
      group_by(Income.Group) %>%
      summarise(mean(Ranking, na.rm = TRUE))

# Q5
# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?

qgroups <- quantile(DF_merged$Ranking,
                    probs = seq(0, 1, 0.2), na.rm = TRUE)

DF_merged$QuantileGDP <- cut(DF_merged$Ranking, breaks = qgroups)
DF_merged %>%
      group_by(Income.Group, QuantileGDP) %>%
      filter(Income.Group == "Lower middle income") %>%
      summarise(n_distinct(CountryCode))
