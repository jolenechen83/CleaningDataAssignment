## Codebook

This codebook.md describes the variables, the data, and any transformations or work that I have performed to clean up the data. Data were downloaded from this source. 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
See the README.txt file in the ZIP file for the detailed information on the dataset. The files that will be used to load data are listed as follows:
- test/subject_test.txt
- test/X_test.txt
- test/y_test.txt
- train/subject_train.txt
- train/X_train.txt
- train/y_train.txt
From the files:
1. Values of Variable Activity consist of data from “Y_train.txt” and “Y_test.txt”
2. Values of Variable Subject consist of data from “subject_train.txt” and subject_test.txt"
3. Values of Variables Features consist of data from “X_train.txt” and “X_test.txt”
Activity, Subject and Features will be used as part of descriptive variable names for the data. 
In the run_analysis.R script, data (zip file) were downloaded and extracted into working directory. Training and the test sets were merged to form one data set. Merge columns to get the data frame Data for all data.  A subset of the data were extracted which contains only the measurements on the mean and standard deviation for each measurement. This subset of data is saved as subsetData.csv. 
Descriptive activity names were used to name the activities in the data set by making use of the activity lables.txt. 
The data set were labelled with descriptive variable names with the following format. 
- prefix t is replaced by time
- prefix f is replaced by frequency
- Acc is replaced by Accelerometer
- Gyro is replaced by Gyroscope
- Mag is replaced by Magnitude
- BodyBody is replaced by Body

A second, independent tidy data set with the average of each variable for each activity and each subject. The independent tidy data set is saved as tidydataset.txt.
