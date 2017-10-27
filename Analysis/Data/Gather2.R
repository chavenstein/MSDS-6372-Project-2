###############################################
## Gather2.R
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
## Baker Hughes.The dataset is an .xlsb file
## Please download the file using the code below,
## then save it as an xls (Excel 97-2003 Workbook) file in Excel.

# Download the GDP data from the world bank
#URL <- "http://phx.corporate-ir.net/External.File?item=UGFyZW50SUQ9NjgyNzU0fENoaWxkSUQ9MzkxNTI1fFR5cGU9MQ==&t=1"

#filepath <- "/Data/BakerHughes.xlsb"

# Assumes the working directory is /Analysis/
#path <- c(getwd(),filepath)
#path <- paste(path, collapse = "")

# Download the BakerHughes.xlsb in its raw form and save it 
# in /Analysis/Data/
#download.file(url = URL, destfile = path, mode="wb")

############################################################

# Assuming at this point you have opened the file and saved 
# BakerHughes.xlsb as an .xls file, run the following below.

filepath <- "/Data/BakerHughes.xls"

# Assumes the working directory is /Analysis/
path <- c(getwd(),filepath)
path <- paste(path, collapse = "")

# Use xlsx package to read a worksheet from the file
# Run install.packages("xlsx") if not installed yet
# If when running library you have an error and 'rJava'
# couldn't be loaded, make sure your architecture version for R
# matches the version of Java. Chris had to get the 64-bit version
# from https://www.java.com/en/download/manual.jsp, which fixed
# the problem.
library(XLConnect)

#create a temporary dataframe of the spotprices data
OilGasRigsSplit <- readWorksheetFromFile(path, sheet = "US Oil & Gas Split", header = TRUE, startRow = 7)

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
write.csv(OilGasRigsSplit, file = "OilGasRigsSplit.csv")

#setwd back to Analysis folder 
setwd(oldwd)



