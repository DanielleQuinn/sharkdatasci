library(dplyr)
a <- data.frame(num = 1:10)
b <- a %>% mutate(num2 = num + 100)