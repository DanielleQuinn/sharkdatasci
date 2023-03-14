# Packages ----
# Packages are user-created collections of objects,
# functions, and datasets that
# can be installed to RStudio and used to 
# accomplish common tasks

# The {tidyverse} is a collection of packages that 
# share an
# underlying design philosophy, grammar, and data 
# structures and
# work with "tidy data", which follows specific 
# rules and best practices

# {dplyr}: data manipulation
# {ggplot2}: visualizing data
# {tidyr}: tidying data
# {lubridate}: working with dates and times
# {broom}: tidying output from models
# {stringr}: working with strings
# {forcats}: working with factors
# {purrr}: functional programming
# {rvest}: web scraping

# https://www.tidyverse.org/packages/

# DO THIS ONCE
#install.packages("dplyr")
#install.packages("FSAdata")

# - Load Packages ----
# dplyr and FSAdata
library(dplyr)
library(FSAdata)

# Access Pre-Built Data from Package ----
# data set in FSAdata called WalleyeErie2


# Examine Data


# Subsetting Data with {dplyr} ----
# - select() ----
# select() : selects columns from a data frame and outputs as a data frame
# Goal: Output the column called year


# Goal: Output the columns called year and tl


# Goal: Convert the data frame to a tibble for easier viewing


## Goal: Output the columns called mat, age, and sex from
## (a) the fish data frame

## (b) the fish_tb tibble


# - filter() ----
# filter() : filters rows from a data frame
# Example: Output the rows that correspond to fish caught prior to 2010


# Goal: Output the rows that correspond to male fish


## What is the output from the following line of code?
filter(fish_tb,
       year %in% 2005:2008,
       age > 15)

## Output the rows of:
## immature female fish
## caught in 2004, 2006, or 2009
## anywhere except location 3
## that are larger than 700 mm


# Creating Workflows ----
# Information is put into a "pipe"
# It comes out the other side and is used
# as the first argument for the function that awaits

# Goal: Find the square root of 81


# Goal: Output the column called year


# This can also be written as


# Pipes are valuable when we want to perform multiple steps

# Goal: Find the square root of the absolute value of -16
# Nesting functions:

# Using pipes:


# Goal: Considering only fish caught prior to 2010,
# ouput the columns called year, mat, and tl


## Can you explain why this gives the same output?
fish_tb %>%
  select(year, mat, tl) %>%
  filter(year < 2010)

## What would happen if you tried to run this?
fish_tb %>%
  select(mat, tl) %>%
  filter(year < 2010)

## Choose any location (loc).
## Output the weight (w), total length (tl),
## and age of fish caught in that location


## Output the grid id (grid), year and tl of instances
## where male fish smaller than 250 mm were captured


# Modifying Data with {dplyr} ----
# - mutate() ----
# mutate() : creates a column or modifies an existing column

# Use case #1: Creating a new column

# Goal: Create a new column called user that contains your name


# To make the change permanent, you need to overwrite the
# original object


# Use case #2: Creating a new column based on calculations from an existing column

# Goal: Convert tl from mm to cm (divide by 10)


## Goal: Create column of condition factor (weight / total length in cm)


# Use case #3: Creating a new column based on logic statements about an existing column

# Goal: Create a TRUE/FALSE column called lunker
# that describes if a fish is greater than 70 cm


# Look at lunker-sized fish


## Goal: Create a column called age_type that is "Old" if the fish is more than
## 10 years old and "Young" if it is not


# case_when()  : a special helper function for mutate that
# allows you to apply rule sets when creating new columns
## Goal: Create a column called age_class that is:
# 0 if the fish age is 0
# 1 if the fish age is 1-5
# 2 if the fish age is 6-10
# 3 if the fish age is 11-17
# 4 if the fish age is anything else

# Look at unique sets of age and age_class to make sure it worked


# Exploratory Data Analysis with {dplyr} ----
# - group_by() ----
# group_by() : splits your data into groups based on the variables you specify
# Goal: Group by location


# - summarise() ----
# summarise() : returns a single value based on the instructions you give it

# Goal: Find the maximum age


## Goal: Find the minimum year a fish was caught


# - group_by() & summarise () ----
# Goal: Use group_by() and summarise() together to find the
# total age (w) of fish, by location (loc)


# This can be stored as a data frame object


# The column names can be specified in summarise


# Goal: What is the average total length (tl) and
# weight (w), by location?


## Why can't we find average weight?
## How can we tell R to ignore the NAs when calculating the average weight?


## Goal: What is the age of the oldest and 
## the condition of the skinniest fish
## by location?


# - Other summarise() functions ----
# -- n() ----
# n() : counts occurences in each group using summarise()

# Goal: How many fish in each location?


# Goal: How many fish in each location, by age_class?


## Goal: How many males were captured each year?


# -- n_distinct() ----
# n_distinct() : counts unique occurences of a variable in each group using summarise()

# Goal: How many different age_classes were captured each year?


# Goal: How many different age_classes were captured each year, and
# what was the minimum and maximum age_class each year?


# Exercise ----
# Choose five years. (extra difficulty: five non-sequential years)
# Generate a table using a {dplyr} workflow that describes, for each year:
# (a) the number of fish caught
# (b) the number of unique grid cells sampled
# (c) the smallest fish (tl_cm)
# (d) the average condition
# (e) the total weight (w)
# (f) extra challenge: how many young fish it had (age_type is "Young")
##### hint: think about characteristics of data classes
