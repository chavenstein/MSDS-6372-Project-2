###############################################
## Gather1.R
## Sarah Fite and Chris Havenstein
## Created 10/27/2017
## 
###############################################

## The goal is to get the Spot prices data for
## WTI (West Texas Intermediate oil) and for
## Europe Brent so that they can be merged with
## the Baker Huges Rig count datasets for (1st)
## the oil and gas split of drilling rigs and
## (2nd) the drilling rig type (Directional,
## Horizontal, and Vertical).

## First we need to read in the dataset from 
## EIA - U.S. Energy Information Administration

# Download the GDP data from the world bank
URL <- "https://www.eia.gov/dnav/pet/xls/PET_PRI_SPT_S1_D.xls"

filepath <- "/Data/spotprices.xls"

# Assumes the working directory is /Analysis/
path <- c(getwd(),filepath)
path <- paste(path, collapse = "")

# Download the spotprices.xls in its raw form and save it 
# in /Analysis/Data/
download.file(url = URL, destfile = path, mode="wb")

# Use xlsx package to read a worksheet from the file
# Run install.packages("xlsx") if not installed yet
# If when running library you have an error and 'rJava'
# couldn't be loaded, make sure your architecture version for R
# matches the version of Java. Chris had to get the 64-bit version
# from https://www.java.com/en/download/manual.jsp, which fixed
# the problem.
library(XLConnect)

#create a temporary dataframe of the spotprices data
spotprices <- readWorksheetFromFile(path, sheet = "Data 1", header = TRUE, startRow = 3)

# write the raw spotprice file as a csv for reproducibility
# this csv will be cleaned in Clean1.R 

# Change the working directory temporarily to Data directory,
# then change it back after writing the csv.
oldwd <- getwd()

filepath2 <- "/Data/"
path <- c(getwd(),filepath2)
path <- paste(path, collapse = "")

#setwd to Data folder temporarily
setwd(path)

#write the spotprices.csv file into the Data folder
write.csv(spotprices, file = "spotprices.csv")

#setwd back to Analysis folder 
setwd(oldwd)



