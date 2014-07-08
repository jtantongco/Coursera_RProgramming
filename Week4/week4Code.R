#elapsed > user time
system.time(readLines("http://www.jhsph.edu"))

#user > elapsed time -> theoretically if computer could take advantage
# not on my computer though
hilbert <- function(n){
    i <- 1:n
    1 / outer(i-1,i,"+")
}

#just nest the code you want to run
system.time({
    n <- 1000
    r <- numeric(n)
    for(i in 1:n){
        x <- rnorm(n)
        r[i] <- mean(x)
    }
})

#profiler for R to figure out how to use time.
#DO NOT USE Rprof and system.time at the same time
#summaryRprof() for human readable
#Rprof is awkward when raw output
#Not useful if code is cast but then you dont need to be using it...
#
library(datasets)
Rprof()
#fit <- lm(y ~ x1 + x2) --- Whatever code in here
Rprof(NULL)
summaryRprof()


