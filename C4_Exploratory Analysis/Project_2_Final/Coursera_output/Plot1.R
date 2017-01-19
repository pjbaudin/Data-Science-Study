# Plot 1
# Import dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Use Aggregate() function to compute the sum of the emissions by year
Yearlytotals <- aggregate(Emissions ~ year,NEI, sum)

# Plot the result using base plot system
png(filename = "plot1.png")
barplot(Yearlytotals$Emissions,
        names.arg = Yearlytotals$year,
        xlab = "Year",
        ylab = "PM2.5 Emissions (Tons)",
        main = "Total PM2.5 Emissions From All US Sources")
dev.off()