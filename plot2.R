#This code will read in and generate a line plot
# of Global Acitive power (in kilowatts) vs. the time of 
# day from Feb 1, 2007 to Feb 2, 2007


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

#open PNG driver and plot line graph for plot2 turn off graphics driver
png("plot2.png")
with(EPC, plot(newdate, Global_active_power, type = "l", ylab ="Global Active Power (kilowatts)", xlab = ""))
dev.off()
