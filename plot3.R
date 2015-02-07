# Plot3.R
# This script generates the third plot for Course Project 1 in the Exploratory
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

# Set plot preferences
xlabel = ""
ylabel = "Energy sub metering"

# Create plot using png graphics device
png("plot3.png")
plot(timestamp, dat$Sub_metering_1, xlab = xlabel, ylab = ylabel, type = "l")
lines(timestamp, dat$Sub_metering_2, col="red", type = "l")
lines(timestamp, dat$Sub_metering_3, col="blue", type = "l")

# Create legend
entries <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colors <- c("black", "red", "blue")
linetypes <- rep(1,3)
legend("topright", legend = entries, col = colors, lty = linetypes)

# close graphics device
dev.off()