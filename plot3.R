setwd("~/data science specialization/exploratory analysis")
Sys.setlocale(category = "LC_TIME", locale = "C")
data <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, format = "%d/%m/%Y")
data2 <- data[which(data$Date == "2007-02-01"), ]
data3 <- data[which(data$Date == "2007-02-02"), ]
data_corr <- rbind(data2, data3)

png("plot3.png")
plot(x = data_corr$DateTime, y=data_corr$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", family = "sans")
lines(x = data_corr$DateTime, y=data_corr$Sub_metering_2, type="l", col="red")
lines(x = data_corr$DateTime, y=data_corr$Sub_metering_3, type="l", col="blue")
legend(x="topright",cex=0.95, lty=1, lwd=2.5, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
