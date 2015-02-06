plot2 <- function() {
        
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
        
        # Plot 
        png("plot2.png", width = 480, height = 480)
        plot(hpc$DT,hpc$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="")
        dev.off()
        
}