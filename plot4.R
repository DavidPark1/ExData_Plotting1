##Download source file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "./Data/household_power_consumption.zip"
txt <- "./Data/household_power_consumption.txt"
if (!file.exists(txt)) {
  download.file(url, file)
  unzip(file, overwrite = T, exdir = "./Data")
}
plot1 <- read.table(txt, header=T, sep=";", na.strings="?")
##Set time variable
data <- plot1[plot1$Date %in% c("1/2/2007","2/2/2007"),]
ST <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(ST, data)
##Plot
SM <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
par(mfrow=c(2,2))
plot(data$ST, data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(data$ST, data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(data$ST, data$Sub_metering_1, type="l", col=SM[1], xlab="", ylab="Energy sub metering")
lines(data$ST, data$Sub_metering_2, col=SM[2])
lines(data$ST, data$Sub_metering_3, col=SM[3])
legend("topright", bty="n", legend=labels, lty=1, col=SM, cex = .75)
plot(data$ST, data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
##Save as PNG
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()