# load libraries

library("dplyr")
library("stringr")
library("tidyr")
library("ggplot2")
source("Summary.R")

world_data_shape <- map_data("world")

world_earthquake_table <- left_join(world_data_shape, earthquake_data_modified, by = c("long" = "longitude", "lat" = "latitude"))

world_plot <- ggplot(data = world_data_shape) +
  geom_polygon(aes(x = long,
                   y = lat,
                   group = group)) +
  geom_point(data = earthquake_data_modified,
             aes(x = longitude, y = latitude,
             size = magnitude),
             #will make color match to magnitude size somehow
             color = "Red",
             # might change shape later
             shape = 21
  )



