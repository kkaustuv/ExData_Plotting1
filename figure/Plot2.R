source_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
req_data <- subset(source_data,Date %in% c("1/2/2007","2/2/2007"))

num_glob_actv_pwr <- as.numeric(req_data$Global_active_power)
date_time <- strptime(paste(req_data$Date, req_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Ploting graph in png file
png("plot2.png", width=480, height=480)
plot(date_time,num_glob_actv_pwr,type="l",ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()