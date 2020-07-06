# Reading the file data
NEI <- readRDS("../Data for Peer Assessment/summarySCC_PM25.rds")
SCC <- readRDS("../Data for Peer Assessment/Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
subsetBaltimoreNEI <- NEI[NEI$fips=="24510",]

# Aggregate Baltimore emissions
aggBaltimoreEmissions <- aggregate(Emissions ~ year,
                                   subsetBaltimoreNEI, sum)

# plotting the graph
png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(height=aggBaltimoreEmissions$Emissions,
        names.arg=aggBaltimoreEmissions$year,
        xlab="years",
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))

dev.off()