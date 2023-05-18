# CREATE NEW TABLE THAT HOLDS VALUES WE ARE USING(VALUES WE ARE USING ARE IN THE DISCORD)
# DON'T FORGET TO RELABEL THEM WITH EASY TO READ TITLES(EX. SIG => SIGNIFICANCE)
library("dplyr")
library("tidyr")
# UPDATED TABLE CODE

earthquake_data <- read.csv('https://raw.githubusercontent.com/info-201b-sp23/exploratory-analysis-Ncumic/main/earthquake_data.csv')
earthquake_data_modified <- select(earthquake_data, -c("title","alert","net", "nst", "dmin", "gap", "magType", "depth"))


#5) Which Country had the most accurate estimated of intensities?

earthquake_data_Accuracy <- select(earthquake_data, c("magnitude", "mmi", "country"))
earthquake_data_Accuracy <- earthquake_data_Accuracy[earthquake_data_Accuracy$country != "", , drop = FALSE]
earthquake_data_Accuracy$accuracy <- (1 - abs(earthquake_data_Accuracy$mmi - earthquake_data_Accuracy$magnitude) / earthquake_data_Accuracy$magnitude) * 100


CountryAccuracy <- earthquake_data_Accuracy %>%
  group_by(country) %>%
  summarize(avg_accuracy = mean(accuracy)) %>%
  arrange(desc(avg_accuracy))

CountryMostAccurate <- CountryAccuracy %>% head(1) %>% pull(country)
