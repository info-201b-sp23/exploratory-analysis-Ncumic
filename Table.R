library("dplyr")
library("tidyr")
library("lubridate")
library("ggplot2")

earthquake_data <- read.csv('https://raw.githubusercontent.com/info-201b-sp23/exploratory-analysis-Ncumic/main/earthquake_data.csv')

earthquake_data_modified <- select(earthquake_data, -c("title","net", "nst", "dmin", "gap", "magType", "depth"))

# Group_by certain aspects(magnitude)
earthquake_data_modified <- earthquake_data_modified %>% group_by(magnitude)
# rename Columns in order for better reading
earthquake_data_modified <- earthquake_data_modified %>% 
                            rename('reported intensity' = 'cdi',
                                   'estimated intensity' = 'mmi',
                                   'significance' = 'sig')

earthquake_data_modified <- earthquake_data_modified[earthquake_data_modified$country != "" & earthquake_data_modified$continent != "" & earthquake_data_modified$alert != "" & 
                                                       earthquake_data_modified$location != "", , drop = FALSE]




