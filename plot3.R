##Generate plot3

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
        png(file="plot3.png",width=480,height=480)
        with(datasub,plot(DateTime,Sub_metering_1,"l",xlab="",ylab="Energy sub metering"))
        with(datasub,points(DateTime,Sub_metering_2,"l",col="Red"))
        with(datasub,points(DateTime,Sub_metering_3,"l",col="Blue"))
        legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"))
        dev.off()