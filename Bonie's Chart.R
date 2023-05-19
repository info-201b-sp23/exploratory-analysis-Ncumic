#Bonie's visual on Top 8-10 Countries that have the most accurate estimated of intensities - Bar-Chart

#Set this working directory to where you put the Summary.R is in order to generate the plot
# setwd("C:/Users/bonie/Desktop/Bonie/INFO201/exploratory-analysis-Ncumic")
source('Summary.R')
library(ggplot2)

# Subset the top 80 countries with the highest average accuracy
top_countries <- CountryAccuracy %>% head(8)

# Create a bar chart
ggplot(data = top_countries) +
  geom_col(mapping = aes(
    x = country,
    y= avg_accuracy,
    fill = country)
  ) + 
  ggtitle("Top 8 Countries with the Most Accurate Estimated Intensities") +
  coord_cartesian(ylim = c(92, 98))
  
