##Generate plot2

        ## Importing data from txt file
        data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
        data$DateTime <- paste(data$Date, data$Time)      #concatenate date & time
        data$DateTime <- as.Date(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
        
        # Subsetting data to specific date/time
        library(dplyr)
        datasub <- filter(data, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
        
        # Plotting Global Active Power Histogram
        datasub$DateTime <- paste(datasub$Date, datasub$Time)
        datasub$DateTime <-  strptime(datasub$DateTime ,format="%d/%m/%Y %H:%M:%S")
        png(file="plot2.png",width=480,height=480)
        plot(datasub$DateTime,datasub$Global_active_power,"l",xlab="",ylab="Global Active Power (kilowatts)")
        dev.off()