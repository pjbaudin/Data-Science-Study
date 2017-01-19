# Plot 4
# Import dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load library
library(ggplot2)
library(dplyr)
library(magrittr)

# Filter the SCC dataset for combustion and coal related emission source
CoalCombCat <- SCC %>%
      filter(grepl("comb", SCC.Level.One, ignore.case = TRUE) & 
                   grepl("coal", SCC.Level.Four, ignore.case = TRUE)) %>%
      select(SCC) %>%
      droplevels()

#Subset the NEI dataset with the corresponding SCC code
CoalComb <- subset(NEI, SCC %in% CoalCombCat$SCC)

# plot the result
png(filename = "Plot4.png")
ggplot(CoalComb, aes(factor(year), Emissions)) +
      geom_bar(stat = "identity", fill = "steelblue") +
      theme_light() +
      labs(x = "Year", y = "Total PM2.5 Emission (Tons)",
           title = "PM2.5 Coal Combustion Source Emissions Across US from 1999-2008")
dev.off()