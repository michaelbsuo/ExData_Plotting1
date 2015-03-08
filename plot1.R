## Loading data
dataset <- read.csv("./4. Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep=";", na.strings = "?")

## Subset dates 2007-02-01 and 2007-02-02
subset <- dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007"
dataset_sub <- dataset[subset, ]

## Convert the Date and Time
date_time <- paste(dataset_sub$Date, dataset_sub$Time)
dataset_sub$DateTime <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

## Making plots
png("plot1.png", height = 480, width = 480)
hist(dataset_sub$Global_active_power, main = "Global Active Power", xlab = "Global active power(kilowatts)", ylab = "Frequency", col = "red")
dev.off()
