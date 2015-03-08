## Loading data
dataset <- read.csv("./4. Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt", sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

## Subset dates 2007-02-01 and 2007-02-02
subset <- dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007"
dataset_sub <- dataset[subset, ]

## Convert the Date and Time
date_time <- paste(dataset_sub$Date, dataset_sub$Time)
dataset_sub$DateTime <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

## Making plots
png("plot3.png", height = 480, width = 480)
with(dataset_sub, {
        plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        lines(DateTime, Sub_metering_2, type = "l", col = "red")
        lines(DateTime, Sub_metering_3, type = "l", col = "blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()