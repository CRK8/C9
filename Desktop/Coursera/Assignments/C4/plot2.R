
# Construct the plot and save it to a PNG file.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding 
#     plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include 
#     code for reading the data so that the plot can be fully reproduced. You must also 
#     include the code that creates the PNG file. Only include the code for a single plot 
#     (i.e. plot1.R should only include code for producing plot1.png)

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# 2) Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

bcm0<-subset(NEI,fips=="24510" & year==1999)
bcm1<-subset(NEI,fips=="24510" & year==2002)
bcm2<-subset(NEI,fips=="24510" & year==2005)
bcm3<-subset(NEI,fips=="24510" & year==2008)

png(filename="./plot2.png",width = 480, height = 480)
names<-c("1999","2002","2005","2008")
ylab<-"Log10 (PM2.5 Emissions)"
boxplot(log10(bcm0$Emissions),log10(bcm1$Emissions),log10(bcm2$Emissions),log10(bcm3$Emissions),names=names,ylab=ylab)
title("Baltimore City, MD PM2.5 Emissions")
dev.off()