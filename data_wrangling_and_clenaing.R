# Since the datasets are large, I decided to continue my cleaning or manipulation process with R programming
# Install and load all the packages needed 
install.packages("tidyverse")
install.packages("withr")
install.packages("Rtools")
install.packages("plyr")
install.packages("skimr")
library(tidyverse)
library(dplyr)
library(lubridate)
library(readr) 
library(skimr)
library(ggplot2)
library(RColorBrewer)
library(plyr)
library(patchwork)

# Load data from 01/2021 to 06/2021 due to R RAM space 
biketrips_01_2021 <- read_csv("cyclistic_project/csv_files/01_2021_cyclistic_biketrips.csv")
biketrips_02_2021 <- read_csv("cyclistic_project/csv_files/02_2021_cyclistic_biketrips.csv")
biketrips_03_2021 <- read_csv("cyclistic_project/csv_files/03_2021_cyclistic_biketrips.csv")
biketrips_04_2021 <- read_csv("cyclistic_project/csv_files/04_2021_cyclistic_biketrips.csv")
biketrips_05_2021 <- read_csv("cyclistic_project/csv_files/05_2021_cyclistic_biketrips.csv")
biketrips_06_2021 <- read_csv("cyclistic_project/csv_files/06_2021_cyclistic_biketrips.csv")

# Combine all the data
merged_biketrips <- bind_rows(biketrips_01_2021, biketrips_02_2021, biketrips_03_2021, biketrips_04_2021, biketrips_05_2021, biketrips_06_2021)

# Check the column names, each datatype and view the first 10 data
str(merged_biketrips)
head(merged_biketrips) 

# Check summary statistics on the columns
summary(merged_biketrips)

# Change the format of the start_datetime and end_datetime to date and time format 
merged_biketrips$start_datetime <- as.POSIXct(merged_biketrips$start_datetime, format = "%m/%d/%Y %H:%M")
merged_biketrips$end_datetime <- as.POSIXct(merged_biketrips$end_datetime, format = "%m/%d/%Y %H:%M")

# Check if there are any misspelled value in column customer_type
unique(merged_biketrips$customer_type)

# Create new columns; ride_length, day_of_week, hour and month
cleaned_biketrips = merged_biketrips %>%
  mutate(
    ride_length = difftime(end_datetime, start_datetime, units = "mins"),
    day_of_week = wday(start_datetime, label = T, abbr = F),
    hour_start = hour(start_datetime),
    month = month(start_datetime, label = T, abbr = F),
  )

# Change ride_length to numeric format
cleaned_biketrips$ride_length <-
  as.numeric(as.character(cleaned_biketrips$ride_length))
is.numeric(cleaned_biketrips$ride_length) #returns TRUE if ride_length is numeric already

# Remove bad ride_length data
# ride length must be at least 1 min but not more than 24 hours(1440 minutes)
cleaned_biketrips = cleaned_biketrips %>%
  filter(between(ride_length, 1, 1440))
bad_data <- nrow(merged_biketrips) - nrow(cleaned_biketrips)
paste0("There are a total of ", bad_data , " bad data removed ")
