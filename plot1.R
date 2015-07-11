##Generate plot1

        ## Importing data from txt file
        data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
        data$DateTime <- paste(data$Date, data$Time)      #concatenate date & time
        data$DateTime <- as.Date(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

        # Subsetting data to specific date/time
        library(dplyr)
        datasub <- filter(data, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
        
        # Plotting Global Active Power Histogram
        png(file="plot1.png",width=480,height=480)
        hist(datasub$Global_active_power,col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
        dev.off()