# read "household_power_consumption.txt" file in working directory
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# subset dates "1/2/2007" and "2/2/2007"
dat <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))

# add fields of date and datetime format
dat$DateTime <- as.POSIXct(strptime(paste(dat$Date,dat$Time), format="%d/%m/%Y %H:%M:%S"))


# create png file
png(filename="plot4.png", width = 480, height = 480)


# make four panels
par(mfrow=c(2,2))


# TOP LEFT PLOT
# create plot with Global_active_power black line ####
plot(y=as.numeric(as.character(dat$Global_active_power)), 
     x=dat$DateTime, type="l", xlab="", 
     ylab="Global Active Power")


# TOP RIGHT PLOT
# create plot with Voltage black line ####
plot(y=as.numeric(as.character(dat$Voltage)), 
     x=dat$DateTime, type="l", 
     ylab="Voltage", xlab="datetime")


# BOTTOM LEFT PLOT
# create plot with Sub_metering_1 black line ####
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
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")


# BOTTOM RIGHT PLOT
# create plot with Global_reactive_power black line ####
plot(y=as.numeric(as.character(dat$Global_reactive_power)), 
     x=dat$DateTime, type="l", 
     ylab="Global_reactive_power", xlab="datetime")

dev.off()