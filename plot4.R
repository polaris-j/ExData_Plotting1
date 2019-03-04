
# read data in data frame
dt <- "./data/household_power_consumption.txt"
data <- fread(dt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# subset the data
subSetDt <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# create needed variables for plot
global_active_power <- as.numeric(subSetDt$Global_active_power)
datetime <- strptime(paste(subSetDt$Date, subSetDt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_metering_1 <- as.numeric(subSetDt$Sub_metering_1)
sub_metering_2 <- as.numeric(subSetDt$Sub_metering_2)
sub_metering_3 <- as.numeric(subSetDt$Sub_metering_3)
global_reactive_power <- as.numeric(subSetDt$Global_reactive_power)
voltage <- as.numeric(subSetDt$Voltage)

# plot graphs
png("plot4.png", width=480, height=480)
# create a 2 by 2 frame
par(mfrow = c(2, 2)) 
# plot each invidual graphs
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="", col="black")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# close device
dev.off()