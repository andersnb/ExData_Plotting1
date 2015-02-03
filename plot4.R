#
# Create plot 4 for project 1 of the Coursera Exploratory Data Analysis class
#
# modification history
# --------------------
# Created by Bill Anderson on 02Feb2015
#

#
# first, read in the data
#
df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

#
# convert date/time fields
#
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

#
# subset data for dates of interest
#
df <- df[(df$Date == "2007-02-01" | df$Date == "2007-02-02"), ]

#
# open the output device
#
png("plot4.png")

#
# set the layout of the plots
#
par(mfrow = c(2, 2))

#
# plot the first plot
#
plot(df$DateTime, df$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(df$DateTime, df$Global_active_power)

#
# plot the second plot
#
plot(df$DateTime, df$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(df$DateTime, df$Voltage)

#
# plot the third plot
#
plot(df$DateTime, df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_1, col="black")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

#
# plot the fourth plot
#
plot(df$DateTime, df$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(df$DateTime, df$Global_reactive_power)

