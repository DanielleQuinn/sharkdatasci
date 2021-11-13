# ---- Prepare Our Workspace ----
source("setup.R")

# ---- How many sharks did we catch in total? ----


# ---- How many of each species did we catch? ----


## Visualize this data (shortcut code!)


## Visualize this data (all of the code!)
count(data, species) %>%
    ggplot() +
         geom_bar(aes(x = species, y = n, fill = species), col = "black", stat = "identity") +
         scale_fill_manual(values = c("darkorange", "purple", "olivedrab3", "firebrick3")) +
         theme_bw(12) +
         ylab("Number Caught") +
         xlab("Species") +
         theme(legend.position = "none")

# ---- What depths do these species live? ----
## 1. Draw the Ocean Floor

## 2. Add the Shark Data

## 3. Visualize the Movement of a Species By Season

# ---- Extras ----

# ---- How many sharks did we catch each year? ----

## Visualize this data
count(data, year) %>%
        ggplot(aes(x = year, y = n)) +
        geom_point() +
        geom_line() +
        theme_bw() +
        labs(x = "Year", y = "Number Caught")

# ---- How many Barndoor Skate did we catch in 2010? ----
data %>%
        filter(year == 2010) %>%
        filter(species == "Barndoor Skate") %>%
        count()

# ---- How many Greenland Shark did we catch in 2015? ----

# ---- Between 2010 and 2015, how many Spiny Dogfish did we catch?
data %>%
        filter(between(year, 2010, 2015)) %>%
        filter(species == "Spiny Dogfish") %>%
        count(year)

## Visualize this data
data %>%
        filter(between(year, 2010, 2015)) %>%
        filter(species == "Spiny Dogfish") %>%
        count(year) %>%
        ggplot(aes(x = year, y = n)) +
        geom_point() +
        geom_line() +
        theme_bw() +
        labs(x = "Year", y = "Number Caught")
