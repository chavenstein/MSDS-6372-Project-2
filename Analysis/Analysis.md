Analysis.Rmd
================
Sarah Fite, Chris Havenstein
October 27, 2017

Analysis
========

#### To begin the analysis, please set your working directory to the Analysis folder.

Depending on the directory you cloned the "MSDS 6372 - Project 2" into, the path to the "Analysis" folder should be similar to:

-   ./root/MSDS 6372 - Project 2/Analysis

By modifying "Analysis.Rmd" in the Analysis folder, I set an absolute path to the Analysis folder on my computer.

``` r
setwd("C:\\Users\\Chris\\Desktop\\GIT home\\MSDS 6372 - Project 2\\Analysis")
```

Then, source Makefile.R

``` r
source("./Data/Makefile.R")
```

    ## Warning: package 'XLConnect' was built under R version 3.4.2

    ## Loading required package: XLConnectJars

    ## Warning: package 'XLConnectJars' was built under R version 3.4.2

    ## XLConnect 0.2-13 by Mirai Solutions GmbH [aut],
    ##   Martin Studer [cre],
    ##   The Apache Software Foundation [ctb, cph] (Apache POI),
    ##   Graph Builder [ctb, cph] (Curvesapi Java library)

    ## http://www.mirai-solutions.com ,
    ## http://miraisolutions.wordpress.com

At this point, Makefile.R has completed running and has loaded the merged data for analysis.

Summary data:

``` r
## The output will be:
## 1. "MergeData1.csv" -- merged  "CleanSpotPrices.csv" and "CleanOilGasRigsSplit.csv"
## 2. "MergeData2.csv" -- merged  "CleanSpotPrices.csv" and "CleanRigCountByTrajectory.csv"

## MergeData1 is MergeData1.csv
## MergeData2 is MergeData2.csv


#summary information of on MergeData1
print("MergeData1 includes Spot Prices and Oil and Gas Rig Split")
```

    ## [1] "MergeData1 includes Spot Prices and Oil and Gas Rig Split"

``` r
summary(MergeData1)
```

    ##      Date           WTISpotPriceBBL  BrentSpotPriceBBL  OilRigCount    
    ##  Length:1563        Min.   : 10.86   Min.   :  9.26    Min.   :  98.0  
    ##  Class :character   1st Qu.: 19.96   1st Qu.: 18.53    1st Qu.: 241.5  
    ##  Mode  :character   Median : 30.63   Median : 29.24    Median : 360.0  
    ##                     Mean   : 44.60   Mean   : 45.38    Mean   : 485.3  
    ##                     3rd Qu.: 65.51   3rd Qu.: 64.97    3rd Qu.: 561.0  
    ##                     Max.   :144.96   Max.   :143.68    Max.   :1609.0  
    ##                     NA's   :6        NA's   :5                         
    ##   GasRigCount      MiscRigCount    TotalRigCount      PercOilRig    
    ##  Min.   :  81.0   Min.   : 0.000   Min.   : 404.0   Min.   :0.1053  
    ##  1st Qu.: 367.0   1st Qu.: 2.000   1st Qu.: 797.5   1st Qu.:0.1949  
    ##  Median : 502.0   Median : 5.000   Median : 977.0   Median :0.4222  
    ##  Mean   : 642.6   Mean   : 8.076   Mean   :1136.0   Mean   :0.4272  
    ##  3rd Qu.: 903.0   3rd Qu.:12.000   3rd Qu.:1533.5   3rd Qu.:0.5713  
    ##  Max.   :1606.0   Max.   :47.000   Max.   :2031.0   Max.   :0.8337  
    ##                                                                     
    ##    PercGasRig    
    ##  Min.   :0.1656  
    ##  1st Qu.:0.4020  
    ##  Median :0.5640  
    ##  Mean   :0.5643  
    ##  3rd Qu.:0.8009  
    ##  Max.   :0.8932  
    ## 

``` r
#summary information of MergeData2
print("MergeData2 includes Spot Prices and Rig Counts by Different Trajectories")
```

    ## [1] "MergeData2 includes Spot Prices and Rig Counts by Different Trajectories"

``` r
summary(MergeData2)
```

    ##      Date           WTISpotPriceBBL  BrentSpotPriceBBL  DirRigCount   
    ##  Length:1388        Min.   : 10.86   Min.   :  9.26    Min.   : 36.0  
    ##  Class :character   1st Qu.: 21.00   1st Qu.: 19.45    1st Qu.:140.0  
    ##  Mode  :character   Median : 36.76   Median : 35.23    Median :210.0  
    ##                     Mean   : 47.76   Mean   : 48.73    Mean   :208.1  
    ##                     3rd Qu.: 71.61   3rd Qu.: 70.96    3rd Qu.:256.2  
    ##                     Max.   :144.96   Max.   :143.68    Max.   :416.0  
    ##                     NA's   :7        NA's   :5                        
    ##   HorzRigCount     VertRigCount    TotalRigCount    PerDirRig      
    ##  Min.   :  29.0   Min.   :  45.0   Min.   : 404   Min.   :0.07001  
    ##  1st Qu.:  58.0   1st Qu.: 474.8   1st Qu.: 787   1st Qu.:0.12295  
    ##  Median : 123.0   Median : 571.5   Median : 988   Median :0.19403  
    ##  Mean   : 370.7   Mean   : 579.0   Mean   :1158   Mean   :0.18345  
    ##  3rd Qu.: 618.5   3rd Qu.: 728.5   3rd Qu.:1671   3rd Qu.:0.23827  
    ##  Max.   :1372.0   Max.   :1064.0   Max.   :2031   Max.   :0.31762  
    ##                                                                    
    ##   PercHorzRig       PercVertRig     
    ##  Min.   :0.03713   Min.   :0.06789  
    ##  1st Qu.:0.06925   1st Qu.:0.31004  
    ##  Median :0.10036   Median :0.63540  
    ##  Mean   :0.28038   Mean   :0.53617  
    ##  3rd Qu.:0.56633   3rd Qu.:0.70738  
    ##  Max.   :0.84936   Max.   :0.85932  
    ## 

First 6 rows:

``` r
## The output will be:
## 1. "MergeData1.csv" -- merged  "CleanSpotPrices.csv" and "CleanOilGasRigsSplit.csv"
## 2. "MergeData2.csv" -- merged  "CleanSpotPrices.csv" and "CleanRigCountByTrajectory.csv"

## MergeData1 is MergeData1.csv
## MergeData2 is MergeData2.csv


#summary information of 1st six rows of on MergeData1
head(MergeData1)
```

    ##         Date WTISpotPriceBBL BrentSpotPriceBBL OilRigCount GasRigCount
    ## 1 1987-07-17           22.44             20.63         559         337
    ## 2 1987-07-24           20.58             19.58         565         331
    ## 3 1987-07-31           21.43             20.03         605         346
    ## 4 1987-08-07           21.01             19.65         613         349
    ## 5 1987-08-14           20.53             19.25         620         352
    ## 6 1987-08-21           19.20             18.10         627         354
    ##   MiscRigCount TotalRigCount PercOilRig PercGasRig
    ## 1           26           922  0.6062907  0.3655098
    ## 2           21           917  0.6161396  0.3609597
    ## 3           22           973  0.6217883  0.3556012
    ## 4           21           983  0.6236012  0.3550356
    ## 5           26           998  0.6212425  0.3527054
    ## 6           31          1012  0.6195652  0.3498024

``` r
#summary information 1st six rows of MergeData2
head(MergeData2)
```

    ##         Date WTISpotPriceBBL BrentSpotPriceBBL DirRigCount HorzRigCount
    ## 1 1991-01-04           24.88             24.08          81          100
    ## 2 1991-01-11           27.43             26.05          93          102
    ## 3 1991-01-18           20.05             19.10         100          102
    ## 4 1991-01-25           24.15             20.80         111          104
    ## 5 1991-02-01           21.33             20.80         122          106
    ## 6 1991-02-08           21.78             20.65         123           99
    ##   VertRigCount TotalRigCount  PerDirRig PercHorzRig PercVertRig
    ## 1          927          1108 0.07310469  0.09025271   0.8366426
    ## 2          853          1048 0.08874046  0.09732824   0.8139313
    ## 3          863          1065 0.09389671  0.09577465   0.8103286
    ## 4          836          1051 0.10561370  0.09895338   0.7954329
    ## 5          768           996 0.12248996  0.10642570   0.7710843
    ## 6          775           997 0.12337011  0.09929789   0.7773320
