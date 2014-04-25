## Program     : Coursera - R Programming Peer Assessment - Matrix Inversion Caching
## Written By  : Gabriel Mohanna
## Date Created: Apr 25, 2014
## Narrative   : These pair of functions enable us to cache matrix inversion, which is a potentially time-consuming 
##               computations. This program consists of two functions:
##                - makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
##                - cacheSolve     : This function computes the inverse of the special "matrix" returned by 
##                                   makeCacheMatrix above. If the inverse has already been calculated (and the matrix has 
##                                   not changed), then the cachesolve should retrieve the inverse from the cache.
##
## TBD         : None.
## 
## \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
## <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Code is Poetry >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
## ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
##
## ***********************************************************************************************************************

## makeCacheMatrix
## This function creates a special "matrix" object that can cache its inverse. Note that once this function is called the
## the first time or if the set function "set" is called it'll set the inverse to NULL.  Hence, if the initial matrix 
## changes in anyway the inverse will be set to NULL. This should satisfy the condition "If the inverse has already been 
## calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache."
makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    
    set <- function(y) {
        if(nrow(y) != ncol(y)) {
            message("Number of rows isn't equal number of columns. The solve function will not work properly.")
        }
        x <<- y
        inverse <<- NULL
    }
    
    get <- function() x
    setinverse <- function(solve) inverse <<- solve
    getinverse <- function() inverse
    
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## cacheSolve
## his function computes the inverse of the special "matrix" returned by  makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
## We know that the matrix hasn't been changed because the inverse will be set to NULL if it does.
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverse <- x$getinverse()
    
    if(!is.null(inverse)) {
        message("Getting cached data")
        return(inverse)
    }
    
    data <- x$get()
    inverse <- solve(data, ...)
    x$setinverse(inverse)
    inverse
}
