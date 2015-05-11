### Allison Moore
### Coursera course project #1 for "Exploratory Data Anlysis"
### Plot 1

# Download the data
setwd("~/Computing/DataAnalysis/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")
if(!file.exists("data")){
        dir.create("data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="./data/power.zip", method="curl")
unzip("./data/power.zip", exdir="./data")

classes <- c("factor", "factor", rep("numeric", 7))
names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Load the main data in with column names and classes
power <- read.table("./data/household_power_consumption.txt", sep =";", skip = 1, na.strings = "?", col.names = names, colClasses = classes) 

# Convert date and time columns, and subset data to only include relevant dates
power$Date <- as.Date(power$Date, "%d/%m/%Y")
relpower <- power[power$Date == "2007-02-02" | power$Date == "2007-02-01", ]
relpower$Time <- strptime(relpower$Time, "%H:%M:%S")

# Remove the data from memory that is not needed.
rm(power) 

# Plot 1 is a histogram that displays Global Active Power
# Note that the default size is 480px by 480 px
png(file = "plot1.png")
hist(relpower$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()