
# Construct the plot and save it to a PNG file.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding 
#     plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include 
#     code for reading the data so that the plot can be fully reproduced. You must also 
#     include the code that creates the PNG file. Only include the code for a single plot 
#     (i.e. plot1.R should only include code for producing plot1.png)

library(ggplot2)

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# 3) Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make 
# a plot answer this question.

bcm<-subset(NEI,fips=="24510")

png(filename="./plot3.png",width = 480, height = 480)
title<-"Baltimore City, MD PM2.5 Emissions by Type"
p<-ggplot(bcm,aes(factor(year),Emissions),facets=.~type)
p+geom_boxplot(aes(group=year))+scale_y_log10()+ggtitle(title)+geom_smooth(method="lm")+facet_wrap(~type,ncol=2)
dev.off()
