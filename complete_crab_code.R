### SNOW CRAB DATA

# Set Up Software
library(dplyr)
library(ggplot2)
library(leaflet)

# Import Data
crabs <- read.csv("sample_crabs.csv")

# Explore Data



# Where was the data collected?
leaflet(crabs) %>%
  addTiles() %>%
  addCircleMarkers(radius = 3,
                   stroke = FALSE)

# How many crabs were caught?
crabs %>%
  summarise(total = sum(cpue))

# How many crabs were caught per year?
crabs %>%
  group_by(year) %>%
  summarise(total = sum(cpue))

# Can we turn this into a visualization?
crabs %>%
  group_by(year) %>%
  summarise(total = sum(cpue)) %>%
  ggplot() +
  geom_line(aes(x = year, y = total))

# How many male and female crabs were caught?
crabs %>%
  group_by(sex) %>%
  summarise(total = sum(cpue))

# How many male and female crabs were caught per year?
crabs %>%
  group_by(sex, year) %>%
  summarise(total = sum(cpue))

# Can we turn this into a visualization?
crabs %>%
  group_by(year, sex) %>%
  summarise(total = sum(cpue)) %>%
  ggplot() +
  geom_line(aes(x = year, y = total, col = sex))

# How has the surface temperature of the ocean changed since 1975?
ggplot(crabs) +
  geom_point(aes(x = year, y = surface_temperature))

# Can we add some colour to this?
ggplot(crabs) +
  geom_point(aes(x = year, y = surface_temperature, col = surface_temperature)) +
  scale_colour_gradient(low = "blue", high = "red")

# Can we use depth to look at the bathymetry of the ocean floor?
depth_pal <- colorNumeric(c("blue", "red"), crabs$bottom_depth)

crabs %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(radius = 8,
                   stroke = FALSE,
                   col = ~depth_pal(bottom_depth))

# EXTRAS
# Where do crabs like to hang out?
ggplot(crabs) +
  geom_point(aes(x = bottom_depth, y = cpue))

# Is it different for males and females?
ggplot(crabs) +
  geom_point(aes(x = bottom_depth, y = cpue, col = sex))

