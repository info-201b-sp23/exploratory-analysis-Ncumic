# CREATE NEW TABLE THAT HOLDS VALUES WE ARE USING(VALUES WE ARE USING ARE IN THE DISCORD)
# DON'T FORGET TO RELABEL THEM WITH EASY TO READ TITLES(EX. SIG => SIGNIFICANCE)
library("dplyr")
# UPDATED TABLE CODE

earthquake_data <- read.csv('https://raw.githubusercontent.com/info-201b-sp23/exploratory-analysis-Ncumic/main/earthquake_data.csv')
earthquake_data <- select(earthquake_data, -c("title"))



# BONIE VIZ STUFF



# CHRISTINE VIZ STUFF



