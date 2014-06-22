## Download the files

## Manually put all the data files to be imported into a common folder
## named "HARAnalysis"

## Set the working directory as HARAnalysis
setwd("~/BSS_Training/Coursera_R_WorkingDirectory/HARAnalysis")


## Read "subject_test.txt" to get the rows for test subjects  
testSubject <- read.table("subject_test.txt")

## Read "X_test.txt" to get the observations for test subjects
testObs <- read.table("X_test.txt")

## Read "y_test.txt" to get rows for activity data for test subjects
testActivity <- read.table("y_test.txt")

## Create testData data frame for test data set by combining 
## subject, activity and Observations
testData <- cbind(testSubject, testActivity, testObs)



## Read "subject_train.txt" to get the rows for training subjects  
trainSubject <- read.table("subject_train.txt")

## Read "X_train.txt" to get the observations for training subjects
trainObs <- read.table("X_train.txt")

## Read "y_train.txt" to get rows for activity data for training subjects
trainActivity <- read.table("y_train.txt")

## Create trainData data frame for training data set by combining 
## subject, activity and Observations
trainData <- cbind(trainSubject, trainActivity, trainObs)


## ITEM 1.
### Merge the two data sets
mergeData <- rbind(testData, trainData)


## ITEM 2.
### Add the column names to the merged observations
#### Read "features.txt" to get the column labels
namesCol <- read.table("features.txt")
namesCol <- as.vector(namesCol[,2])

#### Assign "mergeData" with "namesCol" to get the dataframe 
#### descriptive column headings -- relates to ITEM 4.
colnames(mergeData) <- c("Subject", "Activity", namesCol)


#### Idenitfy the required columns with mean() or std() to be extracted.  
#### Include Subject, Activity and columns returned by grep function.

reqCol <- c(1:2, 
            grep("mean\\(\\)|std\\(\\)", colnames(mergeData)))

#### Get the subset of data
subsetData <- mergeData[,reqCol]


## ITEM 3.

### Read "activity_label.txt" to get the activity descriptions 
namesActivity <- read.table("activity_labels.txt")

## Rename the column names to aide merging and giving meaningful 
## description -- relates to ITEM 4
colnames(namesActivity) <- c("Activity", "Activity_Description") 

## Merge "namesActivity" with the subsetData to add the activity description
## to the records in the dataframe
subsetData <- merge(subsetData, namesActivity, all = TRUE)



## ITEM 4.
## Already accomplished as part of ITEM 2 and ITEM 3



## ITEM 5.
library(reshape2)

### melt the "subsetData" identifying the ID fields and variable fields
meltData <- melt(subsetData, 
                 id=c(1:2,ncol(subsetData)), 
                 measure.vals = -c(1:3,ncol(subsetData)))

### reshape the data to create a dataframe having one record for each unique
### combination of Activity and Subject, with one column for each variable.
### Intersection of row and the column to contain the mean of the variable for
### each combination of Activity and Subject.
reshapedData <- dcast(meltData, 
                      Activity_Description + Subject 
                      ~ variable, mean)

### Change column names on the reshaped data to reflect that 
### the values are the mean of the mean or std deviation.

namesCol2 <- colnames(reshapedData)
namesCol2 <- gsub("\\(\\)", "", namesCol2)
ColIndex <- grep("mean", namesCol2)
namesCol2[ColIndex] <- paste("MeanOf_", 
                             gsub("-mean", "", namesCol2[ColIndex]), 
                             sep="")

ColIndex <- grep("std", namesCol2)
namesCol2[ColIndex] <- paste("stdDevOf_", 
                             gsub("-std", "", namesCol2[ColIndex]), 
                             sep="")
namesCol2 <- gsub("-", "_", namesCol2)
namesCol2[3:68] <- paste("MeanOf_", namesCol2[3:68], sep = "")

colnames(reshapedData) <- namesCol2

### write data to text file
write.table(reshapedData, "tidyData.txt", sep = " ", row.names = FALSE)










