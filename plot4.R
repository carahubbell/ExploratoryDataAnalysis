## ---------------------------------------------------------------------------------
## Exploratory Data Analysis
## Week 1 Project
## Cara Hubbell
## January 2016
## ---------------------------------------------------------------------------------
##
## This script creates Plot4. Note that you must run acquiredata.R first!

# Read the data into R
power_consumption<-read.table("./data/power_consumption.txt", header=TRUE, sep="|")

#Create a variable that holds the date and time of each observation
datetime<-paste(power_consumption$date,power_consumption$time,sep="")
datetime<-strptime(datetime,format = "%Y-%m-%d %H:%M:%S")

#Create the plot in a png file
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(datetime, power_consumption$globalactivepower, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

plot(datetime,power_consumption$voltage,type="l",xlab="datetime",ylab="Voltage")

plot(datetime,power_consumption$submetering1, type="n", xlab="", 
     ylab="Energy sub metering")
points(datetime,power_consumption$submetering1, type="l")
points(datetime,power_consumption$submetering2, type="l", col="red")
points(datetime,power_consumption$submetering3, type="l", col="blue")
legend("topright", lwd=1, lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(datetime,power_consumption$globalreactivepower,xlab="datetime",
     ylab="Global_reactive_power",type="l")

dev.off()