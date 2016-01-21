## ---------------------------------------------------------------------------------
## Exploratory Data Analysis
## Week 1 Project
## Cara Hubbell
## January 2016
## ---------------------------------------------------------------------------------
##
## This script creates Plot2. Note that you must run acquiredata.R first!

# Read the data into R
power_consumption<-read.table("./data/power_consumption.txt", header=TRUE, sep="|")

#Create a variable that holds the date and time of each observation
datetime<-paste(power_consumption$date,power_consumption$time,sep="")
datetime<-strptime(datetime,format = "%Y-%m-%d %H:%M:%S")

#Create the plot in a png file
png("plot2.png", width=480, height=480, units="px")
plot(datetime, power_consumption$globalactivepower, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()