###############################################
## MakeFile.R
## Sarah Fite and Chris Havenstein
## Created 10/27/2017
## 
###############################################

## This file will source each of our files sequentially. 
## For this file to work, set your working directory 
## to your "~/Analysis/" folder. 


## First Source Gather1.R, Gather2.R, and Gather3.R.

## Gather1.R
##
## Will download the EIA spotprice data directly
## then write a file called "spotprices.csv".

## NOTE:
## 1. the "XLConnect" package must be installed
## by the user before running this make file. This
## XLConnect package is necessary to read data from 
## excel worksheets using rJava.


filepath3 <- "/Data/Gather1.R"
path <- c(getwd(),filepath3)
path <- paste(path, collapse = "")

##sources Gather1.R
source(path)

## Gather2.R
##
## This file will read the BakerHughes.xls file.

## NOTE: 
## 1. The user can use the commented out code to
## to download the BakerHughes.xlsb file directly.
## However, xlsb files are not able to be read by 
## The "xlsx" or "XLConnect" R package. 
##
## 2. the "XLConnect" package must be installed
## by the user before running this make file. This
## XLConnect package is necessary to read data from 
## excel worksheets using rJava.
##
## 3. Assuming at this point you have opened the file 
## "BakerHughes file and saved it as an .xls file, 
## run the following below.

filepath3 <- "/Data/Gather2.R"
path <- c(getwd(),filepath3)
path <- paste(path, collapse = "")

##sources Gather2.R
source(path)


## Gather3.R
##
## This file will read the BakerHughes.xls file.

## NOTE: 
## 1. The user can use the commented out code to
## to download the BakerHughes.xlsb file directly.
## However, xlsb files are not able to be read by 
## The "xlsx" or "XLConnect" R package. 
##
## 2. the "XLConnect" package must be installed
## by the user before running this make file. This
## XLConnect package is necessary to read data from 
## excel worksheets using rJava.
##
## 3. Assuming at this point you have opened the file 
## "BakerHughes file and saved it as an .xls file, 
## run the following below.

filepath3 <- "/Data/Gather3.R"
path <- c(getwd(),filepath3)
path <- paste(path, collapse = "")

##sources Gather3.R
source(path)


## Next, run the "Clean1.R", "Clean2.R", and "Clean3.R" 
## files to clean the data.
## The output will be:
## 1. "CleanSpotPrices.csv"
## 2. "CleanOilGasRigsSplit.csv"
## 3. "CleanRigCountByTrajectory.csv"


filevector <- c("Clean1.R","Clean2.R","Clean3.R")

sourceVector <- c("")
myFunc <- function(x) {
  filepath3 <- "/Data/"
  path <- c(getwd(),filepath3,x)
  path <- paste(path, collapse = "")
  sourceVector <- c(sourceVector,path)
}

myMatrix <- sapply(filevector, myFunc)
myVector <- as.vector(myMatrix[2,])

sapply(myVector, source)



## Now run the "Merge1.R" and "Merge2.R" scripts
## to merge the data
## The output will be:
## 1. "MergeData1.csv" -- merged  "CleanSpotPrices.csv" and "CleanOilGasRigsSplit.csv"
## 2. "MergeData2.csv" -- merged  "CleanSpotPrices.csv" and "CleanRigCountByTrajectory.csv"


filevector <- c("Merge1.R","Merge2.R")

sourceVector <- c("")
myFunc <- function(x) {
  filepath3 <- "/Data/"
  path <- c(getwd(),filepath3,x)
  path <- paste(path, collapse = "")
  sourceVector <- c(sourceVector,path)
}

myMatrix <- sapply(filevector, myFunc)
myVector <- as.vector(myMatrix[2,])

sapply(myVector, source)



