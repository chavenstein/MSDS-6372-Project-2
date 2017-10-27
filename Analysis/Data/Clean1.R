###############################################
## Clean1.R
## Sarah Fite and Chris Havenstein
## Created 10/27/2017
## 
###############################################

## Now we need to ensure that the output of 
## Gather 1, "spotprices.csv" is clean enough
## to merge with other datasets.

## First, ensure that you are in the Analysis folder.
## getwd()

## Then, read in spotprices.csv.

filepath2 <- "/Data/spotprices.csv"
path <- c(getwd(),filepath2)
path <- paste(path, collapse = "")

spotprices <- read.csv(path, header = TRUE, sep = ",", stringsAsFactors = FALSE)

# upon running head(spotprices), it is clear there is an unneccessary first column.

# remove the first column
spotprices <- spotprices[,-1]

# rename the variables
colnames(spotprices) <- c("Date", "WTISpotPriceBBL", "BrentSpotPriceBBL")

# There are some missing values, but those can be sorted out during the merging process.

# Write the clean file.
# preserve Analysis folder path
oldwd <- getwd()

filepath2 <- "/Data/"
path <- c(getwd(),filepath2)
path <- paste(path, collapse = "")

#setwd to Data folder temporarily
setwd(path)

#write the spotprices.csv file into the Data folder
write.csv(spotprices, file = "CleanSpotPrices.csv")

#setwd back to Analysis folder 
setwd(oldwd)
