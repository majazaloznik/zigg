###############################################################################
## functions                                                                 ##
###############################################################################
suppressPackageStartupMessages(library(dplyr))
library(lubridate)

###############################################################################
FunNewLine <- function(data = data, 
                       new.zigg = 0,
                       new.drnk = 0,
                       overwrite = NULL){
  if (is.null(overwrite)) {
    data %>% 
      filter(is.na(zigg)) %>% 
      filter(date == first(date)) %>% 
      select(date, dan) -> current.date} else{
        if (1 > overwrite | overwrite > 16){
          stop("wrong day")}
        data %>% 
          filter(id == overwrite) %>% 
          select(date, dan) -> current.date   
      }
  
  data %>% 
    mutate(drnk = ifelse(date == current.date$date, new.drnk, drnk)) %>% 
    mutate(zigg = ifelse(date == current.date$date, new.zigg, zigg)) -> data
data
}


###############################################################################
FunPlot <- function(df = data) {
  png("figures/chart.png", width = 1000, height = 500)
  par(mar = c(6, 3, 1, 1))
  
  barplot(height = matrix(c(df$zigg, df$drnk), byrow = TRUE,ncol = 16), 
          beside = TRUE, names.arg = df$date, col = c("peachpuff3", "olivedrab3" ), ylim = c(0,16),
          las = 2, border = c("peachpuff3", "olivedrab3" ))
  barplot(height = matrix(c(df$allw, rep(1, 16)), byrow = TRUE, ncol = 16), beside = TRUE,
          add = TRUE, col = NA, border = c("red", NA), axes = FALSE)
  dev.off()
}


