#Download dataset and unzip before running script

powerconsumption<-read.csv("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE,na.strings="?")
powerconsumption<-subset(powerconsumption, powerconsumption$Date %in% c("1/2/2007","2/2/2007"))
powerconsumption$dateTime<- strptime(paste(powerconsumption$Date,powerconsumption$Time),"%d/%m/%Y %H:%M:%S")

png("plot2.png",width=480,height=480)
plot(powerconsumption$dateTime, powerconsumption$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
