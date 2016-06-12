# R code for "Exploratory Data Analysis" Assignment 1 plot 1
# Read table into R and put data needed into "hpc"
household_power_consumption <- read.table("./household_power_consumption.txt", header=TRUE,sep=";",na.strings = "?")
hpc1<-subset(household_power_consumption,Date==c("1/2/2007"))
hpc2<-subset(household_power_consumption,Date==c("2/2/2007"))
hpc<-NULL
hpc<-rbind(hpc1,hpc2)
hpc[,2]<-data.frame(strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S"))
hpc[,1]<-as.Date(hpc$Date,"%d/%m/%Y")

# Plot 4
png(filename="./plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

# Sub-plot 1
plot(hpc$Time,hpc$Global_active_power,type="l",xlab = "", ylab = "Global Active Power")

# Sub-plot 2
plot(hpc$Time,hpc$Voltage,type="l",xlab="datetime",ylab = "Voltage")

# Sub-plot 3
plot(hpc$Time,hpc$Sub_metering_1,type="l",xlab = "", ylab = "Energy sub metering")
points(hpc$Time,hpc$Sub_metering_2,type="l",col="red")
points(hpc$Time,hpc$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,bty="n",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Sub-plot 4
plot(hpc$Time,hpc$Global_reactive_power,type="l",xlab="datetime",ylab = "Global_reactive_power")
dev.off()
