---
title: "README.md"
author: "Sarah Fite and Chris Havenstein"
date: "October 27, 2017"
output: html_document
---

# Introduction:

## MSDS 6372 - Project 2

### Goal: 

By using three data sources create two combined data sets to analyze if the crude oil spot prices of West Texas Intermediate Oil (WTI) and the crude oil spot prices of European Brent Oil (Brent) are related over time to #1 the count of US oil and gas drill rigs and #2 the count of US directional, horizontal, and vertical drill rigs.

Please note, while the main analysis of the data will be in SAS, we wanted to make sure the process of cleaning and combining the data was reproducible.

### The Data Sources:

1. Baker Hughes - US oil and gas drilling rig count data.  
    + **[link](http://phx.corporate-ir.net/phoenix.zhtml?c=79687&p=irol-reportsother).**
    + The data is in the "US Oil & Gas Split" worksheet.
    + We had to save the original .xlsb file as a .xls file for our MakeFile to work.
    
2. Baker Hughes - US drill rig trajectory count data. 
    + **[link](http://phx.corporate-ir.net/phoenix.zhtml?c=79687&p=irol-reportsother).**
    + The data is in the "US Count by Trajectory" worksheet.
    + We had to save the original .xlsb file as a .xls file for our MakeFile to work.

3. EIA.gov - Spot Prices for Crude Oil and Petroleum Products
    + **[link](https://www.eia.gov/dnav/pet/xls/PET_PRI_SPT_S1_D.xls).**
    + The data is in the "Data 1" worksheet for Crude Oil prices
    
    
### Process: 

1. The data was read in the "Baker Hughes" and "EIA Spot Price" data sets, it was determined that some cleaning was required. 

    + Note: This process of reading in the data and cleaning it was performed in the R script files **"Gather1.R"**, **"Gather2.R"**, **"Gather3.R"**, **"Clean1.R"**, **"Clean2.R"**, and **"Clean3.R"**. These files can be found within the "Analysis/" folder. 


2. Using the output of the Gather R scripts, we cleaned **"OilGasRigsSplit.csv"**, **"RigCountByTrajectory.csv"**, **"spotprices.csv"** with **"Clean1.R"**, **"Clean2.R"**, and **"Clean3.R"**.

    + Mostly this was just removing rows and making sure dates looked correct and removing extra leading rows.
    + The output was **"CleanSpotPrices.csv"**, **"CleanOilGasRigsSplit.csv"**, and **"CleanRigCountByTrajectory.csv"**.


3. We merged the three data sets into two datasets.
    + 1. **"MergeData1.csv"** -- merged  **"CleanSpotPrices.csv"** and **"CleanOilGasRigsSplit.csv"**
    + 2. **"MergeData2.csv"** -- merged  **"CleanSpotPrices.csv"** and **"CleanRigCountByTrajectory.csv"**
    
    
4. Then, the MakeFile runs this whole process in the same order.
    + **NOTE:** There are **two prerequisite steps** for the MakeFile to work. **First**, the user's working directory needs to be set to the analysis folder for the project. Then **last**, the Baker Hughes file is an .xlsb file. For R to access the file and its worksheets, the user must first download this file into their ~/MSDS 6372 - Project 2/Analysis/Data folder and then save it as an .xls (97-2003 Excel workbook) file.

### The Analysis:

* An analysis was performed on **"MergeData1.csv"** and **"MergeData2.csv"**, but it was done outside of this github Repo - using SAS. A summary of the output **"MergeData1.csv"** and **"MergeData2.csv"** files is provided in **"Analysis.Rmd"**. We provide a link to it below. **"Analysis.Rmd"** located in ./MSDS 6372 - Project 2/Analysis/ folder. 

    + The analysis in **"Analysis.Rmd"** sources **"Makefile.R"**, which in turn sources, in order: **"Gather1.R"**, **"Gather2.R"**, **"Gather3.R"**, **"Clean1.R"**, **"Clean2.R"**, **"Clean3.R"**, **"MergeData1.R"**, and then last, **"MergeData2.R".**
    
    + **Please navigate to the ./CaseStudy1/Analysis/ folder to view the analysis. Or, use this [link](https://github.com/chavenstein/MSDS-6372-Project-2/blob/master/MSDS-6372-Project-2/Analysis/Analysis.md).** 
    + If you are viewing the analysis in GitHub, please specifically navigate to the file **"Analysis.md"** in the ~/MSDS-6372-Project-2/Analysis/ folder. **This will allow you to view the summary output R code snippets in GitHub.**


