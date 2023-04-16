### SEAL DATA

# Set Up Software
library(dplyr)
library(ggplot2)
library(leaflet)

# Import Data
seals <- read.csv("seal_data.csv")

# Explore Data



# How many seals?


# How many seals per year?


# Can we turn this into a visualization?
seals %>%
  group_by(year) %>%
  summarise(total = sum(seals)) %>%
  ggplot() +
  geom_line(aes(x = year, y = total))

# What kind of terrain do seals prefer?
# fast ice = fastened to shore
# ice shelf = floating ice
# sea ice = frozen salt water


# Where was the data collected?
seal_data %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(radius = 3,
                   stroke = FALSE)

# Where do we see each type of ice?
terrain_pal <- colorFactor(c("red", "blue", "orange", "green"), seal_data$terrain)

seal_data %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(color = ~terrain_pal(terrain),
                   radius = 6,
                   stroke = FALSE) %>%
  addLegend("bottomright", pal = terrain_pal, values = ~terrain)

# What area was surveyed each year?
year_pal <- colorFactor(c("red", "blue", "green", "purple"), seal_data$year)


# Where are seals actually found?
found_pal <- colorFactor(c("blue", "orange"), seal_data$seals > 0)


