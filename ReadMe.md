---
title: "ReadMe"
author: "alavanway"
date: "Friday, January 23, 2015"
output: html_document
---

## CONTENTS

This repository contains summarized "Human Activity Recognition Using Smartphones" data from the University of California, Irvine (UCI) Center for Machine Learning and Intelligent Systems.[1]  Components include:
1)  tidyData.txt:  tidyData.txt presents a summary table of smartphone signal means and standard deviations for 30 test subjects engaged in six activities.  The table includes 2 identifying columns ("Subject" and "Activity"), 180 observations and 86 variables. Measurements are normalised and so unitless.  headers = TRUE, row.names = FALSE

2)  run_analysis.R:  A reproducible R script (see SCRIPT OVERVIEW below) that downloads, merges, tidies, and summarizes the source data (see SOURCE DATA below)

2)  CodeBook.md:  A summary of the variables, the data, and transformations contained in tidyData.txt

3)  ReadMe.md (this document):  A brief overview of the repository, contents, and sources

The code from "run_analysis.R", can be sourced from inside an R session.  Please note that the script will search for a working directory named "ucidata".  If such a folder already exists, it will download the data directly to that folder.  Please note that the script will search for an extant version of the UCI data before downloading a file.  


## SOURCE DATA

The original data set is available from the University of California, Irvine Machine Learning Repository.  The source data is saved as .txt tables with no headers or row numbers.  The data set has further been partitioned randomly into two data sets (test and train).  The summary table contained in tidyData.txt includes data merged from both sources.  The summary table does not include data from the "Inertial Signals" directory in either the "test" or "train" directories.

It is a multidimensional time-series, composed by 30 subjects, 2) various activities (for each subject) and 3) various measured variables (for each activity).

A full description of the data is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

In addition, the script will download and extract a .zip file with additional data descriptions (README.txt and features_info.txt)


## SCRIPT OVERVIEW

The R script titled "run_analysis.R", merges the original "training" and "test" data sets, subsets measurements on the mean and standard deviation of sensor signals and then summarizes mean of each variable for each activity and each subject.

### Execution

1.  Set up a common workspace (installed packages, working directory, source files)

2.  Download and unzip the source files if they do not already exists

3.  Import data from the source files

4.  (Coursera Step 1) - Merge the training and test sets to create one data set

5.  (Coursera Step 2) - Extract only the measurements on the mean and standard deviation

6.  (Coursera Step 3) - Assign descriptive activity labels

7.  (Coursera Step 4) - Appropriately label the data set with descriptive variable names

8.  (Coursera Step 5) - Create a second tidy data set with the average of each variable for each activity and each subject


## SOURCES

[1] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[Source Data] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[Community Discussion] Discussion Forums https://class.coursera.org/getdata-010/forum

[Project FAQ] https://class.coursera.org/getdata-010/forum/thread?thread_id=49

