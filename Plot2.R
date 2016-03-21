#Load in necessary libraries
library(dplyr)

# Read file

dataGAP <- "household_power_consumption.txt"
data <- read.table(dataGAP, header=TRUE, sep=";",dec=".")

#Read subset of data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Convert Global Active Power column to numric
gAP <- as.numeric(as.character(subSetData$Global_active_power))

#Create graph of DateTime Vs Global Active Power data and copy to PNG file

png("plot2.png", width=480, height=480)
plot(datetime, gAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
