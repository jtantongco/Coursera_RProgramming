corr <- function(directory, threshold = 0){
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
    
    count <- 0
    corr <- numeric()
    
    for(i in 1:332) {
        filepath <- makeFilepath(directory, i)
        data <- read.csv(filepath)
        
        good <- complete.cases(data)
        
        if(sum(good) >= threshold){
            sulfateData <- data[,2][good]
            nitrateData <- data[,3][good]
            corr <- c(corr,cor(sulfateData, nitrateData))
        } else {
            next
        }
    }
    corr
}