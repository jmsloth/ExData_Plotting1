
# plot3.R


###import & subset data

#testing revealed that the data we want are observations 66637-68076
#by skipping the header the first data starts on 66638, so we skip exactly 66637 to start at the first obs we want
#col.names imports just the first row for the header rows

raw_power_data <- read.csv2("household_power_consumption.txt"
                            , stringsAsFactors = FALSE
                            , na.strings ="?"
                            , dec = '.'
                            , header = FALSE
                            , skip = 66637
                            , nrows = 2880
                            , col.names = colnames(read.csv2("household_power_consumption.txt", nrow = 1, header = TRUE))
                            , colClasses = c("character", "character", rep("numeric", 6)))

###clean data if necessary

#convert $Date and $Time to a single date/time field
raw_power_data$DateTime <- strptime(paste(raw_power_data$Date, raw_power_data$Time), format = "%d/%m/%Y %H:%M:%S")

# Open png device
png(filename = "plot3.png")

# write line plot to png
plot(raw_power_data$DateTime, raw_power_data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="", col="black")
lines(raw_power_data$DateTime, raw_power_data$Sub_metering_2, type="l", col="red")
lines(raw_power_data$DateTime, raw_power_data$Sub_metering_3, type="l", col="blue")

#legend
legend("topright"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty = 1
       , col = c("black", "red", "blue")
)


#close png device

dev.off()


