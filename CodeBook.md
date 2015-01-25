---
title: "CodeBook.md"
author: "alavanway"
date: "Friday, January 23, 2015"
output: html_document
---

## CodeBook for tidyData.txt

The data set contained in tidyData.txt presents a summary table of smartphone signal means and standard deviations for 30 test subjects engaged in six activities.  The table includes two identifying columns ("Subject" and "Activity"), 180 observations and 86 variables.  headers = TRUE, row.names = FALSE.  The summary table contained in tidyData.txt includes both test and train data (see SOURCE DATA below).

## SOURCE DATA

The original data set is available from the University of California, Irvine Machine Learning Repository.[1]  The source data is saved as .txt tables with no headers or row numbers.  To generate the data, 30 test subjects ("Subjects") performed six activities ("Activities") while wearing a smartphone (Samsung Galaxy S II) on the waist.  The observations represent 3-axial linear acceleration and 3-axial angular velocity signals from the embedded accelerometer and gyroscope during each activity captured in a time-series.  

The source data provides a multidimensional time-series, composed by 30 subjects, 2) various activities (for each subject) and 3) various measured variables (for each activity).  The complete data set has further been partitioned randomly into two data sets (test with 30% of the data and train with 70%).  

A full description of the data is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

In addition, the script will download and extract a .zip file with additional data descriptions (README.txt and features_info.txt)

The source data is broken into several separate files, including:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
 

## DATA TRANSFORMATIONs

The R script "run_analysis.R" generates the tidyData.txt summary table.  The script performs the following transformations of the source data:
1.  Imports data column headers (variables) from features.txt
2.  Cleans extraneous and confusing characters from the column headers
3.  Builds the test data frame from test/subject_test.txt, test/test_y.txt, and test/test_x.txt
4.  Builds the train data frame from the train/subject_train.txt, train/train_y.txt, and train/train_x.txt
5.  Merges the test and train data frames into a single, complete data frame
6.  Subsets the 86 mean() and standard deviation() variables from the total set of 561 variables
7.  Applies the activity labels from activity_labels.txt to the subset data frame
8.  Reshapes the data to summarize with the mean of the 86 signal values for each activity performed by each subject


## DATA COMPONENTS

Subject:  The unique identifier for each subject, 1:30

Activity:  The activity being performed by each subject at the time of the data capture.  One of six values:
- LAYING
- SITTING
- STANDING
- WALKING
- WALKING_DOWNSTAIRS
- WALKING_UPSTAIRS

Mean Signal Means (Measurements are normalised and so unitless.):  The mean of observed means (calculated by the function mean()) of the 3-axial linear acceleration and 3-axial angular velocity signals from the embedded accelerometer and gyroscope during each activity captured in a time-series. 
"Mean.of.Time.BodyAcc.mean.X"                      "Mean.of.Time.BodyAcc.mean.X.1"                   
"Mean.of.Time.BodyAcc.mean.Y"                      "Mean.of.Time.BodyAcc.mean.Z"                     
"Mean.of.Time.GravityAcc.mean.X"                   "Mean.of.Time.GravityAcc.mean.Y"                  
"Mean.of.Time.GravityAcc.mean.Z"                   "Mean.of.Time.BodyAccJerk.mean.X"                 
"Mean.of.Time.BodyAccJerk.mean.Y"                  "Mean.of.Time.BodyAccJerk.mean.Z"                 
"Mean.of.Time.BodyGyro.mean.X"                     "Mean.of.Time.BodyGyro.mean.Y"                    
"Mean.of.Time.BodyGyro.mean.Z"                     "Mean.of.Time.BodyGyroJerk.mean.X"                
"Mean.of.Time.BodyGyroJerk.mean.Y"                 "Mean.of.Time.BodyGyroJerk.mean.Z"                
"Mean.of.Time.BodyAccMag.mean"                     "Mean.of.Time.GravityAccMag.mean"                 
"Mean.of.Time.BodyAccJerkMag.mean"                 "Mean.of.Time.BodyGyroMag.mean"                   
"Mean.of.Time.BodyGyroJerkMag.mean"                "Mean.of.Frequency.BodyAcc.mean.X"                
"Mean.of.Frequency.BodyAcc.mean.Y"                 "Mean.of.Frequency.BodyAcc.mean.Z"                
"Mean.of.Frequency.BodyAcc.meanFreq.X"             "Mean.of.Frequency.BodyAcc.meanFreq.Y"            
"Mean.of.Frequency.BodyAcc.meanFreq.Z"             "Mean.of.Frequency.BodyAccJerk.mean.X"            
"Mean.of.Frequency.BodyAccJerk.mean.Y"             "Mean.of.Frequency.BodyAccJerk.mean.Z"            
"Mean.of.Frequency.BodyAccJerk.meanFreq.X"         "Mean.of.Frequency.BodyAccJerk.meanFreq.Y"        
"Mean.of.Frequency.BodyAccJerk.meanFreq.Z"         "Mean.of.Frequency.BodyGyro.mean.X"               
"Mean.of.Frequency.BodyGyro.mean.Y"                "Mean.of.Frequency.BodyGyro.mean.Z"               
"Mean.of.Frequency.BodyGyro.meanFreq.X"            "Mean.of.Frequency.BodyGyro.meanFreq.Y"           
"Mean.of.Frequency.BodyGyro.meanFreq.Z"            "Mean.of.Frequency.BodyAccMag.mean"               
"Mean.of.Frequency.BodyAccMag.meanFreq"            "Mean.of.Frequency.BodyBodyAccJerkMag.mean"       
"Mean.of.Frequency.BodyBodyAccJerkMag.meanFreq"    "Mean.of.Frequency.BodyBodyGyroMag.mean"          
"Mean.of.Frequency.BodyBodyGyroMag.meanFreq"       "Mean.of.Frequency.BodyBodyGyroJerkMag.mean"      
"Mean.of.Frequency.BodyBodyGyroJerkMag.meanFreq"   "Mean.of.angle.Time.BodyAccMean.gravity."         
"Mean.of.angle.Time.BodyAccJerkMean.gravityMean."  "Mean.of.angle.Time.BodyGyroMean.gravityMean."    
"Mean.of.angle.Time.BodyGyroJerkMean.gravityMean." "Mean.of.angle.X.gravityMean."                    
"Mean.of.angle.Y.gravityMean."                     "Mean.of.angle.Z.gravityMean."

Mean Signal Standard Deviations (Measurements are normalised and so unitless.):  The mean of observed standard deviations (calculated by the function mean()) of the 3-axial linear acceleration and 3-axial angular velocity signals from the embedded accelerometer and gyroscope during each activity captured in a time-series. 

"Mean.of.Time.BodyAcc.std.X"                       "Mean.of.Time.BodyAcc.std.Y"                      
"Mean.of.Time.BodyAcc.std.Z"                       "Mean.of.Time.GravityAcc.std.X"                   
"Mean.of.Time.GravityAcc.std.Y"                    "Mean.of.Time.GravityAcc.std.Z"                   
"Mean.of.Time.BodyAccJerk.std.X"                   "Mean.of.Time.BodyAccJerk.std.Y"                  
"Mean.of.Time.BodyAccJerk.std.Z"                   "Mean.of.Time.BodyGyro.std.X"                     
"Mean.of.Time.BodyGyro.std.Y"                      "Mean.of.Time.BodyGyro.std.Z"                     
"Mean.of.Time.BodyGyroJerk.std.X"                  "Mean.of.Time.BodyGyroJerk.std.Y"                 
"Mean.of.Time.BodyGyroJerk.std.Z"                  "Mean.of.Time.BodyAccMag.std"                     
"Mean.of.Time.GravityAccMag.std"                   "Mean.of.Time.BodyAccJerkMag.std"                 
"Mean.of.Time.BodyGyroMag.std"                     "Mean.of.Time.BodyGyroJerkMag.std"                
"Mean.of.Frequency.BodyAcc.std.X"                  "Mean.of.Frequency.BodyAcc.std.Y"                 
"Mean.of.Frequency.BodyAcc.std.Z"                  "Mean.of.Frequency.BodyAccJerk.std.X"             
"Mean.of.Frequency.BodyAccJerk.std.Y"              "Mean.of.Frequency.BodyAccJerk.std.Z"             
"Mean.of.Frequency.BodyGyro.std.X"                 "Mean.of.Frequency.BodyGyro.std.Y"                
"Mean.of.Frequency.BodyGyro.std.Z"                 "Mean.of.Frequency.BodyAccMag.std"                
"Mean.of.Frequency.BodyBodyAccJerkMag.std"         "Mean.of.Frequency.BodyBodyGyroMag.std"


## SOURCES


[1] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[Source Data] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012