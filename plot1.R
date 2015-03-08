dataset <- read.csv("./4. Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep=";", na.strings = "?")
subset <- dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007"
dataset_sub <- dataset[subset, ]

date_time <- paste(dataset_sub$Date, dataset_sub$Time)
dataset_sub$DateTime <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

png("plot1.png", height = 480, width = 480)
hist(dataset_sub$Global_active_power, main = "Global Active Power", xlab = "Global active power(kilowatts)", ylab = "Frequency", col = "red")
dev.off()
