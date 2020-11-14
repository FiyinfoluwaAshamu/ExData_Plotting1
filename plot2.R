
#load the data
data <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subset data for the mentioned date
sub_data <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Transform Date and Time variables from characters to objects of type Date and POSIXlt alike:
sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")
sub_data$Time <- strptime(sub_data$Time, format="%H:%M:%S")
sub_data[1:1440,"Time"] <- format(sub_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_data[1441:2880,"Time"] <- format(sub_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#call the plot function
plot(sub_data$Time,as.numeric(as.character(sub_data$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")

title(main="Global Active Power Vs Time")