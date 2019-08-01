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

dev.cur()
par(mar=c(4,4,4,4))
hist(fev12$Global_active_power, col="red", xlab="Global active power (kilowatts)", main = "Global Active Power")
dev.print(png, file = "myplot.png", width = 480, height = 480)
dev.off()













