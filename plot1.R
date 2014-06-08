# Plot1

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

#Histogram
png(filename = "plot1.png", width = 480, height = 480)

hist(power$Global_active_power, col="red",
	main="Global Active Power", 
	xlab="Global Active Power (kilowatts)")

dev.off()
