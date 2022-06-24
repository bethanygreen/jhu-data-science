## This pair of functions will make a cache of a matrix then solve the inverse

## First make a cache of the matrix to be solved

makeCacheMatrix <- function(x = matrix()) {
    
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Then solve the inverse of the cache

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
m <- x$getinverse()
if(!is.null(m)) {
    message("getting cached matrix")
    return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m
}
