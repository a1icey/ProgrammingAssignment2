

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
	
	minverse <- NULL

## Set the value of the matrix

	setmatrix <- function(y) {
		x <<- y
		minverse <<- NULL
	}

## Get the value of the matrix

	getmatrix <- function() x

## Set the value of the inverse

	setinverse <- function(solve) minverse <<- solve

## Get the value of the inverse

	getinverse <- function() minverse

## Output

	list(setmatrix = setmatrix, getmatrix = getmatrix,
		setinverse = setinverse,
		getinverse = getinverse)
}

## This function retrieves the inverse from makeCacheMatrix or computes the inverse of a matrix.

cacheSolve <- function(x, ...) {

## Retrieve the inverse matrix from makeCacheMatrix

	minverse <- x$getinverse()

## If none is returned, compute the inverse matrix

	if(!is.null(minverse)) {
		message("getting cached data")
		return(minverse)
	}
	m <- x$getmatrix()
	minverse <- solve(m)
	x$setinverse(minverse)

## Output

	minverse
} 
