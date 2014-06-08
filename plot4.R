
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

# 2 by 2 plot

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

with(power, plot(datetime,Global_active_power, type="l",
	xlab="", ylab="Global Active Power"))

with(power, plot(datetime,Voltage, type="l",
	xlab="datetime", ylab="Voltage"))

plot(power$datetime,power$Sub_metering_1,type="l", 
	ylim=c(0,38), xlab="", ylab="", axes=FALSE)
par(new=T)
plot(power$datetime,power$Sub_metering_2,type="l", col="red", 
	ylim=c(0,38), xlab="", ylab="", axes=FALSE)
par(new=T)
plot(power$datetime,power$Sub_metering_3,type="l", col="blue", 
	ylim=c(0,38) , xlab="", ylab="Energy sub metering")
legend(x="topright",
	c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	lty=c(1, 1, 1),
	col=c("black", "red", "blue"),
	bty="n", cex=0.9)

with(power, plot(datetime,Global_reactive_power, type="l",
	xlab="datetime", ylab="Global_reactive_power"))
dev.off()


