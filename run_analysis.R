library(reshape2)   ## Set up the workspace

old.dir <- getwd()  ## Track back to where you are

if(!file.exists("ucidata")) { ## Create a location for your data files
  dir.create("ucidata")
}

setwd("./ucidata/")  ## Create a common file structure

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ## Data location

download.file(fileURL, dest = "tempzipfile.zip")  ## Download and zip the file
unzip("tempzipfile.zip")
unlink("tempzipfile.zip")

## Get your column headings

columns <- read.table("./UCI HAR Dataset/features.txt", col.names = c("Num", "Desc"), stringsAsFactors=FALSE )[,2]
columns <- columns <- gsub("\\()", "", gsub("^t", "Time-", gsub ("^f", "Frequency-", gsub( "\\(t", "(Time-", gsub("\\),", ",", gsub("(?<=\\d),(?=\\d)", ":",columns, perl = TRUE))))))


## Bring in your data from the files
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
testClass <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "Class")
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "Subject" )
trainClass <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "Class")
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")

## STEP 1:  Merge the training and test sets to create one data set
dfTest <- data.frame(testData)
colnames(dfTest) <- columns
dfTest <- cbind(testSubject, testClass, dfTest)
dfTrain <- data.frame(trainData)
colnames(dfTrain) <- columns
dfTrain <- cbind(trainSubject, trainClass, dfTrain)
dfComplete <- rbind(dfTest, dfTrain)

## STEP 2:  Extract only the measurements on the mean and standard deviation
dfMeans <- grep("mean", colnames(dfComplete), ignore.case = TRUE)  ## Subset the means
dfSD <- grep ("std", colnames(dfComplete), ignore.case = TRUE)  ## Subset the standard deviations
dfClean <- dfComplete[c(1:3, dfMeans, dfSD)]  ## Assign the subsets to a new variable

## Step 3:  Use descriptive activity labels
actLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Class", "Label")) ## Get your labels
dfClean$Activity <- actLabels$Label[match(dfClean$Class, actLabels$Class)]  ## Label the activities
dfTidy <- dfClean[c(1:2,90,3:89)] ## Reorder the columns

## Step 4:  Appropriately label the data set with descriptive variable names
## See Step 1, lines 38 and 41

## Step 5:  From the data set in Step 4, create a second tidy data set with the average of each variable for each activity and each subject
dfMelt <- melt(dfTidy, id.vars = c("Subject", "Class", "Activity"), measure.vars = c(4:89), variable.name = "Features", value.name = "Signals")
tidyData <- dcast(dfMelt, Subject + Activity ~ Features, mean, value.var = "Signals")
tidyColumns <- c("Subject", "Activity", paste ("Mean of", colnames(tidyData[,3:88])))
colnames(tidyData) <- tidyColumns
