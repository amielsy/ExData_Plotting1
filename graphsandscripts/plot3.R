#Download dataset and unzip before running script

powerconsumption<-read.csv("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE,na.strings="?")
powerconsumption<-subset(powerconsumption, powerconsumption$Date %in% c("1/2/2007","2/2/2007"))
powerconsumption$dateTime<- strptime(paste(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y %H:%M:%S")

png("plot3.png",width=480,height=480)
plot(powerconsumption$dateTime, powerconsumption$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(powerconsumption$dateTime, powerconsumption$Sub_metering_2, col="red")
lines(powerconsumption$dateTime, powerconsumption$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()