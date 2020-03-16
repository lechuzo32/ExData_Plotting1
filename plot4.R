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
## Defining data to GRP: Global_active_power
GAP <- as.numeric(subSetDate$Global_active_power)

## Defining data to GRP: Global_reactive_power
GRP <- as.numeric(subSetDate$Global_reactive_power)

## Defining data to voltage
voltage <- as.numeric(subSetDate$Voltage)

## Defining data to SM1: Sub_Metering_1
SM1 <- as.numeric(subSetDate$Sub_metering_1)

## Defining data to SM2: Sub_Metering_2
SM2 <- as.numeric(subSetDate$Sub_metering_2)

## Defining data to SM3: Sub_Metering_3
SM3 <- as.numeric(subSetDate$Sub_metering_3)

## Defining the output file parameters
png("plot4.png", width=480, height=480)

## Defining quantity and positions of plots
par(mfrow = c(2, 2)) 

## Invoking plot command
## Plot No. 1 -> (1,1)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

## Plot No. 2 -> (1,2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

## Plot No. 3 -> (2,1)
plot(datetime, SM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SM2, type="l", col="red")
lines(datetime, SM3, type="l", col="blue")

## Defining legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=0, col=c("black", "red", "blue"), bty="o")

## Plot No. 4 -> (2,2)
plot(datetime, GRP, type="l", xlab="datetime", ylab="Global Reactive Power")

## Closing the device file
dev.off()