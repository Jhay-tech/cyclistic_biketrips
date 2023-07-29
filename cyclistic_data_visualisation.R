# Data visualization 
data_vis_1 <-
  cleaned_biketrips %>%
  group_by(customer_type) %>%
  dplyr::summarise(mean_ridelength = mean(ride_length),.groups = "drop") %>%
  ggplot(aes(x = customer_type,
             y = mean_ridelength,
             fill = customer_type)) +
  geom_bar(width = 0.4, position = position_dodge(width = 0.6), stat = "identity") +
  #geom_text(aes(label = x_ridelength), position = position_dodge (width=1),vjust = -0.5, size =3.5, colour = "black")+
  scale_fill_manual(values = c("#e03424", "#3970dd")) +
  scale_y_continuous(n.breaks = 8) +
  labs(
    title = paste(
      "Annual Members vs. Casual Riders\n Total Mean Ride Lengths (in Mins)"
    ),
    subtitle = "From January 2021-June 2023",
    x = "Customer Type",
    y = "Mean Length of Rides (in Mins)"
  ) + labs(fill = 'Customer Type')+ 
  theme_light() + theme(
    plot.title = element_text(
      color = "black",
      size = 13,
      face = "bold",
      hjust = 0.5
    ),
    plot.subtitle = element_text(hjust = 0.5)
  ) +  theme(panel.grid.major.x = element_blank(),
             panel.grid.minor.x = element_blank())

data_vis_2 <-
  cleaned_biketrips %>%
  group_by(customer_type) %>%
  dplyr::summarise(median_ride_length = median(ride_length),.groups = "drop") %>%
  ggplot(aes(x = customer_type,
             y = median_ride_length,
             fill = customer_type)) +
  geom_bar(width = 0.4, position = position_dodge(width = 0.6), stat = "identity") +
  #geom_text(aes(label = x_ridelength), position = position_dodge (width=1),vjust = -0.5, size =3.5, colour = "black")+
  scale_fill_manual(values = c("#e03424", "#3970dd")) +
  scale_y_continuous(n.breaks = 8) +
  labs(
    title = paste(
      "Annual Members vs. Casual Riders\n Total Median Ride Lengths (in mins)"
    ),
    captions =
      "Maximun and Minimum Length of Ride:\nMaximum: 1439 mins || Minimum: 1 min\n
       Source: Motivate International Inc.\n Lyft Bikes and Scooters, LLC (“Bikeshare”)",
    subtitle = "From January 2021-June 2021",
    x = "Customer Type",
    y = "Median Length of Rides (in Mins)"
  ) + labs(fill = 'Customer Type')+ 
  theme_light() + theme(
    plot.title = element_text(
      color = "black",
      size = 13,
      face = "bold",
      hjust = 0.5
    ),
    plot.subtitle = element_text(hjust = 0.5)
  ) +  theme(panel.grid.major.x = element_blank(),
             panel.grid.minor.x = element_blank())

data_vis_1 + data_vis_2

data_vis_3 <- cleaned_biketrips %>%
  group_by(customer_type) %>%
  dplyr::summarise(rides_number = n(), .groups = "drop") %>%
  ggplot(aes(x = customer_type, y = rides_number, fill = customer_type)) +
  geom_col(width = 0.3, position = position_dodge(width = 0.6)) +
  scale_fill_manual(values = c("#e03424", "#3970dd")) +
  scale_y_continuous(n.breaks = 15) +
  labs(
    title = paste(
      "Annual Members vs. Casual Riders",
      sep = "\n",
      "Total Rides Number"
    ),
    caption = paste(
      "Source: Motivate International Inc.",
      sep = "\n",
      "Lyft Bikes and Scooters, LLC (“Bikeshare”)"
    ),
    subtitle = "From January 2021-June 2021",
    x = "Customer Type",
    y = "Rides Number" 
  ) + labs(fill = 'Customer Type')+ 
  theme_light() + theme(
    plot.title = element_text(
      color = "black",
      size = 13,
      face = "bold",
      hjust = 0.5
    ),
    plot.subtitle = element_text(hjust = 0.5)
  )

data_vis_4 <- cleaned_biketrips %>%
  group_by(customer_type, hour_start) %>%
  dplyr::summarise(rides_number = n(), .groups = "drop") %>%
  ggplot(aes(x = hour_start, y = rides_number, col = customer_type)) + geom_point (alpha = 0.5, size = 2) +
  scale_colour_manual(name = "Customer Type",
                      values = c("casual" = "#e03424", "member" = "#3970dd")) +
  scale_y_continuous(n.breaks = 12) +
  scale_x_continuous(n.breaks = 24) +
  labs(
    title = paste(
      "Annual Members vs. Casual Riders",
      sep = "\n",
      "Total Number of Rides in Start Hours of Rides of the Day"
    ),
    caption = paste(
      "Source: Motivate International Inc.",
      sep = "\n",
      "Lyft Bikes and Scooters, LLC (“Bikeshare”)"
    ),
    subtitle = "From January 2021-June 2021",
    x = "Ride Hours in 24-Hour Format",
    y = "Number of Rides"
  ) +
  geom_smooth() +
  theme_light() + theme(panel.grid.major.x = element_blank(),
                        panel.grid.minor.x = element_blank())

data_vis_5 <- cleaned_biketrips %>%
  group_by(customer_type, hour_start, day_of_week) %>%
  dplyr::summarise(rides_number = n(), .groups = "drop") %>%
  ggplot(aes(x = hour_start, y = rides_number, col = customer_type)) + geom_point (size = 1) +
  scale_colour_manual(name = "Customer Types",
                      values = c("casual" = "#e03424", "member" = "#3970dd")) +
  scale_y_continuous(n.breaks = 5) +
  scale_x_continuous(n.breaks = 7) +
  labs(
    title = paste(
      "Annual Members vs. Casual Riders",
      sep = "\n",
      "Total Number of Rides divided by Days of the Week and\nStart Hours of Rides of the Day"
    ),
    caption = paste(
      "Source: Motivate International Inc.",
      sep = "\n",
      "Lyft Bikes and Scooters, LLC (“Bikeshare”)"
    ),
    subtitle = "From January 2021-June 2021",
    x = "Ride Hours in 24-Hour Format",
    y = "Rides Number"
  ) + facet_wrap(.~day_of_week) +
  geom_smooth() + theme_light()+ theme(panel.grid.major.x = element_blank(),
                                       panel.grid.minor.x = element_blank()) + 
  theme(strip.background = element_rect(fill = c("#81f70a"))) +
  theme(strip.text = element_text(colour = 'black', face = "bold"))

data_vis_6 <- cleaned_biketrips %>%
  group_by(customer_type, day_of_week) %>%
  dplyr::summarise(rides_number = n(), .groups = "drop") %>%
  ggplot(aes(x = day_of_week,
             y = rides_number,
             fill = customer_type)) +
  geom_bar(width = 0.7, position = position_dodge(width = 0.9), stat = "identity") + coord_flip() +
  scale_fill_manual(values = c("#e03424", "#3970dd")) +
  scale_y_continuous(n.breaks = 10) +
  labs(
    title = paste(
      "Annual Members vs. Casual Riders\n Total Number of Rides per Days of the Week"
    ),
    captions =
      "Source: Motivate International Inc.\nLyft Bikes and Scooters, LLC (“Bikeshare”)",
    subtitle = "From January 2021-June 2021",
    x = "Days of the Week",
    y = "Rides Number"
  ) +  labs(fill = 'Customer Types')+ 
  theme_light() + theme(
    plot.title = element_text(
      color = "black",
      size = 13,
      face = "bold",
      hjust = 0.5
    ), 
    plot.subtitle = element_text(hjust = 0.5)
  ) +  theme(panel.grid.major.x = element_blank(),
             panel.grid.minor.x = element_blank()) +
  theme(strip.background = element_rect(fill = c("#81f70a"))) +
  theme(strip.text = element_text(colour = 'black', face = "bold"))

data_vis_7 <- cleaned_biketrips %>%
  group_by(customer_type, day_of_week) %>%
  dplyr::summarise(mean_ride_length = mean(ride_length), .groups = "drop") %>%
  ggplot(aes(x = day_of_week,
             y = mean_ride_length,
             fill = customer_type)) +
  geom_bar(width = 0.7, position = position_dodge(width = 0.9), stat = "identity") + coord_flip() +
  scale_fill_manual(values = c("#e03424", "#3970dd")) +
  scale_y_continuous(n.breaks = 11) +
  labs(
    title = paste(
      "Annual Members vs. Casual Riders\n Average Length of Rides (in Mins) per Days of the Week"
    ),
    captions =
      "Source: Motivate International Inc.\nLyft Bikes and Scooters, LLC (“Bikeshare”)",
    subtitle = "From January 2021-June 2021",
    x = "Days of the Week",
    y = "Length of Rides (in Mins)"
  ) +  labs(fill = 'Customer Type')+ 
  theme_light() + theme(
    plot.title = element_text(
      color = "black",
      size = 13,
      face = "bold",
      hjust = 0.5
    ),
    plot.subtitle = element_text(hjust = 0.5)
  ) +  theme(panel.grid.major.x = element_blank(),
             panel.grid.minor.x = element_blank()) +
  theme(strip.background = element_rect(fill = c("#81f70a"))) +
  theme(strip.text = element_text(colour = 'black', face = "bold"))

data_vis_8 <- cleaned_biketrips %>%
  group_by(customer_type, month) %>%
  dplyr::summarise(rides_number = n(), .groups = "drop") %>%
  ggplot(aes(x = month,
             y = rides_number,
             fill = customer_type)) +
  geom_bar(width = 0.7, position = position_dodge(width = 0.9), stat = "identity") + coord_flip() +
  scale_fill_manual(values = c("#e03424", "#3970dd")) +
  scale_y_continuous(n.breaks = 10) +
  labs(
    title = paste(
      "Annual Members vs. Casual Riders\n Total Rides Number by Month"
    ),
    captions =
      "Source: Motivate International Inc.\nLyft Bikes and Scooters, LLC (“Bikeshare”)",
    subtitle = "From January 2021-June 2021",
    x = "Month",
    y = "Rides Number"
  ) +  labs(fill = 'Customer Type')+ 
  theme_light() + theme(
    plot.title = element_text(
      color = "black",
      size = 13,
      face = "bold",
      hjust = 0.5
    ),
    plot.subtitle = element_text(hjust = 0.5)
  ) +  theme(panel.grid.major.x = element_blank(),
             panel.grid.minor.x = element_blank()) +
  theme(strip.background = element_rect(fill = c("#81f70a"))) +
  theme(strip.text = element_text(colour = 'black', face = "bold"))

data_vis_9 <- top_15_stations %>%
  filter(customer_type == "member") %>%
  ggplot() +
  geom_bar(aes(x = reorder(start_station_name, rides_number), y = rides_number, 
               fill = customer_type), stat = "identity", width = 0.7) + coord_flip() +
  scale_y_continuous(n.breaks = 7) +
  scale_fill_manual(values = "#3970dd") +
  labs(
    title = paste(" Top 15 Most Popular Start Stations for Annual Members"),
    captions =
      "Source: Motivate International Inc.\nLyft Bikes and Scooters, LLC (“Bikeshare”)",
    subtitle = "From January 2021-June 2021",
    x = "Starting Stations",
    y = "Rides Number"
  ) +  labs(fill = 'Customer Type') +
  theme_light() + theme(
    plot.title = element_text(
      color = "black",
      size = 13,
      face = "bold",
      hjust = 0.5
    ),
    plot.subtitle = element_text(hjust = 0.5)
  ) + theme_light() +
  theme(
    panel.grid.major.y = element_blank(),
    axis.ticks.y = element_blank()
  )

data_vis_10 <- top_15_stations %>%
  filter(customer_type == "casual") %>%
  ggplot() +
  geom_bar(aes(x = reorder(start_station_name, rides_number), y = rides_number, 
               fill = customer_type), stat = "identity", width = 0.7) + coord_flip() +
  scale_y_continuous(n.breaks = 7) +
  scale_fill_manual(values = "#e03424") +
  labs(
    title = paste(" Top 15 Most Popular Start Stations for Casual Riders"),
    captions =
      "Source: Motivate International Inc.\nLyft Bikes and Scooters, LLC (“Bikeshare”)",
    subtitle = "From January 2021-June 2021",
    x = "Starting Stations",
    y = "Rides Number"
  ) +  labs(fill = 'Customer Type') +
  theme_light() + theme(
    plot.title = element_text(
      color = "black",
      size = 13,
      face = "bold",
      hjust = 0.5
    ),
    plot.subtitle = element_text(hjust = 0.5)
  ) + theme_light() +
  theme(
    panel.grid.major.y = element_blank(),
    axis.ticks.y = element_blank()
  )
 
