plot1 <- function() {
        
        # Read .txt file in current directory
        hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
        
        
        ## Format Date and Time Variables
        hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
        hpc$Time <- as.POSIXct(hpc$Time, format = "%H:%M:%S")
        hpc$Time <- strftime(hpc$Time, "%H:%M:%S")
        
        ## Format Numeric Variables
        for(i in 3:9) { 
                hpc[,i] <- as.numeric(as.character(hpc[,i])) 
        }
        
        # Subset Data to 2007/02/01-2007/02/02
        hpc <- subset(hpc, hpc$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
        
        # Plot Histogram
        png("plot1.png", width = 480, height = 480)
        hist(hpc$Global_active_power, xlab="Global Active Power (kilowatts)", col=c("red"), main="Global Active Power")
        dev.off()
        
}