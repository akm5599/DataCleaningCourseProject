---
title: "CodeBook"
author: "Ashley Morrell"
date: "12/30/2019"
---

# Data Dictionary:

## Raw data files (untidy):

- "activity_labels.txt": data set with the activity names that
   correspond to each number (1-6)

- "features.txt": data set with the column header names for the
   testing and training X data sets

- "subject_test.txt": data set with the subject who corresponds to
   each observation for the testing data

- "subject_train.txt": data set with the subject who corresponds to
   each observation for the training data

- "X_test.txt" (testx): data set which contains the measured
   variables and values for the testing data set

- "X_train.txt" (trainx): data set which contains the measured
   variables andvalues for the training data set

- "Y_test.txt" (testy): data set which contains the numerical
   reference to the activity label for the testing data set

- "Y_train.txt" (trainy): data set which contains the numerical
   reference to the activity label for the training data set

## Intermediate Data sets:

- "features2": character vector created from "features" to use with
   the colnames function in order to assign column header names to
  each variable

- "headers": character vector created from the column header names
   and used to find duplicate variables

- "header_names": character vector used to rename column headers with
   "human-friendly" names

- "test": data set created within R that configures the Subject,
   column headers and numerical activity reference value with the
   measured variables for the testing data set

- "train": data set created within R that configures the Subject,
   column headers and numerical activity reference value with the
   measured variables for the training data set


## Tidy Data - merged test and training data:

- "dataset": the initial tidy data set created by merging the test
   and training data

- "TIDYdataset": a separate tidy data set created to summarize the
   mean of each mean and standard deviation measurement by
   organizing by the Subject and Activity

# Variables

- "Subject": Ranges from 1 to 30 and identifies each person who is
   participating in the experiment

- "Activity": Defines the activity being performed. Includes
   walking, walking upstairs, walking downstairs, sitting, standing
   and laying


## Measured Variables
All measured variables have been standardized to maintain consistency with regard to units, therefore values range from -1 to +1.

Variables that begin with "Time" refer to measurements of time. Variables that do not begin with "Time" refer to frequency signals. All Gravity measurements are time measurements and contain "Gravity."

Variables that contain "Accelerometer" refer to measurements taken with an accelerometer. Variables that contian "Gyroscope" refer to measurements taken with a gyroscope.

"Jerk" within a variable name indicates a Jerk signal and "Mag" indicates the magnitude.

"Mean" within a variable name indicates the calculation of a mean and "Std" within a variable name indicates the calculation of a standard deviation.

The measured variables are as follows:

"TimeBodyAccelerometerMean-X"

"TimeBodyAccelerometerMean-Y"            

"TimeBodyAccelerometerMean-Z" 

"GravityAccelerometerMean-X"

"GravityAccelerometerMean-Y"

"GravityAccelerometerMean-Z" 
        
"TimeBodyAccelerometerJerkMean-X"

"TimeBodyAccelerometerJerkMean-Y"        

"TimeBodyAccelerometerJerkMean-Z"         

"TimeBodyGyroscopeMean-X"

"TimeBodyGyroscopeMean-Y"

"TimeBodyGyroscopeMean-Z"

"TimeBodyGyroscopeJerkMean-X"         

"TimeBodyGyroscopeJerkMean-Y"

"TimeBodyGyroscopeJerkMean-Z"

"TimeBodyAccelerometerMagMean"

"TimeGravityAccelerometerMagMean"

"TimeBodyAccelerometerJerkMagMean"

"TimeBodyGyroscopeMagMean"

"TimeBodyGyroscopeJerkMagMean"
                  
"BodyAccelerometerMean-X"

"BodyAccelerometerMean-Y"

"BodyAccelerometerMean-Z"

"BodyAccelerometerMeanFreq-X"

"BodyAccelerometerMeanFreq-Y"

"BodyAccelerometerMeanFreq-Z"

"BodyAccelerometerJerkMean-X"
                  
"BodyAccelerometerJerkMean-Y"

"BodyAccelerometerJerkMean-Z"

"BodyAccelerometerJerkMeanFreq-X"

"BodyAccelerometerJerkMeanFreq-Y"

"BodyAccelerometerJerkMeanFreq-Z"

"BodyGyroscopeMean-X"

"BodyGyroscopeMean-Y"

"BodyGyroscopeMean-Z"

"BodyGyroscopeMeanFreq-X"

"BodyGyroscopeMeanFreq-Y"

"BodyGyroscopeMeanFreq-Z"

"BodyAccelerometerMagMean"

"BodyAccelerometerMagMeanFreq"

"BodyAccelerometerJerkMagMean"

"BodyAccelerometerJerkMagMeanFreq"

"BodyGyroscopeMagMean"

"BodyGyroscopeMagMeanFreq"

"BodyGyroscopeJerkMagMean"

"BodyGyroscopeJerkMagMeanFreq"

"TimeBodyAccelerometerStd-X"

"TimeBodyAccelerometerStd-Y"

"TimeBodyAccelerometerStd-Z"

"GravityAccelerometerStd-X"

"GravityAccelerometerStd-Y"

"GravityAccelerometerStd-Z"

"TimeBodyAccelerometerJerkStd-X"

"TimeBodyAccelerometerJerkStd-Y"

"TimeBodyAccelerometerJerkStd-Z"

"TimeBodyGyroscopeStd-X"

"TimeBodyGyroscopeStd-Y"

"TimeBodyGyroscopeStd-Z"

"TimeBodyGyroscopeJerkStd-X"

"TimeBodyGyroscopeJerkStd-Y"

"TimeBodyGyroscopeJerkStd-Z"

"TimeBodyAccelerometerMagStd"

"TimeGravityAccelerometerMagStd"

"TimeBodyAccelerometerJerkMagStd"

"TimeBodyGyroscopeMagStd"

"TimeBodyGyroscopeJerkMagStd"

"BodyAccelerometerStd-X"

"BodyAccelerometerStd-Y"

"BodyAccelerometerStd-Z"

"BodyAccelerometerJerkStd-X"

"BodyAccelerometerJerkStd-Y"

"BodyAccelerometerJerkStd-Z"

"BodyGyroscopeStd-X"

"BodyGyroscopeStd-Y"

"BodyGyroscopeStd-Z" 

"BodyAccelerometerMagStd"
                  
"BodyAccelerometerJerkMagStd"    

"BodyGyroscopeMagStd"

"BodyGyroscopeJerkMagStd"


# Data Cleaning Process

1. The raw, untidy data files were read into R

2. Next, two empty data tables were created: one for test data and one for training data called "test" and "train", respectively. "features2" was created as a character vector of the second column of "features." These are the column header names, therefore they are assigned as the column header names for "test" and "train."

3. "testx" and "trainx" are added to the data tables "test" and "train," so now there are two data tables of measurement data along with corresponding column header names.

4. Next, "trainy" and "testy" are added to "train" and "test," respectively. This new column is added to incorporate the activity numerical references. The column name for the activity is altered before being added to "activity_label" to make it easier to understand what it represents.

5. The subject column is added next to "train" and "test" to incorporate the subject corresponding to each observation. The column name for subject is altered beforehand in order to make it easier to understand what it represents.

6. The testing and training data are merged together in one data set.

7. The activity labels are changed to their corresponding phrases, which are words describing the activities.

8. Next, the duplicate variables are removed in order to work more easily in dplyr. All duplicate headers are unrelated to mean and standard deviation, so all were removed overall.

9. The mean and standard deviation variables are extracted along with the "Subject" and "Activity." Subject and activity columns were kept because they serve as identifiers for the observations. Mean and standard deviation measurements were defined as all the variables whose name contains "mean" or "std," which is case sensitive.

10. Next, the column names for the measured variables are renamed to names that are easy to read and understand what they mean, an important component of tidy data.

11. A separate tidy data set was created that summarizes each measured variable by their mean value. Additionally, it groups the summary by Subject and Activity.



