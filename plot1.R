# Plot1.R
# This script generates the first plot for Course Project 1 in the Exploratory
# Data Analysis course.

# Read in raw data (assumed to be in working directory)
raw <- read.table("household_power_consumption.txt", header=T, sep=";",
                  colClasses = c('character', 'character', rep("numeric", 7)),
                  na.strings="?")

# extract data from desired dates
dat <- subset(raw, Date=="1/2/2007" | Date=="2/2/2007")

# convert Dates to date class
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

# Set plot preferences
xlabel <- "Global Active Power (kilowatts)"
ylabel <- "Frequency"
chartTitle <- "Global Active Power"

# Create histogram of Global Active Power using the png graphics device
png("plot1.png")
hist(dat$Global_active_power, xlab = xlabel, ylab = ylabel, main = chartTitle, col="red")
dev.off()