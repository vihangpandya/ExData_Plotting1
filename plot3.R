library (lubridate)
library (datasets)

## Read in all the data from power consumption database
dat <- read.csv("./data/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
## subset the data to only include data for Feb 1 and Feb 2 of year 2007
feb07dat <- dat[dat$Date %in% c("2/2/2007", "1/2/2007"), ]
## combine the date and time into a new column "DateTime" and add it to the data frame
feb07dat$DateTime <- strptime(paste(feb07dat$Date, feb07dat$Time), "%d/%m/%Y %H:%M:%S")
## Delete the entire data set "dat" to save memory
rm (dat)
## using plot creat the plot for Energy Sub Metering v/s Day and save it to a file
png(file = "plot3.png", width=480, height=480, bg = "transparent")
plot(feb07dat$DateTime, feb07dat$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(feb07dat$DateTime, feb07dat$Sub_metering_2,type="l",col="red")
lines(feb07dat$DateTime, feb07dat$Sub_metering_3, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()