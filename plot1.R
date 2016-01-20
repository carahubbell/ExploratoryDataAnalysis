## ---------------------------------------------------------------------------------
## Exploratory Data Analysis
## Week 1 Project
## Cara Hubbell
## January 2016
## ---------------------------------------------------------------------------------
##
## This script creates Plot1. Note that you must run acquiredata.R first!

# Read the data into R
power_consumption<-read.table("./data/power_consumption.txt", header=TRUE, sep="|")

# Create the histogram in a png file
png(filename="./plot1.png", width=480, height=480, units='px')
hist(power_consumption$globalactivepower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()