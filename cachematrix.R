## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  mat <- list(matrix = x)
  inverse <- NULL ## *NOT* a part of the object itself, but part of the associated ENVIRONMENT, with a getter/setter
  mat$setInverse <- function(y) {
    inverse <<- y ## set in parent scope which is mat's environment
  }
  mat$getInverse <- function() { return( inverse ) }
  return(mat)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  if ( is.null( x$getInverse() ) ) {
    ## no cached inverse, so get one and store it
    x$setInverse( solve(x$matrix) )
  }
  
  return( x$getInverse() )
}