
#needs to be copy and pasted 
#running script still leaves the function definition undefined
myfunction <- function() {
  x <- rnorm(100)
  mean(x)
}

second <- function(x) {
  x + rnorm(length(x))  
}