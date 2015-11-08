#------------------------------------------------------------------------------
# R-script to download, filter data and create data.rds file for plotting
#
# Note: "plot1:4.R" deal with plotting, this script just cleans the inital data
#       and saves it in "data.rds" for later use in the plotting scripts
#------------------------------------------------------------------------------



## Dowloading and unzipping the file

### using a temporary filename
temp_file_name <- tempfile()
### downloading zipped file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp_file_name, method = "curl")
### unzipping and saving data as dwnld_data data.frame
dwnld_data <- read.table(unz(temp_file_name, "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?" )
### closing connection and unlinking temp_file_name
unlink(temp_file_name)


## Calculating the size of dwnld_data data frame
size_in_mem <- format(object.size(dwnld_data), units = "Mb")
print(size_in_mem) # conclusion: size no problem for this computer



## Cleaning and saving desired data in a different data frame

### converting the date from factor to date format
dwnld_data$Date <- as.Date(dwnld_data$Date, "%d/%m/%Y")
### filtering data for the desired dates
data <- subset(dwnld_data, dwnld_data$Date >= "2007-02-01" & dwnld_data$Date < "2007-02-03") 

### saving the subset data.frame i.e. data as RDS file for later use
saveRDS(data, file= "data.rds")

