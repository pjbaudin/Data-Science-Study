# Plot 5
# Import dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load library
library(ggplot2)
library(dplyr)
library(magrittr)

# Filter NEI to keep On-road type and Baltimore city only
MotorBalt <- NEI %>%
      filter(type == "ON-ROAD" & fips == "24510") %>%
      droplevels()

# plot the result
png(filename = "Plot5.png")
ggplot(MotorBalt, aes(factor(year), Emissions)) +
      geom_bar(stat = "identity", fill = "steelblue") +
      theme_light() +
      labs(x = "Year", y = "Total PM2.5 Emission (Tons)", 
           title = "PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008")
dev.off()