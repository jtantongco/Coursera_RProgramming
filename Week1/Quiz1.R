data <- read.csv("hw1_data.csv")

##11
names(data)

##12 
data[1:2,] ## all 6 columns and only the first two rows

##13
nrow(data) ## # of rows

##14
temp <- nrow(data)
lesstemp <- temp-1
data[lesstemp:temp,]

##15
data[47,]

##16 method 1
ozoneData <- data[,1]
ozoneData[is.na(ozoneData)] <- 1000000 ##assuming no confounding 1000000
table(ozoneData) ## read the count of 1000000

##16 method 2 <- semantically better and no confounding weakness
ozoneData <- data[,1]
bad <- is.na(ozoneData) 
table(bad) ## read the count of true 

##17 cont from 16
processedOzoneData <- ozoneData[!bad] 
mean(processedOzoneData)

##18
tempData <- data[,4]
goodTemp <- tempData > 90
goodOzone <- ozoneData > 31
goodOzone[is.na(goodOzone)] <- FALSE
goodConditions <- goodTemp & goodOzone
solarRData <- data[,2]
processedSolarRData <- solarRData[goodConditions]
mean(solarRData)

##19
monthData <- data[,5]
goodMonth19 <- monthData == 6
processedTempData <- tempData[goodMonth19]
mean(processedTempData)

##20
goodMonth20 <- monthData == 5
good <- !bad
processedOzoneData20 <- ozoneData[goodMonth20 & good]