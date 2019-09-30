household_power_consumption <- read_delim("Data Science/household_power_consumption.txt", 
                                          +     ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                                             +         Global_active_power = col_number(), 
                                                                                             +         Global_intensity = col_number(), 
                                                                                             +         Global_reactive_power = col_number(), 
                                                                                             +         Sub_metering_1 = col_number(), Sub_metering_2 = col_number(), 
                                                                                             +         Sub_metering_3 = col_number(), Voltage = col_number()), 
                                          +     locale = locale(grouping_mark = ";"), 
                                          +     trim_ws = TRUE)

data <- household_power_consumption
head(data)
fev12 <- subset(data, Date=="2007-02-01" | Date=="2007-02-02") #only be using data from the dates 2007-02-01 and 2007-02-02
DateTime<-paste(fev12$Date,fev12$Time)
fev12["DateTime"] <-DateTime
fev12$DateTime <- strptime(fev12$DateTime,"%Y-%m-%d %H:%M:%S")


png("Plot3.png")
with(fev12, {
            plot(DateTime, Sub_metering_1, type="l", xlab ="", ylab = "Energy sub metering" )
            lines(DateTime, Sub_metering_2, col="red", type="l")
            lines(DateTime, Sub_metering_3, col="blue",type="l")
            legend("topright", col=c("black","red","blue"), lwd=2,
                  legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
                                     

})


dev.off()
