library("dplyr")
library("tidyr")
library("lubridate")
library("ggplot2")

earthquake_data <- read.csv('https://raw.githubusercontent.com/info-201b-sp23/exploratory-analysis-Ncumic/main/earthquake_data.csv')

earthquake_data_modified <- select(earthquake_data, -c("title","net", "nst", "dmin", "gap", "magType", "depth"))

# Group_by certain aspects(magnitude)
earthquake_data_modified <- earthquake_data_modified %>% group_by(magnitude)
# rename Columns inorder for better reading

# Create the summary table
source("/Users/chenhaochiang/Desktop/Info201/exploratory-analysis-Ncumic/Summary.R")

library(dplyr)


