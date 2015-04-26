# Data(zip file) were downloaded and extracted into working directory. All data
# were stored in the data folder.

# 1.    Merges the training and the test sets to create one data set.
path_rf <- "./data"
#Read  all the  files
testActivity <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
trainActivity <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

testSubject  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
trainSubject <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)

testFeatures  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
trainFeatures <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)


# merge the dataset

dSubject <- rbind(trainSubject, testSubject)
dActivity<- rbind(trainActivity, testActivity)
dFeatures<- rbind(trainFeatures, testFeatures)


names(dSubject)<-c("Subject")
names(dActivity)<- c("Activity")
FeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dFeatures)<- FeaturesNames$V2

# Merge columns to get the data frame Data for all data
dCombine <- cbind(dSubject, dActivity)
Data <- cbind(dFeatures, dCombine)

# 2.    Extracts only the measurements on the mean and standard deviation
# for each measurement. 

FeaturesNames2<-FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturesNames$V2)]
selected<-c(as.character(FeaturesNames2), "Subject", "Activity" )
Data<-subset(Data,select=selected)
write.csv(Data,file=paste( "subsetData.csv", sep=""))



# 3.	Uses descriptive activity names to name the activities in the data set
labels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

# 4.	Appropriately labels the data set with descriptive variable names. 
# prefix t is replaced by time
# prefix f is replaced by frequency
# Acc is replaced by Accelerometer
# Gyro is replaced by Gyroscope
# Mag is replaced by Magnitude
# BodyBody is replaced by Body
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

# 5.From the data set in step 4, creates a second, independent 
# tidy data set with the average of each variable for each activity 
# and each subject.


library(plyr)
Data2<-aggregate(. ~Subject + Activity, Data, mean)
Data2<-Data2[order(Data2$Subject,Data2$Activity),]
write.table(Data2, file = "tidydataset.txt",row.name=FALSE)


