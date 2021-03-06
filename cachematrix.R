## Two functions to fulfill the R Data Scientist Assignment 2

## This function creates a special matrix object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL  ## Value of matrix is now set
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve  ## save the inverse to cache
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

## This function computes the inverse of the special matrix returned by makeCacheMatrix
## above. If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    m <- x$getsolve()
    if(!is.null(m)) {   ## Checks if m has already been cached.
      message("getting cached data")
      return(m)
    }
    data <- x$get()  ## If not in cache then calculate inverse.
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
  
  

