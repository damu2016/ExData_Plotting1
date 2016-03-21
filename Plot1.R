#Load in necessary libraries
library(dplyr)

# Read file

dataGAP <- "household_power_consumption.txt"
data <- read.table(dataGAP, header=TRUE, sep=";",dec=".")

#Read subset of data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Convert Global Active Power column to numric
gAP <- as.numeric(as.character(subSetData$Global_active_power))

#Create plot for Global active power and copy to PNG file

png("plot1.png", width=480, height=480)
hist(gAP, col="red",main="Global Active Power",xlab="Global Active (kilowatts)")

dev.off()
