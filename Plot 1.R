data<-read.csv("household_power_consumption.txt", sep=";",na.strings="?", dec=".")
library(dplyr)
data<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
data<-mutate(data,Date_Time=paste(data$Date,data$Time))
data<-select(data,Date_Time,3:9)
data$Date_Time<-strptime(data$Date_Time,format="%d/%m/%Y %H:%M:%S")
#data
#str(data)
png("plot1.png",480,480,bg="transparent")
hist(data[[2]],col="Red", main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()
