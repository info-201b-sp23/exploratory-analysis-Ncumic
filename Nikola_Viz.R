# load libraries

library("dplyr")
library("stringr")
library("tidyr")
library("ggplot2")
source("Summary.R")

world_data_shape <- map_data("world")

world_earthquake_table <- left_join(world_data_shape, earthquake_data_modified, by = c("long" = "longitude", "lat" = "latitude"))


