###############################################
## Merge2.R
## Sarah Fite and Chris Havenstein
## Created 10/27/2017
## 
###############################################

## This script will merge "CleanSpotPrices.csv" with
## "CleanRigCountTrajectory.csv"

## First, ensure that you are in the Analysis folder.
## getwd()

## Then, read in CleanSpotPrices.csv.

filepath2 <- "/Data/CleanSpotPrices.csv"
path <- c(getwd(),filepath2)
path <- paste(path, collapse = "")

CleanSpotPrices <- read.csv(path, header = TRUE, sep = ",", stringsAsFactors = FALSE)

## Then, read in CleanOilGasRigsSplit.csv.

filepath2 <- "/Data/CleanRigCountByTrajectory.csv"
path <- c(getwd(),filepath2)
path <- paste(path, collapse = "")

CleanRigCountByTrajectory <- read.csv(path, header = TRUE, sep = ",", stringsAsFactors = FALSE)

## There is one extra column on each dataframe, remove them.
CleanSpotPrices <- CleanSpotPrices[,-1]
CleanRigCountByTrajectory <- CleanRigCountByTrajectory[,-1]

## Merge files together on Date
MergeData2 <- merge(CleanSpotPrices,CleanRigCountByTrajectory,by="Date")

## After running summary(MergeData2), there are:
## 7 NA values for WTISpotPriceBBL
## 5 NA values for BrentSpotPriceBBL
## We will investigate if this is a problem later.

# Write the Merged file.
# preserve Analysis folder path
oldwd <- getwd()

filepath2 <- "/Data/"
path <- c(getwd(),filepath2)
path <- paste(path, collapse = "")

#setwd to Data folder temporarily
setwd(path)

#write the spotprices.csv file into the Data folder
write.csv(MergeData2, file = "MergeData2.csv")

#setwd back to Analysis folder 
setwd(oldwd)

