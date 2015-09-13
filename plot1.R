# Plot 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download the zip the file 
download.file(fileUrl, destfile="household_power_consumption.zip")
# reading the file 
ALL_DATA <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"),header=T, sep=";")
# having only the dates 2007-02-01 and 2007-02-02
DATA <- ALL_DATA[as.character(ALL_DATA$Date) %in% c("1/2/2007", "2/2/2007"),]
# paste date and time
DATA$dateTime = paste(DATA$Date, DATA$Time)
DATA$dateTime <- strptime(DATA$dateTime, "%d/%m/%Y %H:%M:%S")

# creating plot1.png
png("plot1.png", width=480, height=480, units="px")
# hitogram
hist(as.numeric(DATA$Global_active_power),col="red",xlab="Global Active Power (Kilowatts)",main = "Global Active Power")

dev.off()

