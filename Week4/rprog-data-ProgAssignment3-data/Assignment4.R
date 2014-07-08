outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
ncol(outcome) #46
nrow(outcome) #4706

names(outcome) #for column names

outcome[,11] <- as.numeric(outcome[,11])#strip out heart attack error
#ignore NAs warning message
hist(outcome[,11])#make a histogram

#note: since colClasses = "character" when read
#must coerce back into numerics
