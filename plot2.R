dataset <- read.csv("./4. Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt", sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
subset <- dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007"
dataset_sub <- dataset[subset, ]

date_time <- paste(dataset_sub$Date, dataset_sub$Time)
dataset_sub$DateTime <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

png("plot2.png", height = 480, width = 480)
with(dataset_sub, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()