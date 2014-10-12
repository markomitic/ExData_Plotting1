## Getting ready the data
full_dataset <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F)
full_dataset$Date <- as.Date(full_dataset$Date, format="%d/%m/%Y")
dataset <- subset(full_dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting the Date and Time variables to Date/Time classes 
datetime <- paste(as.Date(dataset$Date), dataset$Time)
dataset$Datetime <- as.POSIXct(datetime)

## Plotting...
plot(dataset$Global_active_power~dataset$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saving to a PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
