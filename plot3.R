# read "household_power_consumption.txt" file in working directory
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# subset dates "1/2/2007" and "2/2/2007"
dat <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))

# add fields of date and datetime format
dat$DateTime <- as.POSIXct(strptime(paste(dat$Date,dat$Time), format="%d/%m/%Y %H:%M:%S"))

# create png file
png(filename="plot3.png", width = 480, height = 480)

# create plot with Sub_metering_1 black line
plot(y=as.numeric(as.character(dat$Sub_metering_1)), 
     x=dat$DateTime, type="l", xlab="", 
     ylab="Energy sub metering")

# add Sub_metering_2 red line
lines(y=as.numeric(as.character(dat$Sub_metering_2)), 
      x=dat$DateTime, col="red")

# add Sub_metering_3 blue line
lines(y=as.numeric(as.character(dat$Sub_metering_3)), 
      x=dat$DateTime, col="blue")

# add legend
legend(x="topright", col=c("black","red","blue"), lwd=1,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()