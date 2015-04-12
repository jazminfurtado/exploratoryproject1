#This code creates the plot1.png file based on the online example

#Read the table from the txt file found in the working directory
household_power_consumption <- read.table(paste(getwd(),"household_power_consumption.txt",sep="/"), sep=";", quote="\"",header=TRUE,stringsAsFactors=FALSE)

#Subset the data based on the two days in February that is needed
feb1and2data<-household_power_consumption[66637:69516,]

#Ensure the data needed for the graph is in a numeric form
feb1and2data$Global_active_power<-as.numeric(as.vector(feb1and2data$Global_active_power))

#Create a png file, plot1.png, in the required format in the working 
  #directory
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

#Structure the plot so that the plot takes up the whole space
  #and not 1/4 of it
par(mfrow=c(1,1))

#Finally, plot the plot as specified with labeling and colors
hist(feb1and2data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#close the png file 
dev.off()
