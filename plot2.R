### Allison Moore
### Coursera course project #1 for "Exploratory Data Anlysis"
### Plot 2

# Download the data
setwd("~/Computing/DataAnalysis/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")
if(!file.exists("data")){
        dir.create("data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="./data/power.zip", method="curl")
unzip("./data/power.zip", exdir="./data")

classes <- c("character", "character", rep("numeric", 7))
names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
nastrings <- c("?", "'?'")

# Load the main data in with column names and classes
power <- read.table("./data/household_power_consumption.txt", sep =";", skip = 1, na.strings = nastrings, col.names = names, colClasses = classes)

# Omit NAs and create a single POSIXct column with date and time combined
power <- na.omit(power)
power$DT <- paste(power$Date, power$Time)
power$DT <- strptime(power$DT, "%d/%m/%Y %H:%M:%S")

# Subset to include relevant dates
power$Date <- as.Date(power$Date, "%d/%m/%Y")
relpower <- power[power$Date == "2007-02-02" | power$Date == "2007-02-01", ]

# Optional: remove the data from memory that is not needed.
rm(power) 

# Plot 2 is a plot compares Global Active Power to time in Days.
# Note that the default size is 480px by 480 px
png(file = "plot2.png")
plot(relpower$DT, relpower$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")
dev.off()
