## R Programming - Programming Assignment 2
## Create functions to cache inverse matrix
# @author: Corentin Friedrich
# Date: 2015/08/07 

## makeCacheMatrix function : create a list with functions
## to cache the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(solve) inv <<- solve
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## cacheSolve function : compute the inverse of a matrix
## only if the result is not already stored in cache. We
## assume that the matrix is invertible.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}


## A simple test to verify the function
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

## EOF
