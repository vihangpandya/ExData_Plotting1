library (lubridate)
library (datasets)


## Read in all the data from power consumption database
dat <- read.csv("./data/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
##subset the data to only include data for Feb 1 and Feb 2 of year 2007
feb07dat <- dat[dat$Date %in% c("2/2/2007", "1/2/2007"), ]
## combine the date and time into a new column "DateTime" and add it to the data frame
feb07dat$DateTime <- strptime(paste(feb07dat$Date, feb07dat$Time), "%d/%m/%Y %H:%M:%S")
## Delete the entire data set "dat" to save memory
rm (dat)
#using plot creat the 4 plots in a 2x2 configuration and save it to a file
png(file = "plot4.png", width=480, height=480, bg = "transparent")
## First plot on top left corner
par(mfrow = c(2, 2))
with (feb07dat, plot(DateTime,Global_active_power, xlab = "", ylab = "Global Active Power",
                     type = "l"))
## Second plot on top right corner
with (feb07dat, plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage",
                     type = "l"))
## Third plot on bottom left corner
plot(feb07dat$DateTime, feb07dat$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(feb07dat$DateTime, feb07dat$Sub_metering_2,type="l",col="red")
lines(feb07dat$DateTime, feb07dat$Sub_metering_3, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))

## Fourth plot on bottom right corner
with (feb07dat, plot(DateTime, Global_reactive_power, xlab = "datetime", ylab = "Global Reactive Power", 
                     type = "l"))
dev.off()