#This code will read in and generate a line plot
# of the 3 sub metering readings vs. the time of 
# day from Feb 1, 2007 to Feb 2, 2007 on the same plot


#read in data 
D<- read.table("./household_power_consumption/household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
   
library(lubridate)

#convert Date field to Date format
D$Date<-dmy(D$Date)

#convert time field to time fromat
D$Time <- hms(D$Time)

#subset to data by date 
EPC <-subset(D, Date>=dmy("1/2/2007") & Date<=dmy("2/2/2007")) 

#add time and date into new date field
EPC$newdate <- EPC$Date + EPC$Time

#open PNG driver and plot line graph for plot3 turn off graphics driver
png("plot3.png")
plot(EPC$newdate, EPC$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(EPC$newdate,EPC$Sub_metering_2, col= "red", type = "l") 
lines(EPC$newdate,EPC$Sub_metering_3, col= "blue", type = "l") 
legend("topright",lty=c(1,1,1),col=c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()

