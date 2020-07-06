# Reading the file data
NEI <- readRDS("./Data for Peer Assessment/summarySCC_PM25.rds")
SCC <- readRDS("./Data for Peer Assessment/Source_Classification_Code.rds")

# Since my project files are in a different location need to set the
# working directory
setwd("C:/Users/DELL/OneDrive/Desktop/Coursera Folder/Exploratory Data Analysis Week 4 - Project")

# Subset NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate Baltimore emissions
aggBaltimoreEmissions <- aggregate(Emissions ~ year,
                                   baltimoreNEI, sum)

# plotting the graph
png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
  aggBaltimoreEmissions$Emissions,
  names.arg=aggBaltimoreEmissions$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From all Baltimore City Sources"
)

dev.off()