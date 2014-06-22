complete <- function(directory, id = 1:332) {
    makeFilepath <- function(directory, id_num){
        if(id_num < 10){
            filepath <- paste(directory, "/00", id_num, '.csv', sep="")
        } else if (i < 100){
            filepath <- paste(directory, "/0", id_num, '.csv', sep="")
        } else {
            filepath <- paste(directory, "/", id_num, '.csv', sep="")
        }
        filepath
    }
    
    id_list = numeric()
    row_count = numeric()
    
    for(i in id) {
        filepath <- makeFilepath(directory, i)
        data <- read.csv(filepath)
        
        sulfateData <- data[,2]
        nitrateData <- data[,3]
        
        good <- complete.cases(sulfateData, nitrateData)
        ##works if there are no nas
        ##note might want to consider: sum(good, na.rm = TRUE)
        ##shouldn't be necessary 
        ##since complete.cases checks for NAs
        id_list = c(id_list, i)
        row_count = c(row_count, sum(good))
    }
    complete <- data.frame(id=id_list,nobs=row_count)
    complete
}