print("Log Reader")
print("Currently this script uses water calibration data for all PAR values")

# Import required libraries
library(tidyverse)
library(ggplot2)
library(hms)

# Function to take a hex value in string form and convert it to a decimal number
hexstrToDec <- function(str){
  # Set default result to NA (if the string is not valid)
  result <- NA
  if(substr(str, 1, 2) == "0x"){
    result<-readBin(as.raw(strtoi(substring(str, (step<-seq(3, nchar(str), by=2)), step+1), 16)),"double",n=1,size=4,endian="big")
    
  } 
  return(result)
}

# Choose a logfile to open
logfile_name <- file.choose(new = FALSE)

# Read the file in.  Expect a configuration line on line one, then a column type
# on row two and then  headers followed by data in a tab separated form
configLines <- readLines(logfile_name, n=2)
calibrationValues <- strsplit(configLines[1], "[[:blank:]]+")[[1]]
# Set factors as NA until they can be properly loaded
airPARCalibrationFactor <- NA
waterPARCalibrationFactor <- NA
if(length(calibrationValues) == 15){
  # Calibration line length is valid and can provide the air and water calibration factors
  airPARCalibrationFactor <- as.double(calibrationValues[4])
  waterPARCalibrationFactor <- as.double(calibrationValues[5])
} else{
  warning("MPE Calibration line has invalid length, calibration values and output may be corrupt")
  # Get input from user
  airPARCalibrationFactor <- as.double(readline(prompt = "Air Calibration Factor for PAR: "))
  waterPARCalibrationFactor <- as.double(readline(prompt = "Water Calibration Factor for PAR: "))
  
}

columnTypes <- configLines[2]
# If the data is tab delimited, change read_delim to read_tsv and remove the delim=" " parameter
# also make sure the added rows in your file are also tab delimited if using tab delimited data (and no space at the end)
rawData <- read_delim(file = logfile_name, delim=" ", col_names = TRUE, skip = 2, col_types = columnTypes)

# Clean up the data
data <- rawData %>% 
  # Remove Rows with missing values
  drop_na() %>%
  # Convert PAR and Temperature strings to values
  mutate(PAR=sapply(PAR_str, hexstrToDec), Temperature=sapply(Temperature_str, hexstrToDec)) %>%
  # Apply the calibration factors to first put the results in uE/(cm2.s) amd second convert to uE/(m2.s)
  mutate(PAR = (PAR / waterPARCalibrationFactor)*10000) %>%
  # Remove the string columns
  select(-c(PAR_str, Temperature_str)) %>%
  # Remove any rows where all data values except time and millis match
  filter(if_any(-c(Time,millis),  ~ .x != lag(.x) | is.na(lag(.x)) )) %>%
  glimpse()

# Plot orientation data
dev.new()
plt1 <- data %>% 
  tidyr::gather("id", "value", c(Heading, Pitch, Roll)) %>%
  ggplot(., aes(x = Time, y = value)) + 
  geom_line() +
  facet_grid(id ~ ., scales = "free_y")
show(plt1)

# Plot PAR data in unit (uE/(m2.s))
dev.new()
plt2 <- ggplot(data, aes(x = Time, y = PAR)) +
  geom_line() +
  geom_point()
show(plt2)

## Plot PAR data - if you only want to see a specific fraction of the recorded time
# dev.new()
# plt2 <- ggplot(data, aes(x = Time, y = PAR)) +
#  geom_line() +
#  geom_point() + scale_x_time(limits = as_hms(c('20:10:50','21:46:54'))) +
#  coord_cartesian(ylim = c(0,0.00001))
#show(plt2)

# Plot Temperature data in degC
dev.new()
plt3<-ggplot(data, aes(x = Time, y = Temperature)) +
  geom_line() +
  geom_point()
show(plt3)

