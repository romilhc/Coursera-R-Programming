complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
	#Get files from working directory
	allFile <- list.files(path = directory, full.names = TRUE)

	#Initialize Data Frame
	fileData<-data.frame()
	compCase<-data.frame()
	for(i in id){

		#Compute no. of complete cases
		fileData<-read.csv(allFile[i])
		nobs<-sum(complete.cases(fileData))
		compCase<-rbind(compCase,data.frame(i,nobs))
	}
	
	compCase
}