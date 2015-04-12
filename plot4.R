#This code creates the plot4.png file based on the online example

#Read in the data from the working directory and subset it
household_power_consumption <- read.table(paste(getwd(),"household_power_consumption.txt",sep="/"), sep=";", quote="\"",header=TRUE,stringsAsFactors=FALSE)
feb1and2data<-household_power_consumption[66637:69516,]

#Install lubridate which will help manipulate the date and time columns
install.packages(lubridate)
library(lubridate)

#Paste the date and time columns, as they are characters, together
#to create one set of data in chronological order (day and then time)
#to be graphed in relation to how data changes over time
datetime<-paste(feb1and2data$Date,feb1and2data$Time, sep=" ")
datetime
datetime<-parse_date_time(datetime, "%d%m%Y %H%M%S")

#Create a png file, plot4.png, in the required format in the working 
#directory and structure the file so that each plot takes up 1/4 of the space
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

#Plot all four graphs, two as previously coded, and the other two as shown
#in the online examples

#first graph
plot(datetime,feb1and2data$Global_active_power,type="l",ylab="Global Active Power",xlab="")

#second graph
plot(datetime,feb1and2data$Voltage,type="l",ylab="Voltage")

#third graph
plot(datetime,feb1and2data$Sub_metering_1, type="l",ylim=range(0:max(feb1and2data$Sub_metering_1)),xlab="",ylab="Energy sub metering")

par(new = TRUE)
plot(datetime, feb1and2data$Sub_metering_2,type="l",axes=FALSE,ylim=range(0:max(feb1and2data$Sub_metering_1)) ,xlab = "", ylab = "",col="red")
par(new = TRUE)
plot(datetime, feb1and2data$Sub_metering_3,type="l",axes=FALSE,ylim=range(0:max(feb1and2data$Sub_metering_1)) ,xlab = "", ylab = "",col="blue")
legend("topright",lty=1,lwd=1,seg.len=2,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#fourth graph
plot(datetime,feb1and2data$Global_reactive_power,type="l",ylab="Global_reactive_power")

#Close the png file
dev.off()