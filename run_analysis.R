

library(data.table)
library(dplyr)

testx <- read.table("X_test.txt")
testy <- read.table("y_test.txt")
trainx <- read.table("X_train.txt")
trainy <- read.table("y_train.txt")

activity_labels <- read.table("activity_labels.txt")

features <- read.table("features.txt")

subject_test <- read.table("subject_test.txt")
subject_train <- read.table("subject_train.txt")

# Create data table for training data and assign column headers
train <- data.table(matrix(vector(),ncol=561))
features2 <- as.character(features$V2)
colnames(train) <- features2
train <- rbind(train, trainx, use.names = FALSE)


# Create data table for testing data and assign column headers
test <- data.table(matrix(vector(), ncol=561))
colnames(test) <- features2
test <- rbind(test, testx, use.names = FALSE)


# Add trainy column to train data
colnames(trainy) <- c("activity_label")
train <- cbind(trainy, train)

# Add testy column to test data
colnames(testy) <- c("activity_label")
test <- cbind(testy, test)

# Add subject column to train data
colnames(subject_train) <- c("Subject")
train <- cbind(subject_train, train)

# Add subject column to test data
colnames(subject_test) <- c("Subject")
test <- cbind(subject_test, test)


# Merge training and testing data
dataset <- rbind(train, test)

# Assign Activity to obs
colnames(activity_labels) <- c("num", "Activity")
dataset <- merge(dataset, activity_labels, by.x = "activity_label", by.y = "num", all.x = TRUE)

# Find duplicate Variables and remove
headers <- names(dataset)
headers <- headers[duplicated(headers) == TRUE]
headers
dataset <- dataset[ , !(names(dataset) %in% headers)]


# Select Mean and Standard Deviation measurements
dataset <- dataset %>%
  select(Subject, Activity, contains("mean", ignore.case = FALSE), contains("std"))


# Rename headers to human-friendly names
header_names <- c("Subject", "Activity",                
                  "TimeBodyAccelerometerMean-X", "TimeBodyAccelerometerMean-Y",              
                  "TimeBodyAccelerometerMean-Z", "GravityAccelerometerMean-X",           
                  "GravityAccelerometerMean-Y",           "GravityAccelerometerMean-Z"   ,        
                  "TimeBodyAccelerometerJerkMean-X",           "TimeBodyAccelerometerJerkMean-Y"  ,        
                  "TimeBodyAccelerometerJerkMean-Z",           "TimeBodyGyroscopeMean-X"      ,       
                  "TimeBodyGyroscopeMean-Y",              "TimeBodyGyroscopeMean-Z"       ,      
                  "TimeBodyGyroscopeJerkMean-X",          "TimeBodyGyroscopeJerkMean-Y"    ,     
                  "TimeBodyGyroscopeJerkMean-Z" ,         "TimeBodyAccelerometerMagMean"         ,    
                  "TimeGravityAccelerometerMagMean",        "TimeBodyAccelerometerJerkMagMean"         ,
                  "TimeBodyGyroscopeMagMean" ,            "TimeBodyGyroscopeJerkMagMean"  ,      
                  "BodyAccelerometerMean-X"   ,            "BodyAccelerometerMean-Y"         ,     
                  "BodyAccelerometerMean-Z"    ,           "BodyAccelerometerMeanFreq-X"      ,    
                  "BodyAccelerometerMeanFreq-Y" ,          "BodyAccelerometerMeanFreq-Z"       ,   
                  "BodyAccelerometerJerkMean-X"  ,         "BodyAccelerometerJerkMean-Y"        ,  
                  "BodyAccelerometerJerkMean-Z"   ,        "BodyAccelerometerJerkMeanFreq-X"     , 
                  "BodyAccelerometerJerkMeanFreq-Y",       "BodyAccelerometerJerkMeanFreq-Z"      ,
                  "BodyGyroscopeMean-X"        ,      "BodyGyroscopeMean-Y"             ,
                  "BodyGyroscopeMean-Z"         ,     "BodyGyroscopeMeanFreq-X"         ,
                  "BodyGyroscopeMeanFreq-Y"      ,    "BodyGyroscopeMeanFreq-Z"         ,
                  "BodyAccelerometerMagMean"           ,   "BodyAccelerometerMagMeanFreq"         ,
                  "BodyAccelerometerJerkMagMean"    ,  "BodyAccelerometerJerkMagMeanFreq" ,
                  "BodyGyroscopeMagMean"        , "BodyGyroscopeMagMeanFreq"    ,
                  "BodyGyroscopeJerkMagMean"   ,  "BodyGyroscopeJerkMagMeanFreq",
                  "TimeBodyAccelerometerStd-X"          ,      "TimeBodyAccelerometerStd-Y"               ,
                  "TimeBodyAccelerometerStd-Z"           ,     "GravityAccelerometerStd-X"            ,
                  "GravityAccelerometerStd-Y"         ,    "GravityAccelerometerStd-Z"            ,
                  "TimeBodyAccelerometerJerkStd-X"         ,   "TimeBodyAccelerometerJerkStd-Y"           ,
                  "TimeBodyAccelerometerJerkStd-Z"          ,  "TimeBodyGyroscopeStd-X"              ,
                  "TimeBodyGyroscopeStd-Y"         ,      "TimeBodyGyroscopeStd-Z"              ,
                  "TimeBodyGyroscopeJerkStd-X"      ,     "TimeBodyGyroscopeJerkStd-Y"          ,
                  "TimeBodyGyroscopeJerkStd-Z"       ,    "TimeBodyAccelerometerMagStd"              ,
                  "TimeGravityAccelerometerMagStd"         ,   "TimeBodyAccelerometerJerkMagStd"          ,
                  "TimeBodyGyroscopeMagStd"            ,  "TimeBodyGyroscopeJerkMagStd"         ,
                  "BodyAccelerometerStd-X"            ,    "BodyAccelerometerStd-Y"               ,
                  "BodyAccelerometerStd-Z"             ,   "BodyAccelerometerJerkStd-X"           ,
                  "BodyAccelerometerJerkStd-Y"          ,  "BodyAccelerometerJerkStd-Z"           ,
                  "BodyGyroscopeStd-X"              , "BodyGyroscopeStd-Y"              ,
                  "BodyGyroscopeStd-Z"     ,          "BodyAccelerometerMagStd"              ,
                  "BodyAccelerometerJerkMagStd" ,      "BodyGyroscopeMagStd"         ,
                  "BodyGyroscopeJerkMagStd")


colnames(dataset) <- header_names


# Create an independent tidy data set that takes the mean of all measurements by Subject and Activity
TIDYdataset <- dataset %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)


# Write to text file
write.table(TIDYdataset, "TIDYdataset.txt", row.names = FALSE)

