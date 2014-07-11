# download file to the current working directory
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="exdata_data_household_power_consumption.zip")

# unzip the downloaded file to the current working directory
unzip("exdata_data_household_power_consumption.zip")  


# read "household_power_consumption.txt" file in working directory
# for dates "1/2/2007" and "2/2/2007"
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),
                  header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', 
                                 header=TRUE,sep=";",nrows=1))

# add field with datetime format
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