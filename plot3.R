#Fetching relevant Data from the file
library(data.table)
DT <- fread(input = "household_power_consumption.txt", sep = ";", skip = 66638, nrows = 69518 - 66638 - 1)

#Adding column headers to the Date Table
colnames(DT) <- colnames(fread(input = "household_power_consumption.txt", sep = ";", nrows = 0))

#Storing the Date-Time in a separate variable
DateTimeCluster <- strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S")

#Constructing plot3
par(mfrow = c(1, 1))
x <- rep(DateTimeCluster, 3)
y <- c(DT$Sub_metering_1, DT$Sub_metering_2, DT$Sub_metering_3)
plot(x, y, type="n", xlab="", ylab = "Energy sub metering")

colHeaders <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
colors <- c("darkgray", "red", "blue")

g <- gl(3, length(DateTimeCluster), labels = colHeaders)

lines(x[g == colHeaders[1]], y[g == colHeaders[1]], col = colors[1])
lines(x[g == colHeaders[2]], y[g == colHeaders[2]], col = colors[2])
lines(x[g == colHeaders[3]], y[g == colHeaders[3]], col = colors[3])

legend("topright", pch = "-", col= colors, legend= colHeaders, cex= 1.2, pt.cex = 0.8)

#Copying the plot to plot3.png
dev.copy(png, file="plot3.png")
dev.off()
