## Reading data on file
## File must be decompressed
dataFile <- "household_power_consumption.txt"

## Assigning data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Filtering data by Date
subSetDate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetDate$Date, subSetDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Generating data to plot
GAP <- as.numeric(subSetDate$Global_active_power)

## Defining the output file parameters
png("plot2.png", width=480, height=480)

## Invoking plot command
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Closing the device file
dev.off()