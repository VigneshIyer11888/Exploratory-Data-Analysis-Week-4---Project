# Reading the file data
NEI <- readRDS("../Data for Peer Assessment/summarySCC_PM25.rds")
SCC <- readRDS("../Data for Peer Assessment/Source_Classification_Code.rds")

# loading the ggplot2 library
library(ggplot2)

# Subset NEI data
subsetNEIYearType <- NEI[NEI$fips=="24510",]

# Aggregate emissions based on Year and Type
aggEmissionsYearType <- aggregate(Emissions ~ year,
                                   subsetNEIYearType, sum)

# plotting the graph
png("plot3.png",width=480,height=480,units="px",bg="transparent")

ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

dev.off()