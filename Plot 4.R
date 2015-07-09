data<-read.csv("household_power_consumption.txt", sep=";",na.strings="?", dec=".")
library(dplyr)
data<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
data<-mutate(data,Date_Time=paste(data$Date,data$Time))
data<-select(data,Date_Time,3:9)
data$Date_Time<-strptime(data$Date_Time,format="%d/%m/%Y %H:%M:%S")
#data
#str(data)
png("plot4.png",480,480,bg="transparent")

par(mfrow=c(2,2))

with(data,{
  plot(Date_Time,Global_active_power,ylab="Global active power",xlab="",type="l")
  plot(Date_Time,Voltage,ylab="Voltage",xlab="datetime",type="l")
  plot(Date_Time,Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
  points(Date_Time,Sub_metering_1,type="l", col="Black")
  points(Date_Time,Sub_metering_2,type="l", col="Red")
  points(Date_Time,Sub_metering_3,type="l", col="Blue")
  legend("topright",lty=1,box.lty=0,col=c("Black","Red","Blue"),legend=names(data)[6:8])
  plot(Date_Time,Global_reactive_power,xlab="datetime",type="l")
})

dev.off()
