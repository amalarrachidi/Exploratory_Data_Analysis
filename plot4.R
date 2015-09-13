# reading the file 
ALL_DATA <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"),header=T, sep=";")
# having only the dates 2007-02-01 and 2007-02-02
DATA <- ALL_DATA[as.character(ALL_DATA$Date) %in% c("1/2/2007", "2/2/2007"),]
# paste date and time
DATA$dateTime = paste(DATA$Date, DATA$Time)
DATA$dateTime <- strptime(DATA$dateTime, "%d/%m/%Y %H:%M:%S")

# creating plot4.png

png("plot4.png", width=480, height=480, units="px")

par(mfrow = c(2, 2))
with(DATA, {
# 1,1
  plot(DATA$dateTime,as.numeric(DATA$Global_active_power),type= "l",xlab="", ylab = "Global Active power (Kilowatts)")  
  
#1,2
plot(DATA$dateTime,DATA$Voltage,type="l",ylab="Voltage", xlab = "Datetime")
    
#2,1 
plot(DATA$dateTime,DATA$Sub_metering_1,type= "l",xlab="", ylab = "Energy sub metering",ylim=c(0,30),col="black")
lines(DATA$dateTime,DATA$Sub_metering_2,col="red")
lines(DATA$dateTime,DATA$Sub_metering_3,col="blue")

legend("topright", pch = '-', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


#2,2

plot(DATA$dateTime,DATA$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab = "Datetime")

}
)

dev.off()

