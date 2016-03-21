#Load in necessary libraries
library(dplyr)

# Read file

dataGAP <- "household_power_consumption.txt"
data <- read.table(dataGAP, header=TRUE, sep=";",dec=".")

#Read subset of data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Convert Sub_Metering column to numric
sub_Metering_1 <- as.numeric(as.character(subSetData$Sub_metering_1))
sub_Metering_2 <- as.numeric(as.character(subSetData$Sub_metering_2))
sub_Metering_3 <- as.numeric(as.character(subSetData$Sub_metering_3))

#Create plot of dateTime Vs Sub metering 1 data and copy to PNG file
png("plot3.png", width=480, height=480)

plot(dateTime, sub_Metering_1, type="l", ylab="Energy sub metering", xlab="")

#Adds line graph for datTime Vs Sub metering 2 data in red
lines(dateTime, sub_Metering_2, type="l", col="red")
#Adds line graph for dateTime Vs Sub metering 3 data in red
lines(dateTime, sub_Metering_3, type="l", col="blue")
#Adds legend to graph
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

