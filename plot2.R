columns <- c("character", "character", rep("numeric", 7))
Data <- read.table("household_power_consumption.txt", header = T, sep = ";",
                   na.strings = "?", nrows = 2075259, colClasses = columns)
DataSub <- Data[Data$Date == "1/2/2007" | Data$Date == "2/2/2007",]
str(DataSub)
DateTime <- paste(DataSub$Date, DataSub$Time)
DataSub$DateTime <- DateTime
DataSub$DateTime <- strptime(DataSub$DateTime, "%d/%m/%Y %H:%M:%S")
DataSub2 <- DataSub[,3:10]

png(filename = "plot2.png")
par(mar = c(4, 4, 2, 8))
plot(DataSub2$DateTime, DataSub2$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()