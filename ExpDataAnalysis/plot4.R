plot4 <- function() {
        
        # Read .txt file in current directory
        hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
        
        ## Format Date and Time Variables
        hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
        
        ## Subset Data to 2007/02/01-2007/02/02
        hpc <- subset(hpc, hpc$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
        
        ## Format Time Variable
        hpc$Time <- as.POSIXct(hpc$Time, format = "%H:%M:%S")
        hpc$Time <- strftime(hpc$Time, "%H:%M:%S")
        
        ## Create a variable that has Date and Time
        hpc$DT   <- as.POSIXct(paste(hpc$Date,hpc$Time), format = "%Y-%m-%d %H:%M:%S")
        
        ## Format Numeric Variables
        for(i in 3:9) { 
                hpc[,i] <- as.numeric(as.character(hpc[,i])) 
        }
        
        # Plot and Set the 2x2 Plot Area 
        png("plot4.png", width = 480, height = 480)
        par(mfrow = c(2,2))
        
        # Top Left Graph
        plot(hpc$DT,hpc$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="")
        
        # Top Right Graph
        plot(hpc$DT, hpc$Voltage, type="l", ylab="Voltage", xlab="datetime")
        
        # Bottom Left Graph 
        plot(hpc$DT,hpc$Sub_metering_1, type = "l", ylab="Energy Sub Metering", xlab="", ylim = c(0,39), yaxp = c(0,30,3))
        lines(hpc$DT, hpc$Sub_metering_2, col = "red")
        lines(hpc$DT, hpc$Sub_metering_3, col = "blue")
        legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"), bty = "n")
        
        # Bottom Right Graph
        plot(hpc$DT, hpc$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
        
        dev.off()
        
}