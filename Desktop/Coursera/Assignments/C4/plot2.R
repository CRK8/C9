# R code for "Exploratory Data Analysis" Assignment 1 plot 1
# Read table into R and put data needed into "hpc"
household_power_consumption <- read.table("./household_power_consumption.txt", header=TRUE,sep=";",na.strings = "?")
hpc1<-subset(household_power_consumption,Date==c("1/2/2007"))
hpc2<-subset(household_power_consumption,Date==c("2/2/2007"))
hpc<-NULL
hpc<-rbind(hpc1,hpc2)
hpc[,2]<-data.frame(strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S"))
hpc[,1]<-as.Date(hpc$Date,"%d/%m/%Y")

# Plot 2
png(filename="./plot2.png",width = 480, height = 480)
plot(hpc$Time,hpc$Global_active_power,type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
