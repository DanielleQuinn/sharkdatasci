# Load Packages
library(tidyverse)

# Data Import / Modification
rawdata <- read.csv("sharkdata.csv") %>%
  mutate(species = factor(species, c("Deep Water Catshark",
                                     "Greenland Shark",
                                     "Spiny Dogfish",
                                     "Barndoor Skate")))

floordata <- rawdata %>%
  arrange(desc(depth)) %>%
  mutate(rank = 1:nrow(.)) %>%
  dplyr::select(rank, depth) %>%
  add_row(rank = max(.$rank), depth = 1500, .before = 1)
rawdata <- left_join(rawdata, floordata)
data <- rawdata %>%
  select(-1, -rank)

set.seed(123)
subdata <- rawdata %>%
  group_by(species) %>%
  sample_frac(size = 0.1)
  

# Build Functions
bargraph_sharks <- function(colour1 = "darkorange", colour2 = "purple", colour3 = "olivedrab3", colour4 = "firebrick3")
{
  bargraph1 <<- ggplot(data) +
    geom_bar(aes(x = species, fill = species), col = "black") +
    scale_fill_manual(values = c(colour1, colour2, colour3, colour4)) +
    theme_bw(12) + ylab("Count") + xlab("") +
    theme(legend.position = "none")
  return(bargraph1)
}

draw_ocean <- function()
{
  ocean <<- ggplot(floordata) +
    geom_rect(xmax = 150, xmin = -max(floordata$rank), ymin = -500, ymax = 0, fill = "deepskyblue2") +
    geom_rect(xmax = 150, xmin = -max(floordata$rank), ymin = -1000, ymax = -500, fill = "deepskyblue3") +
    geom_rect(xmax = 150, xmin = -max(floordata$rank), ymin = -1500, ymax = -1000, fill = "deepskyblue4") +
    geom_hline(yintercept = 0, linetype = "dashed") +
    ylab("Depth") + xlab("") +
    geom_polygon(aes(y = -depth, x = -rank), col = 'black', fill = 'burlywood4') +
    theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
    theme_bw(13)
  return(ocean)
}

add_sharks<-function()
{
  plot1 <<- ocean + 
    geom_point(aes(y = jitter(-depth) + 40, 
                   x = -rank + 100, fill = species), 
               col = 'black', shape = 21, size = 5, data = subdata) +
    facet_wrap(~species) +
    scale_fill_manual(values=c("darkorange","purple", "olivedrab3", "firebrick3"), guide = FALSE)
  return(plot1)
}

mycols <- data.frame(species = c("Spiny Dogfish","Deep Water Catshark",
                                 "Greenland Shark", "Barndoor Skate"),
                     colour = c("olivedrab3","darkorange","purple","firebrick3"))

by_season<-function(Species)
{
  plot2<<-ocean + geom_point(aes(y = jitter(-depth) + 40,
                                 x = -rank + 100), fill = mycols$colour[mycols$species == Species],
                             col = 'black', shape = 21, size = 5,
                             data = subdata %>% filter(species == Species)) +
    facet_wrap(~season) + ggtitle(Species) +
    theme(legend.position = "none")
  return(plot2)
}
