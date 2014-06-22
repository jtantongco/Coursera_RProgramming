pollutantmean <- function(directory, pollutant, id = 1:332) {
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
    
    if(pollutant == "sulfate"){
        colNum <- 2 
    } else {
        colNum <- 3
    }
    
    totalSum <- 0
    totalCount <- 0
    
    for(i in id) {
        filepath <- makeFilepath(directory, i)
        
        ##print(filepath)
        
        data <- read.csv(filepath)
        
        ##dateData <- data[,1]
        ##idData <- data[,4]
        
        pollutantData <- data[,colNum]
        bad <- is.na(pollutantData)
        processedPollutantData <- pollutantData[!bad]
        
        ##print(mean(processedPollutantData))
        ##print(sum(processedPollutantData))
        ##print(length(processedPollutantData))
        
        totalSum <-  totalSum + sum(processedPollutantData)
        totalCount <- totalCount + length(processedPollutantData)
    }
    pollutantMean <- totalSum / totalCount
    pollutantMean
}
