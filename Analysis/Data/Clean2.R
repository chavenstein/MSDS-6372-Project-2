###############################################
## Clean2.R
## Sarah Fite and Chris Havenstein
## Created 10/27/2017
## 
###############################################

## Now we need to ensure that the output of 
## Gather 2, "OilGasRigsSplit.csv" is clean enough
## to merge with other datasets.

## First, ensure that you are in the Analysis folder.
## getwd()

## Then, read in OilGasRigsSplit.csv.

filepath2 <- "/Data/OilGasRigsSplit.csv"
path <- c(getwd(),filepath2)
path <- paste(path, collapse = "")

OilGasRigsSplit <- read.csv(path, header = TRUE, sep = ",", stringsAsFactors = FALSE)

# upon running head(OilGasRigsSplit), it is clear there is an unneccessary first column.

# remove the first column
OilGasRigsSplit <- OilGasRigsSplit[,-1]

# rename the variables
colnames(OilGasRigsSplit) <- c("Date", "OilRigCount", "GasRigCount", "MiscRigCount", "TotalRigCount", "PercOilRig", "PercGasRig")

# By running a summary(OilGasRigsSplit), the data looks pretty clean.

# Write the clean file.
# preserve Analysis folder path
oldwd <- getwd()

filepath2 <- "/Data/"
path <- c(getwd(),filepath2)
path <- paste(path, collapse = "")

#setwd to Data folder temporarily
setwd(path)

#write the spotprices.csv file into the Data folder
write.csv(OilGasRigsSplit, file = "CleanOilGasRigsSplit.csv")

#setwd back to Analysis folder 
setwd(oldwd)