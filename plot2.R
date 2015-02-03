#
# Create plot 2 for project 1 of the Coursera Exploratory Data Analysis class
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
# plot the data
#
png("plot2.png")
plot(df$DateTime, df$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(df$DateTime, df$Global_active_power)

