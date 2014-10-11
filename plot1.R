# Plot 1
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


# Create plot1.png
png(file="plot1.png", width=480, height=480)
par(mfrow=c(1,1))
hist(elec.data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()