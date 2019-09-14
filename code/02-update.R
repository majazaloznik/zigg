###############################################################################
## update                                                                    ##
###############################################################################
## update new.zigg and new.drnk and source the file. commit to github. 


## preliminaries   ############################################################

data <- readRDS("data/data.rds")
source("code/functions.R")


## update with new data  ######################################################

FunNewLine(data, 
           new.drnk = 0, 
           new.zigg = 10,
           overwrite = NULL) -> data

FunPlot(data)


## save

saveRDS(data, "data/data.rds")

