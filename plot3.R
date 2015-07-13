######################################################
# Exploratory data analysis class project 1
# chret 3
# July 2015
######################################################

# read text file

myfile <- read.table("c:/coursera/Exploratory data analysis/household_power_consumption.txt", header=T, sep=";", na.string="?")

# format date/time

myfile$Date <- as.Date(myfile$Date, format = "%d/%m/%Y")

# read date with dates range 2007-02-01 and 2007-02-02

plotfile1 <- myfile[myfile$Date >= "2007-02-01" & myfile$Date <= "2007-02-02",]

# convert factor data to numberic

plotfile1[,3:9] <- lapply(plotfile1[,3:9], function(x){as.numeric(as.character(x))})  

#append date and time
date_time <- paste(plotfile1$Date,plotfile1$Time, sep=" ")
plotfile1$DateTime <-  as.POSIXct(date_time)

# plot3_data <- plotfile1[,7:10]

png(filename="c:/coursera/Exploratory data analysis/plot3.png")

plot(plotfile1$DateTime, plotfile1$Sub_metering_1,
 type = "l", 
 col= "black",
 ylab="Energy Sub metering",
 xlab="" )


# graph sub metering 2
lines(plotfile1$DateTime, plotfile1$Sub_metering_2,
 type = "l", 
 col= "red")

# graph sub metering 3
lines(plotfile1$DateTime, plotfile1$Sub_metering_3,
 type = "l", 
 col= "blue")

# add legend
legend("topright", names(plotfile1[,7:9]), lty="solid", col=c('black','red','blue'))

dev.off()




