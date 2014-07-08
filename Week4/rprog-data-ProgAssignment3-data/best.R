    #hospital name is row 2
    #state is row 7
    #heart attack is row 11
    #heart failure is row 17
    #pneumonia is row 23
    best <- function(state, outcome){
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
        #print(rawRelevant$Hospital)
        #print(rawRelevant$Rate)
        data <- rawRelevant[order(rawRelevant$Rate,rawRelevant$Hospital),]
        data[1,]$Hospital
    }