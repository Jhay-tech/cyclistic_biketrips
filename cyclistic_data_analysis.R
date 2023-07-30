#View the cleaned biketrips data
View(cleaned_biketrips)

# Check the min value in ride_length
## Minimum ride length = 1
min(cleaned_biketrips$ride_length)

# Check the max value in ride_length 
## Maximum ride length = 1439
max(cleaned_biketrips$ride_length)

# Check the cleaned data
## Rows = 1,904,348, Columns = 17
glimpse(cleaned_biketrips)

# Find the overall mean of ride_length among annual members and casual riders.
mean_ridelength_member <-
  mean(cleaned_biketrips$ride_length[cleaned_biketrips$customer_type == "member"], na.rm = TRUE)
mean_ridelength_casual <-
  mean(cleaned_biketrips$ride_length[cleaned_biketrips$customer_type == "casual"], na.rm = TRUE)

paste0("Members mean ride length is ", mean_ridelength_member)
## "Members mean ride length is 14.3854362141648"

paste0("Casual mean ride length is ", mean_ridelength_casual)
## "Casual mean ride length is 30.5959822885869"

# Find the overall median of ride_length of annual members and casual riders.
median_ride_length_member <- 
  median(cleaned_biketrips$ride_length[cleaned_biketrips$customer_type == "member"], na.rm = TRUE)
median_ride_length_casual <-
  median(cleaned_biketrips$ride_length[cleaned_biketrips$customer_type == "casual"], na.rm = TRUE)

paste0("Members median ride length is ", median_ride_length_member)
## "Members median ride length is 10"
paste0("Casual median ride length is ", median_ride_length_casual)
## "Casual median ride length is 18"

# Find the minimum and maximum ride length for both members and casual riders 
## Minimum ride length for annual members = 1
## Mimimum ride length for casual members = 1
min(cleaned_biketrips$ride_length[cleaned_biketrips$customer_type == "member"])
min(cleaned_biketrips$ride_length[cleaned_biketrips$customer_type == "casual"])

## Maximum ride length for annual members = 1434
## Maximum ride length for casual members = 1439
max(cleaned_biketrips$ride_length[cleaned_biketrips$customer_type == "member"])
max(cleaned_biketrips$ride_length[cleaned_biketrips$customer_type == "casual"])

#Find the total number of rides among members and casual riders 
## Annual members total number of rides = 1046596
## Casual riders total number of rides = 857752
total_rides_customer <- cleaned_biketrips %>% 
  group_by(customer_type) %>% 
  dplyr::summarise(rides_number = n())
total_rides_customer

# Find the total ride_length between members and casual riders 
total_ride_length_member <-
  sum(cleaned_biketrips$ride_length[cleaned_biketrips$customer_type == "member"], 
      na.rm = TRUE)
total_ride_length_casual <-
  sum(cleaned_biketrips$ride_length[cleaned_biketrips$customer_type == "casual"], 
      na.rm = TRUE) 

paste0("The combined distance traveled by annual members is ", 
       total_ride_length_member)
## "The combined distance traveled by annual members is 15055740"

paste0("The combined distance traveled by casual riders is ", 
       total_ride_length_casual)
## "The combined distance traveled by casual riders is 26243765"

# Find the most popular day of the week between annual members and casual riders 
favored_day <- cleaned_biketrips %>% 
  group_by(customer_type, day_of_week) %>% 
  dplyr::summarise(rides_number = n(), .groups = "drop")
favored_day

favored_day_ridelength <- cleaned_biketrips %>%
  group_by(customer_type, day_of_week) %>%
  dplyr::summarise(mean_ridelength = mean(ride_length), .groups = "drop")
favored_day_ridelength

# Find the most popular starting hour between annual members and casual riders
favored_starthour <- cleaned_biketrips %>% 
  group_by(customer_type, hour_start) %>% 
  dplyr::summarise(rides_number = n(), .groups = "drop")
favored_starthour

# Find the most popular starting hour between annual members and casual riders
favored_month <- cleaned_biketrips %>% 
  group_by(customer_type, month) %>% 
  dplyr::summarise(rides_length = n(), .groups = "drop")
favored_month

favored_month_ridelength <-cleaned_biketrips %>%
  group_by(customer_type, month) %>%
  dplyr::summarise(mean_ride_length = mean(ride_length), .groups = "drop")
favored_month_ridelength 

# Fine the top 15 starting stations per number of rides for both annual members and casual riders
# Calculate the daily average rides for each stations first
options(dplyr.summarise.inform = FALSE)
avg_rides_start_station <- cleaned_biketrips %>% 
  filter(start_station_name != " ") %>% 
  group_by(start_station_name, customer_type) %>% 
  dplyr::summarise(rides_number = n())
avg_rides_start_station <- avg_rides_start_station[!avg_rides_start_station$start_station_name == "",]

#Then find the top 15 for both members and casual riders 
top_15_stations <- 
  rbind(
    avg_rides_start_station %>% filter(customer_type == "member") %>% arrange(desc(rides_number)) %>% head(15),
    avg_rides_start_station %>% filter(customer_type == "casual") %>% arrange(desc(rides_number)) %>% head(15),
  )


