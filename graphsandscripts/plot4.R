#Download dataset and unzip before running script

powerconsumption<-read.csv("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE,na.strings="?")
powerconsumption<-subset(powerconsumption, powerconsumption$Date %in% c("1/2/2007","2/2/2007"))
powerconsumption$dateTime<- strptime(paste(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y %H:%M:%S")

png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))

#plot1
plot(powerconsumption$dateTime, powerconsumption$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")

#plot2
plot(powerconsumption$dateTime, powerconsumption$Voltage,type="l",
     ylab="Voltage",xlab="datetime",lwd=1)

#plot3
plot(powerconsumption$dateTime, powerconsumption$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(powerconsumption$dateTime, powerconsumption$Sub_metering_2, col="red")
lines(powerconsumption$dateTime, powerconsumption$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot4
plot(powerconsumption$dateTime, powerconsumption$Global_reactive_power,type="l",
     ylab="Global_reactive_power",xlab="datetime",lwd=1)

dev.off()