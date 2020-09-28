#read in data
data<-read.delim("household_power_consumption.txt", sep=";", header=TRUE)
#change column type to Date, subset data, create Date_Time column
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 
data$Global_active_power <- as.numeric(data$Global_active_power)
data_assignment<-subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data_assignment$Date_Time<-as.POSIXct(paste(data_assignment$Date, data_assignment$Time), format="%Y-%m-%d %H:%M:%S")
#create plot, write to file
png(file="plot3.png",width = 480, height = 480)
plot(data_assignment$Date_Time, data_assignment$Sub_metering_1, 
     type="l", xlab="", ylab="Energy sub metering")
lines(data_assignment$Date_Time, data_assignment$Sub_metering_2, col="red")
lines(data_assignment$Date_Time, data_assignment$Sub_metering_3, col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd=c(1,1,1), col=c("black","red","blue"),ncol=1)
dev.off()
