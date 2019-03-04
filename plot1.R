
# read data in data frame
dt <- "./data/household_power_consumption.txt"
data <- fread(dt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# subset the data
subSetDt <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# redefine vector as numeric 
global_active_power <- as.numeric(subSetDt$Global_active_power)

# plot
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close device
dev.off()
