install.packages(c("nycflights13", "tidyverse"))
library(nycflights13)
library(tidyverse)

View(flights)
View(airlines)

# 1. Top 5 Route
flights %>% 
  select("origin","dest") %>% 
  group_by(origin) %>% 
  count(dest) %>% 
  arrange(desc(n)) %>% 
  head(5)

# 2. Top 5 average arrive delay airlines
flights %>% 
  select("carrier", "arr_delay") %>%
  filter(arr_delay > 0) %>% 
  group_by(carrier) %>% 
  summarise(avg_delay = mean(arr_delay),
            min_delay = min(arr_delay),
            max_delay = max(arr_delay),
            total_delay = sum(arr_delay)) %>% 
  arrange(desc(avg_delay)) %>% 
  left_join(airlines, by = "carrier") %>% 
  head(5)

# 3. Which month has the most total arrive delay
flights %>% 
  select("month", "arr_delay") %>% 
  filter(arr_delay > 0) %>% 
  group_by(month) %>% 
  summarise(avg_delay = mean(arr_delay),
            min_delay = min(arr_delay),
            max_delay = max(arr_delay),
            total_delay = sum(arr_delay)) %>% 
  arrange(desc(total_delay))

# 4.Top 5 longest distance
flights %>% 
  select("carrier","origin","dest", "distance") %>%
  distinct(carrier,origin,dest, distance) %>% 
  arrange(desc(distance)) %>% 
  left_join(airlines, by = "carrier") %>% 
  head(5)

# 5.Top 5 airlines flight on ChristmasDay
flights %>% 
  filter(month == 12, day == 25) %>% 
  count(carrier) %>% 
  arrange(-n) %>% 
  left_join(airlines, by = "carrier") %>% 
  head(5)
