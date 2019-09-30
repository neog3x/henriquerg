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

dev.cur()
par(mar=c(4,4,4,4))
plot(fev12$DateTime, fev12$Global_active_power, type="l", xlab ="", ylab = "Global Active Power" )
dev.print(png, file = "Plot2.png", width = 480, height = 480)
dev.off()











