

# read in data for  2007-02-01 and 2007-02-02
power <- read.table("household_power_consumption.txt", nrows=2880,
	sep = ";", na.strings="?", skip=66637)
head(power)
tail(power)

#get header names
headers <- read.table("household_power_consumption.txt", nrows=2,
	sep = ";", na.strings="?", header=TRUE)

names(power) <- names(headers)
summary(power)

#create date-and-time variable
power$datetime <- 
	strptime(paste(as.Date(power$Date, "%d/%m/%Y", tz=""),
			power$Time), "%Y-%m-%d %H:%M:%S")
str(power)

#Line plot over time

png(filename = "plot2.png", width = 480, height = 480)
with(power, plot(datetime,Global_active_power, type="l",
	xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
