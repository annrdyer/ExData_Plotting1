## This script reads electric power consumption data obtained from the UC Irvine Machine Learning Repository.
## A time series plot of Global Active Power is generated and saved to a PNG file.


## Read in data from working directory
powerData <- read.table("./household_power_consumption.txt" , header=TRUE, sep = ";", na.strings = "?",
                        colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Create datetime and date variables
powerData$datetime <- strptime( paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

## Subset data for Feb 1 and Feb 2 2007
powerPlot2 <- subset(powerData, powerData$Date >= "2007-02-01" & powerData$Date <= "2007-02-02", select=c(datetime, Global_active_power))


## Create time series plot of Global Active Power
png(filename="plot2.png",width=480,height=480,units="px")

plot(powerPlot2$datetime, powerPlot2$Global_active_power, type="l", main="", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()





