setwd("~/data science specialization/exploratory analysis")
Sys.setlocale(category = "LC_TIME", locale = "C")
data <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, format = "%d/%m/%Y")
data2 <- data[which(data$Date == "2007-02-01"), ]
data3 <- data[which(data$Date == "2007-02-02"), ]
data_corr <- rbind(data2, data3)

png("plot2.png")
plot(x= data_corr$DateTime, y = data_corr$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", family = "sans")
dev.off()




