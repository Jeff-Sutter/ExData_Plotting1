
##
##  Routine from this point onward assumes that the file
##  household_power_consumption.txt is available in the working directory
##

##  Read data file and subset out the data for 1/2/2007 & 2/2/2007

    power <- read.csv("household_power_consumption.txt", sep =";", na.strings = "?")
    power <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

##  Combine Date and Time fields into a single DateTime variable and 
##  append to the table
    
    power$Date <- as.character(power$Date)
    power$Time <- as.character(power$Time)
    power <- cbind(power, "datetime" = strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S"))

##  Open the png file and write the four graphs
    
    png("plot4.png", width=480, height=480)
    
    par(mfcol = c(2,2))
    
    plot(power$datetime, power$Global_active_power, type = "l", ylab = "Global Active Power", xlab ="")
        
    plot(power$datetime, power$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="")
    lines(power$datetime, power$Sub_metering_2, col = "red")
    lines(power$datetime, power$Sub_metering_3, col = "blue")
    legend("topright", lwd = 1, bty = "n", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    plot(power$datetime, power$Voltage, type = "l", ylab = "Voltage", xlab ="datetime")
    
    plot(power$datetime, power$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab ="datetime")
    
    dev.off()
