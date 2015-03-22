# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. The
# following code is used to cache the inverse of a matrix using the solve function.

# Creates a special "matrix", which is really a list containing a function to:
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the inverse of the matrix
# 4. get the inverse of the matrix (which would be cached)
makeCacheMatrix <- function(x = matrix()) {
  matrix <- NULL
  set <- function(y) {
    x <<- y
    matrix <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) matrix <<- solve
  getsolve <- function() matrix
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}

# Return a matrix that is the inverse of 'x' (which is assumed to be invertible).
# It first checks if the inverse of a matrix is already cached in our current
# enviornment. If so, it returns the cached result and skips computation.
# If not, it computes the inverse and caches the result.
cacheSolve <- function(x, ...) {
  matrix <- x$getsolve()
  if(!is.null(matrix)) {
    message("getting cached matrix...")
    return(matrix)
  }
  data <- x$get()
  matrix <- solve(data)
  x$setsolve(matrix)
  matrix
}
