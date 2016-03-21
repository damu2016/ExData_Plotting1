#Load in necessary libraries
library(dplyr)

# Read file

dataGAP <- "household_power_consumption.txt"
data <- read.table(dataGAP, header=TRUE, sep=";",dec=".")

#Read subset of data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

gAP <- as.numeric(as.character(subSetData$Global_active_power))
gRP <- as.numeric(as.character(subSetData$Global_reactive_power))
voltage <- as.numeric(as.character(subSetData$Voltage))

#Convert Sub_Metering column to numric
sub_Metering_1 <- as.numeric(as.character(subSetData$Sub_metering_1))
sub_Metering_2 <- as.numeric(as.character(subSetData$Sub_metering_2))
sub_Metering_3 <- as.numeric(as.character(subSetData$Sub_metering_3))

#copy to PNG file
png("plot4.png", width=480, height=480)

#Set graphing parameters to show 4 graphs
par(mfcol = c(2,2))

#Graph 1 -- Create plot for Global active power
plot(dateTime, gAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Graph 2 -- Create plot of dateTime Vs Sub metering 1 data
plot(dateTime, sub_Metering_1, type="l", ylab="Energy sub metering", xlab="")

#Adds line graph for datTime Vs Sub metering 2 data in red
lines(dateTime, sub_Metering_2, type="l", col="red")
#Adds line graph for dateTime Vs Sub metering 3 data in red
lines(dateTime, sub_Metering_3, type="l", col="blue")
#Adds legend to graph
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Graph 3 -- Create plot for Voltage
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Graph 4 -- Create plot for Global Reactive Power
plot(dateTime, gRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

