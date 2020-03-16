## Reading data on file
## File must be decompressed
dataFile <- "household_power_consumption.txt"

## Assigning data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Filtering data by Date
subSetDate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Generating data to plot
datetime <- strptime(paste(subSetDate$Date, subSetDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Defining the output file parameters
GAP <- as.numeric(subSetDate$Global_active_power)

SM1 <- as.numeric(subSetDate$Sub_metering_1)
SM2 <- as.numeric(subSetDate$Sub_metering_2)
SM3 <- as.numeric(subSetDate$Sub_metering_3)

## Defining the output file parameters
png("plot3.png", width=480, height=480)

## Invoking plot command
## Defining data to SM1: Sub_Metering_1
plot(datetime, SM1, type="l", ylab="Energy Submetering", xlab="")

## Defining data to SM2: Sub_Metering_2
lines(datetime, SM2, type="l", col="red")

## Defining data to SM3: Sub_Metering_3
lines(datetime, SM3, type="l", col="blue")

## Defining legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Closing the device file
dev.off()