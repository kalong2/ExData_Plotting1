#read in data
data<-read.delim("household_power_consumption.txt", sep=";", header=TRUE)
#change column type to Date, subset data, create Date_Time column
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 
data$Global_active_power <- as.numeric(data$Global_active_power)
data_assignment<-subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data_assignment$Date_Time<-as.POSIXct(paste(data_assignment$Date, data_assignment$Time), format="%Y-%m-%d %H:%M:%S")
#create plot, write to file
png(file="plot1.png", width = 480, height = 480)
hist(data_assignment$Global_active_power, col="Red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
