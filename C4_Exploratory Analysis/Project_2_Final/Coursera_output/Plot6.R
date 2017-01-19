# Plot 6
# Import dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load library
library(ggplot2)
library(dplyr)
library(magrittr)

# Filter NEI to keep On-road type and Baltimore city and Los Angeles County only
City <- data.frame(fips = c("24510", "06037"), City = c("Baltimore City", "Los Angeles County, California"))
MotorComp <- suppressWarnings(NEI %>%
                                    filter(type == "ON-ROAD" & (fips == "24510" | fips == "06037")) %>%
                                    droplevels() %>%
                                    left_join(City, by = "fips"))

# Plot the result
png(filename = "Plot6.png")
ggplot(MotorComp, aes(x = factor(year), y = Emissions), fill = City) +
      geom_bar(aes(fill = year), stat = "identity") +
      facet_grid(.~ City, scales = "free", space = "free") +
      theme_light() +
      labs(x = "Year", y = "Total PM2.5 Emission (Tons)",
           title = "PM2.5 Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008")
dev.off()