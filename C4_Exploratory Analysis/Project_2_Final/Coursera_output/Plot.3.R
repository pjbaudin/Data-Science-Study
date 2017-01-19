# Plot 3
# Import dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load library
library(ggplot2)

# Extract the data for hte city of Baltimore
BALT_NEI <- NEI[NEI$fips == "24510", ]

# Using the BALT.NEI subset
png(filename = "plot3.png")
ggplot(BALT_NEI, aes(factor(year), Emissions, fill = type)) +
      geom_bar(stat = "identity") +
      facet_grid(.~ type, scales = "free", space = "free") +
      theme_light() +
      labs(x = "Year", y = "Total PM2.5 Emission (Tons)", 
           title = "PM2.5 Emissions by source type - Baltimore City 1999-2008")
dev.off()