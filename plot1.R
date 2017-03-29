
# plot1.R


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
#raw_power_data$DateTime <- strptime(paste(raw_power_data$Date, raw_power_data$Time), format = "%d/%m/%Y %H:%M:%S")

# Open png device
png(filename = "plot1.png")

# plot histogram
hist(raw_power_data$Global_active_power, col ="Red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#close png device
dev.off()