corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
	#Import Complete.R and get the cases above threshold
	source("complete.R")
  	compCase <- complete(directory)
  	caseAboveThres <- compCase[compCase$nobs > threshold,1]
	allFile <- list.files(path = directory, full.names = TRUE)
  	corr <- rep(NA,length(caseAboveThres))
	
	for (i in caseAboveThres) {
    		
		#Get data for all the Above Threshold Cases
		fileData <- (read.csv(allFile[i]))
		compCaseThres <- complete.cases(fileData)

		#Get sulfate value 
    		sulfateData <- fileData[compCaseThres, 2]
    		
		#Get nitrate value
		nitrateData <- fileData[compCaseThres, 3]

		#Compute Correlation
    		corr[i] <- cor(x = sulfateData, y = nitrateData)
    		
	}
  	
	corr <- corr[complete.cases(corr)]

}