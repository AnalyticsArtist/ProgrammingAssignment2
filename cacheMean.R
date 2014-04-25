## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeVector <- function(x = numeric()) {
    m <- NULL
    
    set <- function(y) {
    x <<- y
    m <<- NULL
    }
    
    get <- function() x
    setmean <- function(mean) m <<- mean
    getmean <- function() m
    
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}


## Write a short comment describing this function

cacheMean <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getmean()
    
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m
}

print("Creating Vector:")
iniVec <- rnorm(n=5E8, mean=300, sd=4)

print("Calculating Mean:")
iniVec.system.time <- system.time(mean(iniVec))
mean(iniVec)

print("Time to Calculate Mean:")
iniVec.system.time



print("Creating Cashed Vector:")
cchVec <- makeVector(iniVec)

print("Calculating Mean for 1st Time:")
cchVec.system.time <- system.time(cacheMean(x=cchVec))
cacheMean(x=cchVec)
cchVec.system.time

print("Calculating Mean for 2nd Time:")
cacheMean(x=cchVec)
system.time(cacheMean(x=cchVec))
