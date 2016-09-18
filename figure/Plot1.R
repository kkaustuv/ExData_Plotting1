source_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
req_data <- subset(source_data,Date %in% c("1/2/2007","2/2/2007"))

num_glob_actv_pwr <- as.numeric(req_data$Global_active_power)

#Ploting graph in png file
png("plot1.png", width=480, height=480)
hist(num_glob_actv_pwr,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()