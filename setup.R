# Load Packages
library(tidyverse)

# Data Import / Modification
rawdata <- read.csv("sharkdata.csv")
floordata <- rawdata %>%
  arrange(desc(depth)) %>%
  mutate(rank = 1:nrow(.)) %>%
  dplyr::select(rank, depth) %>%
  add_row(rank = max(.$rank), depth = 1500, .before = 1)
rawdata <- left_join(rawdata, floordata)
data <- rawdata %>%
  select(-1, -rank) %>%
  mutate(species = factor(species, c("Deep Water Catshark",
                                     "Greenland Shark",
                                     "Spiny Dogfish",
                                     "Barndoor Skate")))


# Build Functions
bargraph_sharks <- function(x = 12)
{
  bargraph1 <<- ggplot(data) +
    geom_bar(aes(x = species, fill = species), col = "black") +
    scale_fill_manual(values = c("darkorange", "purple", "olivedrab3", "firebrick3")) +
    theme_bw(x) + ylab("Count") + xlab("") +
    theme(legend.position = "none")
  return(bargraph1)
}
