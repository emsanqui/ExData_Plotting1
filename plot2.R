# read "household_power_consumption.txt" file in working directory
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# subset dates "1/2/2007" and "2/2/2007"
dat <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))

# add fields of date and datetime format
dat$DateTime <- as.POSIXct(strptime(paste(dat$Date,dat$Time), format="%d/%m/%Y %H:%M:%S"))

# create png file
png(filename="plot2.png", width = 480, height = 480)

# create plot
plot(y=as.numeric(as.character(dat$Global_active_power)), 
     x=dat$DateTime, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()
