###############################################
## Clean3.R
## Sarah Fite and Chris Havenstein
## Created 10/27/2017
## 
###############################################

## Now we need to ensure that the output of 
## Gather 3, "RigCountByTrajectory.csv" is clean enough
## to merge with other datasets.

## First, ensure that you are in the Analysis folder.
## getwd()

## Then, read in RigCountByTrajectory.csv.

filepath2 <- "/Data/RigCountByTrajectory.csv"
path <- c(getwd(),filepath2)
path <- paste(path, collapse = "")

RigCountByTrajectory <- read.csv(path, header = TRUE, sep = ",", stringsAsFactors = FALSE)

# upon running head(RigCountByTrajectory), it is clear there is an unneccessary first column.

# remove the first column
RigCountByTrajectory <- RigCountByTrajectory[,-1]

# rename the variables
colnames(RigCountByTrajectory) <- c("Date", "DirRigCount", "HorzRigCount", "VertRigCount", "TotalRigCount", "PerDirRig", "PercHorzRig", "PercVertRig")

# By running a summary(RigCountByTrajectory), the data looks pretty clean.

# Write the clean file.
# preserve Analysis folder path
oldwd <- getwd()

filepath2 <- "/Data/"
path <- c(getwd(),filepath2)
path <- paste(path, collapse = "")

#setwd to Data folder temporarily
setwd(path)

#write the spotprices.csv file into the Data folder
write.csv(RigCountByTrajectory, file = "CleanRigCountByTrajectory.csv")

#setwd back to Analysis folder 
setwd(oldwd)