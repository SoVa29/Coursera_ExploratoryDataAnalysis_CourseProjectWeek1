# Plot 3

#Read data from file and subset data

data.full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subset.data <- data.full[data.full$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subset.data$Date, subset.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

sub.metering1 <- as.numeric(subset.data$Sub_metering_1)
sub.metering2 <- as.numeric(subset.data$Sub_metering_2)
sub.metering3 <- as.numeric(subset.data$Sub_metering_3)

#Create plot and add line graphs
png("plot3.png", width=480, height=480)
plot(datetime, sub.metering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub.metering2, type="l", col="red")
lines(datetime, sub.metering3, type="l", col="blue")
#add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()