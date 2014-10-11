# Plot 3
# Load the data
dataset <- read.table("household_power_consumption.txt", sep = ";",
                      na.strings = "?", header = TRUE,
                      colClasses = c("character", "character", "numeric", "numeric",
                                     "numeric", "numeric", "numeric", "numeric",
                                     "numeric"))
#Character into date format
dataset$Time <- strptime(paste(dataset$Date, dataset$Time), format="%d/%m/%Y%H:%M:%S")
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")


#Subset needed data (Feb 1 & 2 2007)
elec.data <- subset(dataset, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


# Create plot3.png
png(file="plot3.png", width=480, height=480)
par(mfrow=c(1,1))
with(elec.data, plot(Time,Sub_metering_1, 
                     type = "l", xlab = "",
                     ylab= "Energy sub metering"))
with(elec.data, lines(Time, Sub_metering_2, col = "red"))
with(elec.data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", col = c("black","red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()