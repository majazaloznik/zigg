###############################################################################
## update                                                                    ##
###############################################################################
## update new.zigg and new.drnk and source the file. commit to github. 


## preliminaries   ############################################################

data <- readRDS("data/data.rds")
source("code/functions.R")


## update with new data  ######################################################

FunNewLine(data, 
           new.drnk = 3, 
           new.zigg = 12,
           overwrite = NULL) -> data

FunPlot(data)


## save

saveRDS(data, "data/data.rds")
