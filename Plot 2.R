data<-read.csv("household_power_consumption.txt", sep=";",na.strings="?", dec=".")
library(dplyr)
data<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
data<-mutate(data,Date_Time=paste(data$Date,data$Time))
data<-select(data,Date_Time,3:9)
data$Date_Time<-strptime(data$Date_Time,format="%d/%m/%Y %H:%M:%S")
#data
#str(data)
png("plot2.png",480,480,bg="transparent")
plot(data[[1]],data[[2]],ylab="Global Active Power (kilowatts)",xlab="",type="l")

dev.off()