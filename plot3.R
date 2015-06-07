columns <- c("character", "character", rep("numeric", 7))
Data <- read.table("household_power_consumption.txt", header = T, sep = ";",
                   na.strings = "?", nrows = 2075259, colClasses = columns)
DataSub <- Data[Data$Date == "1/2/2007" | Data$Date == "2/2/2007",]
str(DataSub)
DateTime <- paste(DataSub$Date, DataSub$Time)
DataSub$DateTime <- DateTime
DataSub$DateTime <- strptime(DataSub$DateTime, "%d/%m/%Y %H:%M:%S")
DataSub2 <- DataSub[,3:10]

png(filename = "plot3.png")
par(mar = c(4, 4, 2, 4))
plot(DataSub2$DateTime, DataSub2$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(DataSub2$DateTime, DataSub2$Sub_metering_2, type = "l", col = "red")
lines(DataSub2$DateTime, DataSub2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c(colnames(DataSub2[5:7])), 
       lty = 1, col = c("black","red","blue"))

dev.off()
