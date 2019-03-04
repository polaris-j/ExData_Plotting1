
# read data in data frame
dt <- "./data/household_power_consumption.txt"
data <- fread(dt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# subset the data
subSetDt <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# create needed variables for plot
global_active_power <- as.numeric(subSetDt$Global_active_power)
datetime <- strptime(paste(subSetDt$Date, subSetDt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# plot
png("plot2.png", width=480, height=480)
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# close device
dev.off()


