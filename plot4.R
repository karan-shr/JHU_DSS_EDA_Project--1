#------------------------------------------------------------------------------
# R-script to plot data: Plot-4
#------------------------------------------------------------------------------


## Opening the data.rds file containing data from 2007-02-01 to 2007-02-02
## Note: data.rds created using download_data.R script
data_plot4<-readRDS("data.rds")

## Combining the date and time column 
date_time <- paste(data_plot4$Date, data_plot4$Time)
combined_date_time <- as.POSIXct(date_time)

## Plot no. 4

### opening a png graphing device
png(filename = "plot4.png", width = 480, height = 480, units = "px")
### setting the parameters for generating a 2x2 grid of plots
par(mfrow=c(2,2))
### plotting the graph
with(data_plot4, {
  ##subplot-1 plot(1,1)
  plot(Global_active_power ~ combined_date_time, type="l", xlab="", ylab="Global Active Power")
  ##subplot-1 plot(1,2)
  plot(Voltage ~ combined_date_time, type="l", xlab="datetime", ylab="Voltage")
  ##subplot-3 plot(2,1)
  plot(Sub_metering_1 ~ combined_date_time, type="l", xlab="", ylab="Energy sub metering")
  lines(Sub_metering_2 ~ combined_date_time, col='Red')
  lines(Sub_metering_3 ~ combined_date_time, col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
        )
  ##subplot-4 plot(2,2)
  plot(Global_reactive_power ~ combined_date_time, type="l", xlab="datetime", ylab="Global_reactive_power")
})

### closing the file device
dev.off()