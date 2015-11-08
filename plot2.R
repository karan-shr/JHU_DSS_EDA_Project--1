#------------------------------------------------------------------------------
# R-script to plot data: Plot-2
#------------------------------------------------------------------------------


## Opening the data.rds file containing data from 2007-02-01 to 2007-02-02
## Note: data.rds created using download_data.R script
data_plot2<-readRDS("data.rds")


## Combining the date and time column 
date_time <- paste(data_plot2$Date, data_plot2$Time)
combined_date_time <- as.POSIXct(date_time)

## Plot no. 2
plot(data_plot2$Global_active_power ~ combined_date_time,
     type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
