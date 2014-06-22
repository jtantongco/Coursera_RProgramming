##Question1 

mean(iris$Sepal.Length[iris$Species == "virginica"])
##equivalently:
tapply(iris$Sepal.Length, iris$Species, mean)

##Question4
with(mtcars, tapply(hp, cyl, mean))