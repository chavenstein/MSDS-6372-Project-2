###############################################
## Merge1.R
## Sarah Fite and Chris Havenstein
## Created 10/27/2017
## 
###############################################

## This script will merge "CleanSpotPrices.csv" with
## "CleanOilGasRigsSplit.csv"

## First, ensure that you are in the Analysis folder.
## getwd()

## Then, read in CleanSpotPrices.csv.

filepath2 <- "/Data/CleanSpotPrices.csv"
path <- c(getwd(),filepath2)
path <- paste(path, collapse = "")

CleanSpotPrices <- read.csv(path, header = TRUE, sep = ",", stringsAsFactors = FALSE)

## Then, read in CleanOilGasRigsSplit.csv.

filepath2 <- "/Data/CleanOilGasRigsSplit.csv"
path <- c(getwd(),filepath2)
path <- paste(path, collapse = "")

CleanOilGasRigsSplit <- read.csv(path, header = TRUE, sep = ",", stringsAsFactors = FALSE)

## There is one extra column on each dataframe, remove them.
CleanSpotPrices <- CleanSpotPrices[,-1]
CleanOilGasRigsSplit <- CleanOilGasRigsSplit[,-1]

## Merge files together on Date
MergeData1 <- merge(CleanSpotPrices,CleanOilGasRigsSplit,by="Date")

## After running summary(MergeData1), there are:
## 6 NA values for WTISpotPriceBBL
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
write.csv(MergeData1, file = "MergeData1.csv")

#setwd back to Analysis folder 
setwd(oldwd)

