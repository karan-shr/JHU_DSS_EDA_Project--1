#------------------------------------------------------------------------------
# R-script to plot data: Plot-1
#------------------------------------------------------------------------------


## Opening the data.rds file containing data from 2007-02-01 to 2007-02-02
## Note: data.rds created using download_data.R script
data_plot1<-readRDS("data.rds")

## Plot no. 1
hist(data_plot1$Global_active_power, main="Global Active Power",
     col="Red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
