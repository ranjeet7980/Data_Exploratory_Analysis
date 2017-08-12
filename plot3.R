#First download and unzip the file from the mentioned location
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(path, "exdata%2Fdata%2Fhousehold_power_consumption"))


# Now we are reading data into R
files <- file('household_power_consumption.txt')
dataPower <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', 
                        col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
head(dataPower)

#Now we are plotting our third graph
png(filename = 'plot3.png', width = 480, height = 480, units='px')
plot(SettingTime,dataPower1$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(SettingTime,dataPower1$Sub_metering_2,col="red")
lines(SettingTime,dataPower1$Sub_metering_3,col="blue")
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 2)
dev.off()
