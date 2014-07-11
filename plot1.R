# read "household_power_consumption.txt" file in working directory
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# subset dates "1/2/2007" and "2/2/2007"
dat <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))

# create png file
png(filename="plot1.png", width = 480, height = 480)

# make histogram
plot1 <- hist(as.numeric(as.character(dat$Global_active_power)),
             col="red", main="Global Active Power", 
             xlab="Global Active Power (kilowatts)")

dev.off()