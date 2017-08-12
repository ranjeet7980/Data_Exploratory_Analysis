#First download and unzip the file from the mentioned location
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(path, "exdata%2Fdata%2Fhousehold_power_consumption"))


# Now we are reading data into R
files <- file('household_power_consumption.txt')
dataPower <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', 
                        col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
head(dataPower)

#Now we are plotting our fourth graph
SettingTime <-strptime(paste(dataPower$Date, dataPower$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
dataPower1 <- cbind(SettingTime, dataPower)
png(filename = 'plot4.png', width = 480, height = 480, units='px')
par(mfrow = c(2, 2))
plot(SettingTime,dataPower1$Global_active_power, xlab = '', ylab = 'Global Active Power', type = 'l')
plot(SettingTime,dataPower1$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(SettingTime,dataPower1$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(SettingTime,dataPower1$Sub_metering_2, col = 'red')
lines(SettingTime,dataPower1$Sub_metering_3, col = 'blue')
legend('topright',col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 2)
plot(SettingTime, dataPower1$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()
