#Fetching relevant Data from the file
library(data.table)
DT <- fread(input = "household_power_consumption.txt", sep = ";", skip = 66638, nrows = 69518 - 66638 - 1)

#Adding column headers to the Date Table
colnames(DT) <- colnames(fread(input = "household_power_consumption.txt", sep = ";", nrows = 0))

#Storing the Date-Time in a separate variable
DateTimeCluster <- strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S")

#Constructing plot1
par(mfrow = c(1, 1))
hist(DT$Global_active_power, main = "Global Activity Power", col = "red", xlab="Global Active Power (kilowatts)")

#Copying the plot to plot1.png
dev.copy(png, file="plot1.png")
dev.off()
