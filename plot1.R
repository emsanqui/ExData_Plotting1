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


# create png file
png(filename="plot1.png", width = 480, height = 480)

# make histogram
plot1 <- hist(as.numeric(as.character(dat$Global_active_power)),
             col="red", main="Global Active Power", 
             xlab="Global Active Power (kilowatts)")

dev.off()