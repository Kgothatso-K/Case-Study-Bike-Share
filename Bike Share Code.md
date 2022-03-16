---
title: "Bike Share Project"
author: "Kgothatso K"
---

# Background

This project is part of the Bike Share Case Study.

# Install and load packages

```{r}
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("lubridate")
install.packages("plotly")
```

```{r}
library(tidyverse)
library(skimr)
library(janitor)
library(dplyr)
library(ggplot2)
library(lubridate)
library(plotly)
library(htmlwidgets)
```

# Import data

```{r}
trip_data_2021_01 <- read_csv("202101-divvy-tripdata.csv")
trip_data_2021_02 <- read_csv("202102-divvy-tripdata.csv")
trip_data_2021_03 <- read_csv("202103-divvy-tripdata.csv")
trip_data_2021_04 <- read_csv("202104-divvy-tripdata.csv")
trip_data_2021_05 <- read_csv("202105-divvy-tripdata.csv")
trip_data_2021_06 <- read_csv("202106-divvy-tripdata.csv")
trip_data_2021_07 <- read_csv("202107-divvy-tripdata.csv")
trip_data_2021_08 <- read_csv("202108-divvy-tripdata.csv")
trip_data_2021_09 <- read_csv("202109-divvy-tripdata.csv")
trip_data_2021_10 <- read_csv("202110-divvy-tripdata.csv")
trip_data_2021_11 <- read_csv("202111-divvy-tripdata.csv")
trip_data_2021_12 <- read_csv("202112-divvy-tripdata.csv")
```

# Inspect the data

```{r}
colnames(trip_data_2021_01)
colnames(trip_data_2021_02)
colnames(trip_data_2021_03)
colnames(trip_data_2021_04)
colnames(trip_data_2021_05)
colnames(trip_data_2021_06)
colnames(trip_data_2021_07)
colnames(trip_data_2021_08)
colnames(trip_data_2021_09)
colnames(trip_data_2021_10)
colnames(trip_data_2021_11)
colnames(trip_data_2021_12)
```

```{r}
head(trip_data_2021_01)
head(trip_data_2021_02)
head(trip_data_2021_03)
head(trip_data_2021_04)
head(trip_data_2021_05)
head(trip_data_2021_06)
head(trip_data_2021_07)
head(trip_data_2021_08)
head(trip_data_2021_09)
head(trip_data_2021_10)
head(trip_data_2021_11)
head(trip_data_2021_12)
```

# Combine the data

```{r}
trip_data_dirty_2021 <- bind_rows(trip_data_2021_01, 
                                  trip_data_2021_02, 
                                  trip_data_2021_03, 
                                  trip_data_2021_04, 
                                  trip_data_2021_05, 
                                  trip_data_2021_06, 
                                  trip_data_2021_07, 
                                  trip_data_2021_08, 
                                  trip_data_2021_09, 
                                  trip_data_2021_10, 
                                  trip_data_2021_11, 
                                  trip_data_2021_12,)
```

```{r}
head(trip_data_dirty_2021)
```

```{r}
write.csv(trip_data_dirty_2021,"trip_data_dirty_2021_R.csv", row.names = FALSE)
```

# Clean the data

```{r}
length(trip_data_dirty_2021$ride_id)
length(unique(trip_data_dirty_2021$ride_id))
```

```{r}
str(trip_data_dirty_2021)
```

```{r}
trip_data_dirty_2021$start_date <- as.Date(trip_data_dirty_2021$started_at)

trip_data_dirty_2021$end_date <- as.Date(trip_data_dirty_2021$ended_at)

trip_data_dirty_2021$trip_length <- difftime(trip_data_dirty_2021$ended_at, trip_data_dirty_2021$started_at)

trip_data_dirty_2021$start_time <- format(trip_data_dirty_2021$started_at, "%H:%M:%S")

trip_data_dirty_2021$end_time <- format(trip_data_dirty_2021$ended_at, "%H:%M:%S")

trip_data_dirty_2021$start_day_string <- wday(trip_data_dirty_2021$started_at, label = TRUE)

trip_data_dirty_2021$start_day_int <- wday(trip_data_dirty_2021$started_at)

trip_data_dirty_2021$end_day_string <- wday(trip_data_dirty_2021$ended_at, label = TRUE)

trip_data_dirty_2021$end_day_int <- wday(trip_data_dirty_2021$ended_at)

trip_data_dirty_2021$start_month_string <- month(trip_data_dirty_2021$started_at, label = TRUE)

trip_data_dirty_2021$start_month_int <- month(trip_data_dirty_2021$started_at)

trip_data_dirty_2021$end_month_string <- month(trip_data_dirty_2021$ended_at, label = TRUE)

trip_data_dirty_2021$end_month_int <- month(trip_data_dirty_2021$ended_at)
```

```{r}
trip_data_clean_2021 <- trip_data_dirty_2021 %>% 
  select(ride_id, 
         rideable_type, 
         start_date, 
         start_month_string, 
         start_month_int, 
         start_day_string, 
         start_day_int, 
         start_time, 
         end_date, 
         end_month_string, 
         end_month_int, 
         end_day_string, 
         end_day_int, 
         start_lat, 
         start_lng, 
         end_lat, 
         end_lng, 
         trip_length, 
         member_casual)
```

```{r}
write.csv(trip_data_clean_2021,"trip_data_clean_2021_R.csv", row.names = FALSE)
```

The file was further cleaned using SQL

# Analyse the data

At this point of the project, a clean csv file was uploaded. The data was further cleaned and transformed in SQL. 

The differences between the trip_data_clean_2021_R file in R and  the trip_data_clean_2021_SQL file in SQl are;
1. The SQL file has the column, trip_displacement,
2. Rows containing empty spaces were removed,
3. The coordinates in trip_data_clean_2021_R were used to calculate the displacement between the stations.

```{r}
trip_data_clean_2021 <- read_csv("trip_data_clean_2021_SQL.csv")
```

```{r}
view(is.na(trip_data_clean_2021))
```

```{r}
colnames(trip_data_clean_2021)

head(trip_data_clean_2021)

str(trip_data_clean_2021)
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, start_day_string) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, start_day_string) %>% 
       filter(member_casual == "member")  %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, start_day_string) %>% 
       filter(member_casual == "casual") %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, end_day_string) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, end_day_string) %>% 
       filter(member_casual == "member")  %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, end_day_string) %>% 
       filter(member_casual == "casual") %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, start_month_string) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, start_month_string) %>% 
       filter(member_casual == "member")  %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, start_month_string) %>% 
       filter(member_casual == "casual") %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, end_month_string) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, end_month_string) %>% 
       filter(member_casual == "member")  %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, end_month_string) %>% 
       filter(member_casual == "casual") %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, start_date) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, start_date) %>% 
       filter(member_casual == "member")  %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, start_date) %>% 
       filter(member_casual == "casual") %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, end_date) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, end_date) %>% 
       filter(member_casual == "member")  %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, end_date) %>% 
       filter(member_casual == "casual") %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, start_hour = hour(start_time)) %>% 
       summarise(number_rides = length(ride_id)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, end_hour = hour(end_time)) %>% 
       summarise(number_rides = length(ride_id)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual) %>% 
       filter(start_date == end_date) %>% 
       summarise(max(trip_length), 
                 mean(trip_length), 
                 median(trip_length), 
                 min(trip_length), 
                 sd(trip_length), 
                 max(trip_displacement), 
                 mean(trip_displacement), 
                 median(trip_displacement), 
                 min(trip_displacement), 
                 sd(trip_displacement)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual) %>% 
       filter(start_date != end_date) %>% 
       summarise(max(trip_length), 
                 mean(trip_length), 
                 median(trip_length), 
                 min(trip_length), 
                 sd(trip_length), 
                 max(trip_displacement), 
                 mean(trip_displacement), 
                 median(trip_displacement), 
                 min(trip_displacement), 
                 sd(trip_displacement)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, start_day_string) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, start_day_string) %>% 
       filter(member_casual == "member")  %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, start_day_string) %>% 
       filter(member_casual == "casual") %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, end_day_string) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, end_day_string) %>% 
       filter(member_casual == "member")  %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, end_day_string) %>% 
       filter(member_casual == "casual") %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, start_month_string) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, start_month_string) %>% 
       filter(member_casual == "member")  %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, start_month_string) %>% 
       filter(member_casual == "casual") %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, end_month_string) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, end_month_string) %>% 
       filter(member_casual == "member")  %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, end_month_string) %>% 
       filter(member_casual == "casual") %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, start_date) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, start_date) %>% 
       filter(member_casual == "member")  %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, start_date) %>% 
       filter(member_casual == "casual") %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, end_date) %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, end_date) %>% 
       filter(member_casual == "member")  %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, end_date) %>% 
       filter(member_casual == "casual") %>% 
       summarise(number_rides = length(ride_id)) %>% 
       arrange(desc(number_rides)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, start_hour = hour(start_time)) %>% 
       summarise(number_rides = length(ride_id)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type, end_hour = hour(end_time)) %>% 
       summarise(number_rides = length(ride_id)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type) %>% 
       filter(start_date == end_date & trip_length > 0) %>% 
       summarise(max(trip_length), 
                 mean(trip_length), 
                 median(trip_length), 
                 min(trip_length), 
                 sd(trip_length), 
                 max(trip_displacement), 
                 mean(trip_displacement), 
                 median(trip_displacement), 
                 min(trip_displacement), 
                 sd(trip_displacement)))
```

```{r}
view(trip_data_clean_2021 %>% 
       group_by(member_casual, rideable_type) %>% 
       filter(start_date != end_date & trip_length > 0) %>% 
       summarise(max(trip_length), 
                 mean(trip_length), 
                 median(trip_length), 
                 min(trip_length), 
                 sd(trip_length), 
                 max(trip_displacement), 
                 mean(trip_displacement), 
                 median(trip_displacement), 
                 min(trip_displacement), 
                 sd(trip_displacement)))
```

# Visualise the data

```{r}
trip_data_clean_2021 %>% 
  group_by(member_casual, rideable_type) %>% 
  summarise(number_rides = length(ride_id)) %>% 
  
  ggplot(aes(x = reorder(member_casual, member_casual), 
             y = number_rides, fill = rideable_type)) + 
  
  geom_bar(stat = "identity", 
           position = position_dodge()) + 
  
  theme_minimal() + 
  
  theme(plot.title = element_text(hjust = 0.5)) + 
  
  scale_fill_brewer(palette = "Dark2", 
                    name = "Ride Type", 
                    labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  geom_text(aes(label = number_rides), 
            position = position_dodge(0.9), 
            vjust = -0.3, 
            size = 3.5) + 
  
  labs(title = "Number Of Rides Per Member", 
         x = "Type Of Member", 
         y = "Number Of Rides")

ggsave('Rides Per Member.png',
       width=16,
       height=8)
```

```{r}
trip_data_clean_2021 %>% 
  group_by(member_casual, rideable_type, start_day_string, start_day_int) %>% 
  summarise(number_rides = length(ride_id)) %>%
  
  ggplot(aes(x = reorder(start_day_string, start_day_int), 
             y = number_rides, group = rideable_type)) + 
  
  geom_line(aes(color = rideable_type, linetype = rideable_type)) + 
  
  geom_point(aes(color = rideable_type, shape = rideable_type)) + 
  
  facet_wrap(~ member_casual) + 
  
  theme_minimal() + 
  
  theme(plot.title = element_text(hjust = 0.5)) +
  
  scale_color_brewer(palette = "Dark2", 
                     name = "Ride Type", 
                     labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  scale_shape_discrete(name = "Ride Type", 
                       labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  scale_linetype_discrete(name = "Ride Type", 
                          labels = c("Classic Bike", "Docked Bike", 
                                     "Electric Bike")) + 
  
  labs(title = "Number Of Rides Per Start Day", 
       x = "Start Day", 
       y = "Number Of Rides")

ggsave('Rides Per Start Day.png',
       width=16,
       height=8)
```

```{r}
plot_static = trip_data_clean_2021 %>% 
  group_by(member_casual, rideable_type, start_day_string, start_day_int) %>% 
  summarise(number_rides = length(ride_id)) %>%
  
  ggplot(aes(x = reorder(start_day_string, start_day_int), 
             y = number_rides, group = rideable_type, 
             text = paste0("Start Day: ", start_day_string, 
                           "\nNumber Of Rides: ", number_rides, 
                           "\nRide Type: ", rideable_type))) + 
  
  geom_line(aes(color = rideable_type, linetype = rideable_type)) +
  
  geom_point(aes(color = rideable_type, shape = rideable_type)) + 
  
  facet_wrap(~ member_casual) + 
  
  theme_minimal() + 
  
  theme(plot.title = element_text(hjust = 0.5)) +
  
  scale_color_brewer(palette = "Dark2") +
  
  labs(title = "Number Of Rides Per Start Day", 
       x = "Start Day", 
       y = "Number Of Rides")
```

```{r}
plot_interact = ggplotly(plot_static, tooltip = "text") %>% 
  layout(legend = list(title = list(text="Ride Type")))
```

```{r}
saveWidget(plot_interact, "Number Of Rides Per Start Day.html")
```

```{r}
trip_data_clean_2021 %>% 
  group_by(member_casual, rideable_type, end_day_string, end_day_int) %>% 
  summarise(number_rides = length(ride_id)) %>%
  
  ggplot(aes(x = reorder(end_day_string, end_day_int), 
             y = number_rides, group = rideable_type)) + 
  
  geom_line(aes(color = rideable_type, linetype = rideable_type)) + 
  
  geom_point(aes(color = rideable_type, shape = rideable_type)) + 
  
  facet_wrap(~ member_casual) + 
  
  theme_minimal() + 
  
  theme(plot.title = element_text(hjust = 0.5)) +
  
  scale_color_brewer(palette = "Dark2", 
                     name = "Ride Type", 
                     labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  scale_shape_discrete(name = "Ride Type", 
                       labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  scale_linetype_discrete(name = "Ride Type", 
                          labels = c("Classic Bike", "Docked Bike", 
                                     "Electric Bike")) + 
  
  labs(title = "Number Of Rides Per End Day", 
       x = "End Day", 
       y = "Number Of Rides")

ggsave('Rides Per End Day.png',
       width=16,
       height=8)
```

```{r}
trip_data_clean_2021 %>% 
  group_by(member_casual, rideable_type, start_month_string, start_month_int) %>% 
  summarise(number_rides = length(ride_id)) %>%
  
  ggplot(aes(x = reorder(start_month_string, start_month_int), 
             y = number_rides, group = rideable_type)) + 
  
  geom_line(aes(color = rideable_type, linetype = rideable_type)) + 
  
  geom_point(aes(color = rideable_type, shape = rideable_type)) + 
  
  facet_wrap(~ member_casual) + 
  
  theme_minimal() + 
  
  theme(plot.title = element_text(hjust = 0.5)) +
  
  scale_color_brewer(palette = "Dark2", 
                     name = "Ride Type", 
                     labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  scale_shape_discrete(name = "Ride Type", 
                       labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  scale_linetype_discrete(name = "Ride Type", 
                          labels = c("Classic Bike", "Docked Bike", 
                                     "Electric Bike")) + 
  
  labs(title = "Number Of Rides Per Start Month", 
       x = "Start Month", 
       y = "Number Of Rides")

ggsave('Rides Per Start Month.png',
       width=16,
       height=8)
```

```{r}
plot_static = trip_data_clean_2021 %>% 
  group_by(member_casual, rideable_type, start_month_string, start_month_int) %>% 
  summarise(number_rides = length(ride_id)) %>%
  
  ggplot(aes(x = reorder(start_month_string, start_month_int), 
             y = number_rides, group = rideable_type, 
             text = paste0("Start Month: ", start_month_string, 
                           "\nNumber Of Rides: ", number_rides, 
                           "\nRide Type: ", rideable_type))) + 
  
  geom_line(aes(color = rideable_type, linetype = rideable_type)) +
  
  geom_point(aes(color = rideable_type, shape = rideable_type)) + 
  
  facet_wrap(~ member_casual) + 
  
  theme_minimal() + 
  
  theme(plot.title = element_text(hjust = 0.5)) +
  
  scale_color_brewer(palette = "Dark2") +
  
  labs(title = "Number Of Rides Per Start Month", 
       x = "Start Month", 
       y = "Number Of Rides")
```

```{r}
plot_interact = ggplotly(plot_static, tooltip = "text") %>% 
  layout(legend = list(title = list(text="Ride Type")))
```

```{r}
saveWidget(plot_interact, "Number Of Rides Per Start Month.html")
```

```{r}
trip_data_clean_2021 %>% 
  group_by(member_casual, rideable_type, end_month_string, end_month_int) %>% 
  summarise(number_rides = length(ride_id)) %>%
  
  ggplot(aes(x = reorder(end_month_string, end_month_int), 
             y = number_rides, group = rideable_type)) + 
  
  geom_line(aes(color = rideable_type, linetype = rideable_type)) + 
  
  geom_point(aes(color = rideable_type, shape = rideable_type)) + 
  
  facet_wrap(~ member_casual) + 
  
  theme_minimal() + 
  
  theme(plot.title = element_text(hjust = 0.5)) +
  
  scale_color_brewer(palette = "Dark2", 
                     name = "Ride Type", 
                     labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  scale_shape_discrete(name = "Ride Type", 
                       labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  scale_linetype_discrete(name = "Ride Type", 
                          labels = c("Classic Bike", "Docked Bike", 
                                     "Electric Bike")) + 
  
  labs(title = "Number Of Rides Per End Month", 
       x = "Start Month", 
       y = "Number Of Rides")

ggsave('Rides Per End Month.png',
       width=16,
       height=8)
```

```{r}
trip_data_clean_2021 %>% 
  group_by(member_casual, rideable_type, start_hour = hour(start_time)) %>% 
  summarise(number_rides = length(ride_id)) %>%
  
  ggplot(aes(x = reorder(start_hour, start_hour), 
             y = number_rides, group = rideable_type)) + 
  
  geom_line(aes(color = rideable_type, linetype = rideable_type)) + 
  
  geom_point(aes(color = rideable_type, shape = rideable_type)) + 
  
  facet_wrap(~ member_casual) + 
  
  theme_minimal() + 
  
  theme(plot.title = element_text(hjust = 0.5)) +
  
  scale_color_brewer(palette = "Dark2", 
                     name = "Ride Type", 
                     labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  scale_shape_discrete(name = "Ride Type", 
                       labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  scale_linetype_discrete(name = "Ride Type", 
                          labels = c("Classic Bike", "Docked Bike", 
                                     "Electric Bike")) + 
  
  labs(title = "Number Of Rides Per Start Hour", 
       x = "Start Hour", 
       y = "Number Of Rides")

ggsave('Rides Per Start Hour.png',
       width=16,
       height=8)
```

```{r}
plot_static = trip_data_clean_2021 %>% 
  group_by(member_casual, rideable_type, start_hour = hour(start_time)) %>% 
  summarise(number_rides = length(ride_id)) %>%
  
  ggplot(aes(x = reorder(start_hour, start_hour), 
             y = number_rides, group = rideable_type, 
             text = paste0("Start Hour: ", start_hour, 
                           "\nNumber Of Rides: ", number_rides, 
                           "\nRide Type: ", rideable_type))) + 
  
  geom_line(aes(color = rideable_type, linetype = rideable_type)) +
  
  geom_point(aes(color = rideable_type, shape = rideable_type)) + 
  
  facet_wrap(~ member_casual) + 
  
  theme_minimal() + 
  
  theme(plot.title = element_text(hjust = 0.5)) +
  
  scale_color_brewer(palette = "Dark2") +
  
  labs(title = "Number Of Rides Per Start Hour", 
       x = "Start Hour", 
       y = "Number Of Rides")
```

```{r}
plot_interact = ggplotly(plot_static, tooltip = "text") %>% 
  layout(legend = list(title = list(text="Ride Type")))
```

```{r}
saveWidget(plot_interact, "Number Of Rides Per Start Hour.html")
```

```{r}
trip_data_clean_2021 %>% 
  group_by(member_casual, rideable_type, end_hour = hour(end_time)) %>% 
  summarise(number_rides = length(ride_id)) %>%
  
  ggplot(aes(x = reorder(end_hour, end_hour), 
             y = number_rides, group = rideable_type)) + 
  
  geom_line(aes(color = rideable_type, linetype = rideable_type)) + 
  
  geom_point(aes(color = rideable_type, shape = rideable_type)) + 
  
  facet_wrap(~ member_casual) + 
  
  theme_minimal() + 
  
  theme(plot.title = element_text(hjust = 0.5)) +
  
  scale_color_brewer(palette = "Dark2", 
                     name = "Ride Type", 
                     labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  scale_shape_discrete(name = "Ride Type", 
                       labels = c("Classic Bike", "Docked Bike", "Electric Bike")) + 
  
  scale_linetype_discrete(name = "Ride Type", 
                          labels = c("Classic Bike", "Docked Bike", 
                                     "Electric Bike")) + 
  
  labs(title = "Number Of Rides Per End Hour", 
       x = "End Hour", 
       y = "Number Of Rides")

ggsave('Rides Per End Hour.png',
       width=16,
       height=8)
```
