# Downloading the compressed file and extracting it to the source location

dataFile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

download.file(dataFile, destfile = "./Data for Peer Assessment.zip")

unzip(zipfile = "./Data for Peer Assessment.zip",
      exdir = "./Data for Peer Assessment")

# Reading the file data
NEI <- readRDS("./Data for Peer Assessment/summarySCC_PM25.rds")
SCC <- readRDS("./Data for Peer Assessment/Source_Classification_Code.rds")

# We first need to find the aggregate total PM2.5 emission from all sources for 
# each of the years 1999, 2002, 2005, and 2008.
aggTotalEmissions <- aggregate(Emissions ~ year,NEI, sum)

# Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? Using the base plotting system, make a plot 
# showing the total PM2.5 emission from all sources for each of 
# the years 1999, 2002, 2005, and 2008.

png("plot1.png", width=480,height=480,units="px",bg="transparent")

barplot(height=aggTotalEmissions$Emissions, 
        names.arg=aggTotalEmissions$year, 
        xlab="years", 
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions at various years')
        )
