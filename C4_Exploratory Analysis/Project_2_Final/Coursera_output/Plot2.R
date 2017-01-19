# Plot 2

# Import dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extract the data for hte city of Baltimore
BALT_NEI <- NEI[NEI$fips == "24510", ]

# Use aggregate() function to compute the sum of the yearly emission in the city of Baltimore
BALT_total <- aggregate(Emissions ~ year, BALT_NEI, sum)

# Plot the result using base plot system
png(filename = "plot2.png")
barplot(BALT_total$Emissions,
        names.arg = BALT_total$year,
        xlab = "Year",
        ylab = "PM2.5 Emissions (Tons)",
        main = "Total PM2.5 Emissions in Baltimore")
dev.off()