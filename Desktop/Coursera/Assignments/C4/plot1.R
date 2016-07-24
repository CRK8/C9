
# Construct the plot and save it to a PNG file.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding 
#     plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include 
#     code for reading the data so that the plot can be fully reproduced. You must also 
#     include the code that creates the PNG file. Only include the code for a single plot 
#     (i.e. plot1.R should only include code for producing plot1.png)

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# 1) Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the 
# base plotting system, make a plot showing the total PM2.5 emission from all sources for each of 
# the years 1999, 2002, 2005, and 2008.

cnt0<-subset(NEI,year==1999)
cnt1<-subset(NEI,year==2002)
cnt2<-subset(NEI,year==2005)
cnt3<-subset(NEI,year==2008)

png(filename="./plot1.png",width = 480, height = 480)
names<-c("1999","2002","2005","2008")
ylab<-"Log10 (PM2.5 Emissions)"
boxplot(log10(cnt0$Emissions),log10(cnt1$Emissions),log10(cnt2$Emissions),log10(cnt3$Emissions),names=names,ylab=ylab,ylim=c(-15,6))
title("Total US PM2.5 Emissions")
dev.off()
