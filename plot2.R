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
plot(data$ST, data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
##Save as PNG
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()