# Plot 2

#Read data from file and subset data
data.full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subset.data <- data.full[data.full$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subset.data$Date, subset.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global.active.power <- as.numeric(subset.data$Global_active_power)

#Create graph of date/time vs Global Active Power data
png("plot2.png", width=480, height=480)
plot(datetime, global.active.power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()