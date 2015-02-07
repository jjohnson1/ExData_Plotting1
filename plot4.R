# Plot3.R
# This script generates the fourth plot for Course Project 1 in the Exploratory
# Data Analysis course.

# Read in raw data (assumed to be in working directory)
raw <- read.table("household_power_consumption.txt", header=T, sep=";",
                  colClasses = c('character', 'character', rep("numeric", 7)),
                  na.strings="?")

# extract data from desired dates
dat <- subset(raw, Date=="1/2/2007" | Date=="2/2/2007")

# convert Dates to date class
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

# Create timestamp object to use for plotting
timestamp <- as.POSIXct(paste(dat$Date, dat$Time), format="%Y-%m-%d %H:%M:%S")

# Create plots using png graphics device
png("plot4.png")

# Set plot preferences
par(mfrow = c(2,2))

### First plot: top left
plot(timestamp, dat$Global_active_power, type = "l", 
     ylab="Global Active Power", xlab = "")

### Second plot: top right
plot(timestamp, dat$Voltage, type = "l", 
     ylab = "voltage", xlab = "datetime")

### Third plot: bottom left
plot(timestamp, dat$Sub_metering_1, xlab = xlabel, ylab = ylabel, type = "l")
lines(timestamp, dat$Sub_metering_2, col="red", type = "l")
lines(timestamp, dat$Sub_metering_3, col="blue", type = "l")

# Create legend
entries <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colors <- c("black", "red", "blue")
linetypes <- rep(1,3)
legend("topright", legend = entries, col = colors, lty = linetypes)

### Fourth plot: bottom right
plot(timestamp, dat$Global_reactive_power, type = "l",
     xlab = "datetime", ylab="Global_reactive_power")

dev.off()