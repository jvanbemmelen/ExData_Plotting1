# generic loading and cleaning tasks
hpc <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, header=TRUE)
hpcd <- subset(hpc,Date=="1/2/2007" | Date=="2/2/2007")
hpcd$DateTime <- strptime(paste(hpcd$Date,hpcd$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
hpcd$Date <- as.Date(hpcd$Date)
hpcd$Global_active_power <- as.numeric(hpcd$Global_active_power)
hpcd$Global_reactive_power <- as.numeric(hpcd$Global_reactive_power)
hpcd$Voltage <- as.numeric(hpcd$Voltage)
hpcd$Global_intensity <- as.numeric(hpcd$Global_intensity)
hpcd$Sub_metering_1 <- as.numeric(hpcd$Sub_metering_1)
hpcd$Sub_metering_2 <- as.numeric(hpcd$Sub_metering_2)

# build the graph
# plot 4
par(mfrow=c(2,2))
with(hpcd, plot(DateTime, Global_active_power, ylab="Global Active Power", xlab="", type="l"))
with(hpcd, plot(DateTime, Voltage, ylab="Voltage", xlab="datetime", type="l"))
plot(hpcd$DateTime,hpcd$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(hpcd$DateTime,hpcd$Sub_metering_3,col="blue",type="l")
lines(hpcd$DateTime,hpcd$Sub_metering_2,col="red",type="l")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd="2",bty="n")
with(hpcd, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))
dev.copy(png, file="plot4.png")
dev.off()
