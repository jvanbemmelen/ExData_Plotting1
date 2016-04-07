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
# plot 1
hist(hpcd$Global_active_power,col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()
