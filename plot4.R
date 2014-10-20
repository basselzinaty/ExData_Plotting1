# Plot 4
# Load the data
dataset <- read.table("household_power_consumption.txt", sep = ";",
                      na.strings = "?", header = TRUE,
                      colClasses = c("character", "character", "numeric", "numeric",
                                     "numeric", "numeric", "numeric", "numeric",
                                     "numeric"))
#Character into proper date/time format
dataset$Time <- strptime(paste(dataset$Date, dataset$Time), format="%d/%m/%Y%H:%M:%S")
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")


#Subset needed data (Feb 1 & 2 2007)
elec.data <- subset(dataset, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


# Create plot4.png
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(elec.data, plot(Time, Global_active_power, type="l",
                     ylab="Global Active Power",
                     xlab=""))
with(elec.data, plot(Time, Voltage, type="l",
                     ylab="Voltage",
                     xlab="datetime"))
plot(elec.data$Time, elec.data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(elec.data$Time, elec.data$Sub_metering_2, type="l", col="red")
lines(elec.data$Time, elec.data$Sub_metering_3, type="l", col="blue")
with(elec.data, plot(Time,Sub_metering_1, 
                     type = "l", xlab = "",
                     ylab= "Energy sub metering"))
with(elec.data, lines(Time, Sub_metering_2, col = "red"))
with(elec.data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", col = c("black","red", "blue"), lty = 1,
       bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(elec.data, plot(Time, Global_reactive_power, type="l",
                     xlab="datetime"))
dev.off()
