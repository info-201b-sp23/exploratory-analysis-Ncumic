# CREATE NEW TABLE THAT HOLDS VALUES WE ARE USING(VALUES WE ARE USING ARE IN THE DISCORD)
# DON'T FORGET TO RELABEL THEM WITH EASY TO READ TITLES(EX. SIG => SIGNIFICANCE)
library("dplyr")
library("tidyr")
library("lubridate")
library("ggplot2")

# UPDATED TABLE CODE

earthquake_data <- read.csv('https://raw.githubusercontent.com/info-201b-sp23/exploratory-analysis-Ncumic/main/earthquake_data.csv')
earthquake_data_modified <- select(earthquake_data, -c("title","net", "nst", "dmin", "gap", "magType", "depth"))

##BrianChiang
##SUMMARY VALUES TO CALCULATE:
##1) Which Continent with most earthquakes?
continent_counts <- earthquake_data_modified %>%
  count(continent)

continent_counts

##2) What year had the most earthquakes?

#this line right here doesn't work and stops everything else, it might still checking
# earthquake_data_modified$year <- as.integer(format(earthquake_data_modified$date, "%Y"))

year_counts <- table(earthquake_data_modified$year)

most_earthquakes_year <- as.integer(names(year_counts)[which.max(year_counts)])

##3) Number of earthquakes over the years(trend)

trend_data <- data.frame(year = as.integer(names(year_counts)),
                         earthquakes = as.numeric(year_counts))

ggplot(data = trend_data, aes(x = year, y = earthquakes)) +
  geom_line() +
  geom_point() +
  labs(x = "Year", y = "Number of Earthquakes", title = "Trend of Earthquakes over the Years")


##4) Country with the most intense magnitudes of earthquakes

country_max_magnitude <- earthquake_data_modified %>%
  group_by(country) %>%
  summarise(max_magnitude = max(magnitude, na.rm = TRUE)) %>%
  arrange(max_magnitude) %>% 
  last()

country_max_magnitude

#5) Which Country had the most accurate estimated of intensities?

earthquake_data_Accuracy <- select(earthquake_data, c("magnitude", "mmi", "country"))
earthquake_data_Accuracy <- earthquake_data_Accuracy[earthquake_data_Accuracy$country != "", , drop = FALSE]
earthquake_data_Accuracy$accuracy <- (1 - abs(earthquake_data_Accuracy$mmi - earthquake_data_Accuracy$magnitude) / earthquake_data_Accuracy$magnitude) * 100

CountryAccuracy <- earthquake_data_Accuracy %>%
  group_by(country) %>%
  summarize(avg_accuracy = mean(accuracy)) %>%
  arrange(desc(avg_accuracy))

CountryMostAccurate <- CountryAccuracy %>% head(1) %>% pull(country)

