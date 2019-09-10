###############################################################################
## setup                                                                     ##
###############################################################################

## preliminaries   ############################################################

suppressPackageStartupMessages(library(dplyr))
library(lubridate)

## prepare empty data frame

data <- tibble(id = 1:16,
               date = NA,
               allw = NA, 
               zigg = NA, 
               drnk = NA)

data %>% 
  mutate(date = ymd(20190910) + id - 1) %>% 
  mutate(allw = 17-id) %>% 
  mutate(dan = wday(date, label = TRUE, locale = "en_GB.utf8")) -> data

## save

saveRDS(data, "data/data.rds")



