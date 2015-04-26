## README

This README.md explains how all of the scripts work and how they are connected.  
This repository contains the following files:
- run_analysis.R
- codebook.md
- subsetData.csv
- tidydataset.txt

The "run_analysis.R" file contains the R code that can be used to achieve the following:
1) Transform the UCIHAR Dataset into a matrix of (observations) x (variables), where each observation is one of the 10299 data points captured in the appropriate study[1], and each of the rows is one of the variables measured. 

2) A subset of the data were extracted which contains only the measurements on the mean and standard deviation for each measurement. This subset of data is saved as subsetData.csv. 

3) An independent new dataset was produced, tidydataset.txt, which contains only the average value of each of the variables for each subject. 

4) Codebook.md - describes the variables, the data, and any transformations or work that I have performed to clean up the data.

Data were extracted from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
