#------------------------------------------------------------------------------
# R-script to plot data: Plot-3
#------------------------------------------------------------------------------


## Opening the data.rds file containing data from 2007-02-01 to 2007-02-02
## Note: data.rds created using download_data.R script
data_plot3<-readRDS("data.rds")

## Combining the date and time column 
date_time <- paste(data_plot3$Date, data_plot3$Time)
combined_date_time <- as.POSIXct(date_time)

## Plot no. 3

### opening a png graphing device
png(filename = "plot3.png", width = 480, height = 480, units = "px")
### plotting the graph
with(data_plot3, {
  plot(Sub_metering_1 ~ combined_date_time, type="l", xlab="", ylab="Energy sub metering")
  lines(Sub_metering_2 ~ combined_date_time, col='Red')
  lines(Sub_metering_3 ~ combined_date_time, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

### closing the file device
dev.off()
