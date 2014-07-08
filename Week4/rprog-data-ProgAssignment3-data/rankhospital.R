rankhospital <- function(state, outcome, num = "best"){
    colNum <- -1
    
    ##Semi hard coded :(
    if(outcome == "heart attack"){
        colNum <- 11
    } else if(outcome == "heart failure"){
        colNum <- 17
    } else if(outcome == "pneumonia"){
        colNum <- 23
    } else {
        stop("invalid outcome")
    }
    
    raw <-  read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    if(sum(raw$State == state) <= 0){
        stop("invalid state") 
    }
    rawRelevant <- raw[with(raw, raw[,colNum] != "Not Available" & raw[,7] == state),c(2,colNum)]
    rawRelevant[,2] <- as.numeric(rawRelevant[,2])
    names(rawRelevant) <- c("Hospital", "Rate")
    
    data <- rawRelevant[order(rawRelevant$Rate,rawRelevant$Hospital),]
    if(num == "best"){
        num <- 1
    } else if(num == "worst"){
        count <- length(rawRelevant$Hospital)
        num <- count
        #print(data)
        #print(num)
        #What about the case that multiple hospitals tie for worst...
        # may need additional code for alphabetical hospital tie breaking
    } 
    
    data[num,]$Hospital
}