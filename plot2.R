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
## using plot creat the plot for Global Active Power v/s Day and save it to a file
png(file = "plot2.png", width=480, height=480, bg = "transparent")
with (feb07dat, plot(DateTime,Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)",
                     type = "l"))
dev.off()