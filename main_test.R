## R Programming - Programming Assignment 2
## Short script to test the functions in
## cachematrix.R
# @author: Corentin Friedrich
# Date: 2015/08/07 

# It is better to run this script using RScript or line 
# by line in the console in RStudio, to be able to visualize
# the output of "system.time"

source("cachematrix.R")

mat <- matrix(rnorm(4e6),2e3,2e3) # Create a random matrix (invertible)
cachemat <- makeCacheMatrix(mat)     # Create the cache matrix

# First computation of the inverse (around ten seconds)
print("First computation of the inverse")
system.time(invm <- cacheSolve(cachemat))

# Second computation of the inverse (already cached) (around few milliseconds)
print("Second computation of the inverse (already cached)")
system.time(invm2 <- cacheSolve(cachemat))

## Naive check if the two inverse matrices are equal (sums are compared)
sum(invm)
sum(invm2)