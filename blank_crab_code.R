### SNOW CRAB DATA

# Set Up Software
library(dplyr)
library(ggplot2)
library(leaflet)

# Import Data
crabs <- read.csv("sample_crabs.csv")

# Explore Data



# How many crabs were caught?


# How many crabs were caught per year?


# Can we turn this into a visualization?
crabs %>%
  group_by(year) %>%
  summarise(total = sum(cpue)) %>%
  ggplot() +
  geom_line(aes(x = year, y = total))

# How many male and female crabs were caught?


# How many male and female crabs were caught per year?


# Can we turn this into a visualization?
crabs %>%
  group_by(year, sex) %>%
  summarise(total = sum(cpue)) %>%
  ggplot() +
  geom_line(aes(x = year, y = total, col = sex))

# How has the surface temperature of the ocean changed since 1975?


# Can we add some colour to this?
ggplot(crabs) +
  geom_point(aes(x = year, y = surface_temperature, col = surface_temperature)) +
  scale_colour_gradient(low = "blue", high = "red")

# Where was the data collected?
leaflet(crabs) %>%
  addTiles() %>%
  addCircleMarkers(radius = 3,
                   stroke = FALSE)

# Can we use depth to look at the bathymetry of the ocean floor?
depth_pal <- colorNumeric(c("blue", "red"), crabs$bottom_depth)


