
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
    power <- cbind(power, "DateTime" = strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S"))

##  Create the plot & save it to a file
    
    hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

    dev.copy(png, file = "plot1.png")
    dev.off()
