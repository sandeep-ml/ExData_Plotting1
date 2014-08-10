#Fetching relevant Data from the file
library(data.table)
DT <- fread(input = "household_power_consumption.txt", sep = ";", skip = 66638, nrows = 69518 - 66638 - 1)

#Adding column headers to the Date Table
colnames(DT) <- colnames(fread(input = "household_power_consumption.txt", sep = ";", nrows = 0))

#Storing the Date-Time in a separate variable
DateTimeCluster <- strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S")

#Constructing plot2
par(mfrow = c(1, 1))
plot(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"), DT$Global_active_power, type = "line", xlab="", ylab = "Global Active Power (kilowatts)")

#Copying the plot to plot2.png
dev.copy(png, file="plot2.png")
dev.off()
