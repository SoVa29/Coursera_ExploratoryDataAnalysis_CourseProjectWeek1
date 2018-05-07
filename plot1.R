# Plot 1

#Read data from file and subset data
data.full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subset.data <- data.full[data.full$Date %in% c("1/2/2007","2/2/2007") ,]
global.active.power <- as.numeric(subset.data$Global_active_power)

#Create file with 1st histogram
png("plot1.png", width=480, height=480)
hist(global.active.power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()