"Matrix inversion is usually a costly computation and there may be 
some benefit to caching the inverse of a matrix rather than compute 
it repeatedly (there are also alternatives to matrix inversion that 
we will not discuss here). Your assignment is to write a pair of 
functions that cache the inverse of a matrix."


"makeCacheMatrix: This function creates a special 'matrix' object that
can cache its inverse."

makeCacheMatrix <- function(x=matrix()){
	
	matcache<-NULL
	
	set <- function(y){
		x <<- y
		matcache <<- NULL
	} 
	get <- function() x
	setinverse <- function(inverse) matcache<<-inverse
	getinverse <- function() matcache
	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}

"cacheSolve: This function computes the inverse of the special 'matrix' 
returned by makeCacheMatrix above. If the inverse has already been 
calculated (and the matrix has not changed), then the cachesolve should 
retrieve the inverse from the cache."

cacheSolve <- function(x, ...) {
        
        matcache <- x$getinverse()
        if(!is.null(matcache)) {
                message("getting cached data")
                return(matcache)
        }
        data <- x$get()
        matcache <- solve(data, ...)
        x$setinverse(matcache)
        matcache
}




