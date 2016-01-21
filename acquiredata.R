## ---------------------------------------------------------------------------------
## Exploratory Data Analysis
## Week 1 Project
## Cara Hubbell
## January 2016
## ---------------------------------------------------------------------------------
##
## This script downloads, reads, and cleans the data for the plots in this project.

# Require packages
print("Installing and loading required packages", quote=FALSE)
sapply(c("dplyr","data.table", "lubridate"), require, character.only=TRUE)

# Download and unzip the data
print("Downloading data", quote=FALSE)
if(!file.exists("./data")){dir.create("./data")}
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Load the data into R
print("Loading data into R", quote=FALSE)
hpc <- read.table("./data/household_power_consumption.txt", header=TRUE, 
                  sep=';', na.strings='?')

# Take only the rows of interest (Feb 1 and Feb 2 in 2007)
print("Filtering data", quote=FALSE)
power_consumption<-filter(hpc,Date=="1/2/2007"|Date=="2/2/2007")

# Rename variables and change date and time variable classes
names(power_consumption)<-gsub("_","",names(power_consumption))
names(power_consumption)<-tolower(names(power_consumption))
power_consumption$date<-as.Date(power_consumption$date, format="%d/%m/%Y")

# Get information about the tidy data and view the result
str(power_consumption)
View(power_consumption, "Household Power Consumption")

# Write the tidy data to a new file and remove the very large file as
#     it is no longer needed.
print("Creating new data file", quote=FALSE)
write.table(power_consumption,file="./data/power_consumption.txt", 
            sep='|',row.names=FALSE)
file.remove("./data/household_power_consumption.txt")