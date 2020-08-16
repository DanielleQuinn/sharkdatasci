## Prepare Our Workspace ##
source("setup.R")

## How many sharks did we catch in total?

## How many sharks did we catch each year?

#### Visualize this data
count(data, year) %>%
     ggplot() +
     geom_bar(aes(x = year, y = n)) +
     theme_bw() +
     labs(x = "Year", y = "Number Caught")

## How many of each species did we catch?

#### Visualize this data
count(data, species) %>%
     ggplot() +
     geom_bar(aes(x = species, y = n)) +
     theme_bw() +
     labs(x = "Species", y = "Number Caught")

## How many of each species did we catch each year?

#### Visualize this data
count(data, year, species) %>%
     ggplot() +
     geom_bar(aes(x = year, y = n)) +
     theme_bw() +
     labs(x = "Year", y = "Number Caught") +
     facet_wrap(~year)

## What depths do these species live?
### 1. Draw the Ocean Floor


### 2. Add the Shark Data


### 3. Visualize the Movement of a Species By Season
