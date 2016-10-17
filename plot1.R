#This code will create a plot called plot1.png.
# The graph generated will be a histogram of the
# Global Active Power in Kilowatts for the dates
# Feb 1, 2007 to Feb 2, 2007

#read in data 
D<- read.table("./household_power_consumption/household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)

library(lubridate)
#convert Date field to Date format
D$Date<-dmy(D$Date)
#subset to data by date 
EPC <-subset(D, Date>=dmy("1/2/2007") & Date<=dmy("2/2/2007")) 

#open PNG driver and plot histogram for plot1 turn off graphics driver
png("plot1.png")
hist(EPC$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
