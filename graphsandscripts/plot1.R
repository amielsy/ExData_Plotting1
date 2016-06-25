#Download dataset and unzip before running script

powerconsumption<-read.csv("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE,na.strings="?")
powerconsumption$Date<-dmy(powerconsumption$Date)
powerconsumption$Time<-hms(powerconsumption$Time)
powerconsumption<-subset(powerconsumption, powerconsumption$Date %in% as.Date(c("2007-02-01","2007-02-02")))

png("plot1.png",width=480,height=480)
hist(powerconsumption$Global_active_power, xlab= "Global Active Power(kilowatts)", 
     ylab="Frequency",col="red", main="Global Active Power")
dev.off()
