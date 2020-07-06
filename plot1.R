# Downloading the compressed file and extracting it to the source location

dataFile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

download.file(dataFile, destfile = "./Data for Peer Assessment.zip")

unzip(zipfile = "./Data for Peer Assessment.zip",
      exdir = "./Data for Peer Assessment")

# Loading the file data
NEI <- readRDS("./Data for Peer Assessment/summarySCC_PM25.rds")
SCC <- readRDS("./Data for Peer Assessment/Source_Classification_Code.rds")

