#This code creates the plot2.png file based on the online example

#Read in the data from the working directory
household_power_consumption <- read.table(paste(getwd(),"household_power_consumption.txt",sep="/"), sep=";", quote="\"",header=TRUE,stringsAsFactors=FALSE)

#Subset the data based on what is needed
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

#Create a png file, plot2.png, in the required format in the working 
#directory
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
par(mfrow=c(1,1))

#Finally, plot the plot as specified with labeling 
plot(datetime,feb1and2data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

#Close the png file
dev.off()

