# Load Packages
library(tidyverse)

# Data Import / Modification
data <- read.csv("sharkdata.csv")
floordata <- data %>%
  arrange(desc(depth)) %>%
  mutate(rank = 1:nrow(.)) %>%
  dplyr::select(rank, depth) %>%
  add_row(rank = max(.$rank), depth = 1500, .before = 1)
data <- left_join(data, floordata)
shark_data <- data %>% select(-1, -rank)

# Function Creation