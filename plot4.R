#load the data

names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subset data for the mentioned date
sub_data <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

voltage <- as.numeric(sub_data$Voltage)
globalreactivepower <- as.numeric(sub_data$Global_reactive_power)

# Transform Date and Time variables from characters to objects of type Date and POSIXlt:
sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")
sub_data$Time <- strptime(sub_data$Time, format="%H:%M:%S")
sub_data[1:1440,"Time"] <- format(sub_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_data[1441:2880,"Time"] <- format(sub_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


par(mfrow = c(2, 2)) 

#calling 4 plot functions

plot(sub_data$Time,as.numeric(as.character(sub_data$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(sub_data$Time, voltage, type="l", xlab="datetime", ylab="Voltage")


plot(sub_data$Time,sub_data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(sub_data,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(sub_data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(sub_data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1,  lwd=2.5, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)

plot(sub_data$Time, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
