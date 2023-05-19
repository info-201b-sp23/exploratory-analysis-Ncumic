# BB-5

# load libraries
library("dplyr")
library("stringr")
library("ggplot2")

# load the data 
# Download the SPL datasets and load here from a file path
eq_df <- read.csv("https://raw.githubusercontent.com/info-201b-sp23/exploratory-analysis-Ncumic/main/earthquake_data.csv", 
                  stringsAsFactors = FALSE)

world_shape <- map_data("world")

eq_mapping_df <- left_join(world_shape, eq_df, by = c("long" = "longitude", "lat" = "latitude"))

world_plot <- ggplot(data = world_shape) +
  geom_polygon(aes(x = long, 
                   y = lat,
                   group = group)) +
  geom_point(data = filter(eq_df, tsunami == 0),
             aes(x = longitude,
                 y = latitude),
             color = "blue") +
  geom_point(data = filter(eq_df, tsunami == 1),
             aes(x = longitude,
                 y = latitude),
             color = "red") +
  labs(title = "Earthquakes That Caused Tsunami's",
       x = "Longitude",
       y = "Latitude"
  )
world_plot

#world_plot <- ggplot(data = world_shape) +
#geom_polygon(aes(x = long, 
#                 y = lat,
#                 group = group)) +
#  geom_point(data = eq_df,
#             aes(x = longitude,
#                 y = latitude),
#             color = "blue")