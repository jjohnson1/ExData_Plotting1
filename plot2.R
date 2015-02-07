# Plot2.R
# This script generates the second plot for Course Project 1 in the Exploratory
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
xlabel <- ""
ylabel <- "Global Active Power (kilowatts)"

# Create plot using png graphics device
png("plot2.png")
plot(timestamp, dat$Global_active_power, xlab = xlabel, ylab = ylabel, type="l")
dev.off()
