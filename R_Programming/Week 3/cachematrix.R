# Peer-graded assignment
# Lexical scoping

# Cache-matrix script

# makeCacheMatrix function creates a special "matrix" object
# that can cache its inverse

# we use solve function to calculate the inverse of the
# matrix
 
# For this assignment, we assume that the matrix supplied
# is always convertible

makeCacheMatrix <- function(x = matrix()) {
      # set m for the cache to NULL
      inv <- NULL
      # STORE a matrix x in mat and flush the cache
      setMatrix <- function(mat) {
            x <<- mat
            inv <<- NULL
      }
      # GET the stored matrix
      getMatrix <- function() x
      # CACHE INVERSE 
      CacheInverse <- function(solve) inv <<- solve
      # GET INVERSE from cache
      getMatInverse <- function() inv
      # Return a list of the inner functions
      list(setMatrix = setMatrix, getMatrix = getMatrix, CacheInverse = CacheInverse, getMatInverse = getMatInverse)
}


# cacheSolve function computes the inverse of a the special
# "matrix" object returned by makeCacheMatrix function
# If the inverse has already been calculated (and the matrix)
# has not changed) then cacheSolve should retrieve the 
# inverse from the cache

cacheSolve <- function(x, ...) {
      # Return a matrix that is the inverse of 'x'
      # Get the inverse matrix in cache
      # If there is a value in cache, return cache
      if(!is.null(x$getMatInverse())) {
            message("Cache Inverse is available, display from cache:")
            x$getMatInverse()
      } else {
      # get the matrix, calculate the inverse and store in cache
      inv.mat <- solve(x$getMatrix())
      x$CacheInverse(inv.mat)
      
      # Return inversed matrix from cache
      inv.mat
      }
}