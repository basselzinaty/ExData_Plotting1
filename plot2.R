# Plot 2
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


# Create plot2.png
png(file="plot2.png", width=480, height=480)
par(mfrow=c(1,1))
with(elec.data, plot(Time, Global_active_power, type="l",
                     ylab="Global Active Power (kilowatts)",
                     xlab=""))
dev.off()