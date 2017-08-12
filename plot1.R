#First download and unzip the file from the mentioned location
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(path, "exdata%2Fdata%2Fhousehold_power_consumption"))


# Now we are reading data into R
files <- file('household_power_consumption.txt')
dataPower <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', 
                        col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
head(dataPower)

#Now we are plotting our first graph
png(filename = 'plot1.png', width = 480, height = 480, units='px')
with(dataPower, hist(Global_active_power, xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power', col = 'red'))
dev.off()