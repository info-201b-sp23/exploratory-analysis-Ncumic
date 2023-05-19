library("dplyr")
library("tidyr")
library("lubridate")
library("ggplot2")

earthquake_data <- read.csv('https://raw.githubusercontent.com/info-201b-sp23/exploratory-analysis-Ncumic/main/earthquake_data.csv')

earthquake_data_modified <- select(earthquake_data, -c("title","net", "nst", "dmin", "gap", "magType", "depth"))

# Group_by certain aspects(probably location/country)

# rename Columns inorder for better reading

# Create the summary table
source("/Users/chenhaochiang/Desktop/Info201/exploratory-analysis-Ncumic/Summary.R")

library(dplyr)

summary_info <- list()
summary_info$continent_counts <- earthquake_data_modified %>%
  count(continent)

summary_info$most_earthquakes_year <- earthquakes_by_year %>%
  filter(Count == max(Count)) %>%
  pull(Year)

summary_info$trend_data <- earthquake_data_modified %>%
  group_by(Year) %>%
  summarise(earthquakes = n())

summary_info$country_max_magnitude <- earthquake_data_modified %>%
  group_by(country) %>%
  summarise(max_magnitude = max(magnitude, na.rm = TRUE)) %>%
  arrange(max_magnitude) %>% 
  last()

summary_info$CountryMostAccurate <- CountryAccuracy %>% head(1) %>% pull(country)
 
View(summary_info)                                             

