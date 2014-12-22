## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {  ## set x to be a matrix you given
        i <- NULL ## set the original inverse matrix to be NULL
        set <- function(y) { # takes an input matrix
                x <<- y  # saves the input matrix
                i <<- NULL  # resets the solve(inverse matrix) to NULL, basically what happens when a new object is generated.
        }
        get <- function() x ## return the value of original matrix
        setsolve <- function(solve) i <<- solve ## called by cachesolve() during the first cachsolve()
        getsolve <- function() i  ##this will return the cached value to cachesolve()
        list(set = set, get = get, ## accessed each time makeCacheMatrix() is called,
             setsolve = setsolve,
             getsolve = getsolve)
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
 i <- x$getsolve()   # accesses the object 'x' and gets the value of the solve (inverse matrix)
        if(!is.null(i)) { ### if solve(inverse matrix)  was already cached (not NULL)
                message("getting cached data") # ... send this message to the console
                return(i)   # ... and return the solve(inverse matrix) ... "return" ends 
        }
        data <- x$get() # we reach this code only if x$getsolve() returned NULL
        i <- solve(data, ...) # if m was NULL then we have to calculate the solve(inverse matrix)
        x$setsolve(i) # store the calculated inverse matrix value in x (see setmean() in makeCacheMatrix
        i  # return the solve(inverse matrix) to the code that called this function
}
