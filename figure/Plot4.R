source_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
req_data <- subset(source_data,Date %in% c("1/2/2007","2/2/2007"))

num_glob_actv_pwr <- as.numeric(req_data$Global_active_power)
num_voltage<-as.numeric(req_data$Voltage)
num_global_reactive_pwr<-as.numeric(req_data$Global_reactive_power)
nm_Sub_metering_1 <-as.numeric(req_data$Sub_metering_1)
nm_Sub_metering_2 <-as.numeric(req_data$Sub_metering_2)
nm_Sub_metering_3 <-as.numeric(req_data$Sub_metering_3)
date_time <- strptime(paste(req_data$Date, req_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Ploting graph in png file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time,num_glob_actv_pwr,type="l",ylab = "Global Active Power (kilowatts)",xlab="")

plot(date_time,num_voltage,type="l",ylab = "Voltage",xlab="datetime")

plot(date_time,nm_Sub_metering_1,type="l",ylab = "Energy sub metering",xlab="")
lines(date_time,nm_Sub_metering_2,type="l",col="red")
lines(date_time,nm_Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2)

plot(date_time,num_global_reactive_pwr,type="l",ylab = "Global_Reactive_Power",xlab="datetime")
dev.off()