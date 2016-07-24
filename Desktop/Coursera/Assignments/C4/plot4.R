
# Construct the plot and save it to a PNG file.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding 
#     plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include 
#     code for reading the data so that the plot can be fully reproduced. You must also 
#     include the code that creates the PNG file. Only include the code for a single plot 
#     (i.e. plot1.R should only include code for producing plot1.png)

library(ggplot2)

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# 4) Across the United States, how have emissions from coal combustion-related sources changed from 
# 1999-2008?

comb<-SCC[grep("[Cc]oal",SCC$EI.Sector),]
coal<-subset(NEI,SCC %in% comb[,1])

png(filename="./plot4.png",width = 480, height = 480)
title<-"US PM2.5 Emissions from Coal Combustion-related Sources"
p<-ggplot(coal,aes(factor(year),Emissions))
p+scale_y_log10()+geom_boxplot(aes(group=year))+ggtitle(title)
dev.off()
