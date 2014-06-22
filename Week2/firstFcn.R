add2 <- function(x,y) {
        x + y ## by default r will return the value of the last expression in fcn
}

above10 <- function(x) { 
        use <- x > 10
        x[use]
}

above <- function(x, n = 10){
        use <- x > n
        x[use]
}

make.power <- function(n){
        pow <- function(x){
                x^n
        }
        pow
}

columnmean <- function(y, removeNA = TRUE){
        nc <- ncol(y)
        means <- numeric(nc)z
        for(i in 1:nc){
                means[i] <- mean(y[, i],na.rm = removeNA)
        }
        means
}
