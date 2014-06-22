# Getting and Cleaning Human Activity Recognition Dataset

The objective of this codebook is to describe context, analysis and the feature descriptions associated with the creation of "tidyData" dataset from observation related  Human Activity Recognition present in the original dataset petaining to Human Activity Recognition Using Smartphones Dataset - Version 1.0 [1]

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Context
This study has been performed by Ranjan Parida to complete the Coursera's "Getting and Cleaning Data" course project requirement to create a tidy data set. Logic to define the transformation of the original dataset to the tidy data set has been described as part of the "ReadMe.md" as well as in the code "run_analysis.R"

## Scope & DataSet Definition
As stated in the original study, a population of 30 volunteers has been studied across six different activities. Although the original study captures 561 features, this study is only focused primarily features containing computed mean and standard deviations.

For each subject and activity, the original data set has multiple observations for a single feature. Through this analysis, we will be computing a mean value for mutiple observation of a feature and presenting it as a single observation for each subject, activity and the feature combination. e.g. Original Data has 203 observations for each feature for subject 2 - sitting. For these 203 observations, in "TidyData" dataset you would find only one mean value. This will reduce the 10299 Observation in the original dataset to 180 observations in the "TidyData.txt"

Not knowing the context of using the information from the original dataset for further analysis, I have limited myself to defining the tidy data within the confines of the question. Also, given the level of opinion differences on the topic of wide vs. long data, I am not performing any further data re-structuring. Please refer to the discussion on the Course Page at: 
https://class.coursera.org/getdata-004/forum/thread?thread_id=262

## Format
"Tidy Data" is a text file with space delimiting as the data set did not have any string based columns that could have blank values. Each row in the file corresponds to a unique combination of Subject and Activity. All feature columns provide the mean value for that feature corresponding to the Subject-Activity combination.

## Features

### From Original Dataset
Following feature definition remain standard between the original dataset and the "tidyData" dataset.

#### tAcc-XYZ and tGyro-XYZ
These represent raw time domain signals (prefix 't' to denote time) captured at a constant rate of 50 Hz, which were then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

#### tBodyAcc-XYZ and tGravityAcc-XYZ
These represent the tAcc-XYZ and tGyro-XYZ acceleration signals separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

#### tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ
These represent the jerk signals derived in time using the body linear acceleration and angular velocity. 

#### tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag
These represent the magnitude of Body Accelaration, Body Accelaration Jerks, Gravity Accelaration and Gravity Accelaration Jerks, The value of these three-dimensional signals was calculated using the Euclidean norm (). 

#### fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag
These represent the value of Fast Fourier Transform(FFT) being applied to tBodyAcc-XYZ, tbodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyAccJerkMag, tBodyGyroMag, and tBodyGyroJerkMag  


### For "tidyData" Dataset

Following data definitions are being introduced for the purposes of "tidyData" dataset and do not exist in the original dataset.

#### Activity_Description
The field lists the activity the subject was engaged in when the observation was taken. This is column is of type Factor, with the following valid values:
* "WALKING"
* "WALKING_UPSTAIRS"
* "WALKING_DOWNSTAIRS"
* "SITTING"
* "STANDING" 
* "LAYING"

#### Subject
This field is used to identifier the individual in the experment for whom the obervation is being recorded.

This column is of type integer and contains values from  1 through 30.

#### MeanOf_
Column names starting with "MeanOf" contain the mean of the values specified thereafter in the column name for the combination of subject and activity listed on the record. e.g. Column named "MeanOf_MeanOf_tBodyAcc_X" would contain the mean of the mean of "tBodyAcc"(time domain body accelaration) along x-axis.

All columns starting with "MeanOf" are numeric columns.

#### "_stdDevOf_"  and "_MeanOf_"
column names containing with "_stdDevOf_" or "_MeanOf_" relate to the columns from the original dataset containing "std()" or "mean()" respectively. e.g. "MeanOf_MeanOf_tBodyAcc_Y" is the mean of "tBodyAcc-mean()-Y" from the original dataset.


## Complete List of Featues in "tidyData"

1. Activity_Description
2. Subject
3. MeanOf_MeanOf_tBodyAcc_X            
4. MeanOf_MeanOf_tBodyAcc_Y            
5. MeanOf_MeanOf_tBodyAcc_Z            
6. MeanOf_stdDevOf_tBodyAcc_X          
7. MeanOf_stdDevOf_tBodyAcc_Y          
8. MeanOf_stdDevOf_tBodyAcc_Z          
9. MeanOf_MeanOf_tGravityAcc_X         
10. MeanOf_MeanOf_tGravityAcc_Y         
11. MeanOf_MeanOf_tGravityAcc_Z         
12. MeanOf_stdDevOf_tGravityAcc_X       
13. MeanOf_stdDevOf_tGravityAcc_Y       
14. MeanOf_stdDevOf_tGravityAcc_Z       
15. MeanOf_MeanOf_tBodyAccJerk_X        
16. MeanOf_MeanOf_tBodyAccJerk_Y        
17. MeanOf_MeanOf_tBodyAccJerk_Z        
18. MeanOf_stdDevOf_tBodyAccJerk_X      
19. MeanOf_stdDevOf_tBodyAccJerk_Y      
20. MeanOf_stdDevOf_tBodyAccJerk_Z      
21. MeanOf_MeanOf_tBodyGyro_X           
22. MeanOf_MeanOf_tBodyGyro_Y           
23. MeanOf_MeanOf_tBodyGyro_Z           
24. MeanOf_stdDevOf_tBodyGyro_X         
25. MeanOf_stdDevOf_tBodyGyro_Y         
26. MeanOf_stdDevOf_tBodyGyro_Z         
27. MeanOf_MeanOf_tBodyGyroJerk_X       
28. MeanOf_MeanOf_tBodyGyroJerk_Y       
29. MeanOf_MeanOf_tBodyGyroJerk_Z       
30. MeanOf_stdDevOf_tBodyGyroJerk_X     
31. MeanOf_stdDevOf_tBodyGyroJerk_Y     
32. MeanOf_stdDevOf_tBodyGyroJerk_Z     
33. MeanOf_MeanOf_tBodyAccMag          
34. MeanOf_stdDevOf_tBodyAccMag         
35. MeanOf_MeanOf_tGravityAccMag        
36. MeanOf_stdDevOf_tGravityAccMag      
37. MeanOf_MeanOf_tBodyAccJerkMag      
38. MeanOf_stdDevOf_tBodyAccJerkMag     
39. MeanOf_MeanOf_tBodyGyroMag          
40. MeanOf_stdDevOf_tBodyGyroMag        
41. MeanOf_MeanOf_tBodyGyroJerkMag      
42. MeanOf_stdDevOf_tBodyGyroJerkMag    
43. MeanOf_MeanOf_fBodyAcc_X            
44. MeanOf_MeanOf_fBodyAcc_Y            
45. MeanOf_MeanOf_fBodyAcc_Z            
46. MeanOf_stdDevOf_fBodyAcc_X          
47. MeanOf_stdDevOf_fBodyAcc_Y          
48. MeanOf_stdDevOf_fBodyAcc_Z         
49. MeanOf_MeanOf_fBodyAccJerk_X        
50. MeanOf_MeanOf_fBodyAccJerk_Y        
51. MeanOf_MeanOf_fBodyAccJerk_Z       
52. MeanOf_stdDevOf_fBodyAccJerk_X      
53. MeanOf_stdDevOf_fBodyAccJerk_Y      
54. MeanOf_stdDevOf_fBodyAccJerk_Z      
55. MeanOf_MeanOf_fBodyGyro_X           
56. MeanOf_MeanOf_fBodyGyro_Y           
57. MeanOf_MeanOf_fBodyGyro_Z          
58. MeanOf_stdDevOf_fBodyGyro_X         
59. MeanOf_stdDevOf_fBodyGyro_Y         
60. MeanOf_stdDevOf_fBodyGyro_Z         
61. MeanOf_MeanOf_fBodyAccMag          
62. MeanOf_stdDevOf_fBodyAccMag         
63. MeanOf_MeanOf_fBodyBodyAccJerkMag  
64. MeanOf_stdDevOf_fBodyBodyAccJerkMag 
65. MeanOf_MeanOf_fBodyBodyGyroMag     
66. MeanOf_stdDevOf_fBodyBodyGyroMag   
67. MeanOf_MeanOf_fBodyBodyGyroJerkMag 
68. MeanOf_stdDevOf_fBodyBodyGyroJerkMag


## Transformation

The data in the original dataset exists in a set of multiple files as described below:

* X_text.txt and X_train.txt | 
These files contain all the observations for the measured variables

* y_test.txt and y_train.txt | 
These files contain the identifier for the activity corresponding to each row in the files X_test.txt and X_train.txt respectively.

* subject_test.txt and subject_train.txt | 
These files contain the identifier of the subject corresponding to each row in files X_test.txt and X_train.txt

* activity_labels.txt | 
This file contains the description of the activity for each unique activity identifier

* features.txt | 
This file contains the names of each of the measured variables with corresponding column sequence number sorted by the column sequence number


In order to transform the data from its original state to presented in  "tidyData.txt" the following data transformation steps were performed:

#### Step 1. Download Files
* Started by manually downloading the files from the link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Manually put all the data files to be imported into a common folder named "HARAnalysis"

#### Step 2. Set the working directory
Set the working directory as HARAnalysis

#### Step 3. Read the data from test files into local dataframes to create test dataframe
* Read "subject_test.txt" to get the rows for test subjects  
* Read "X_test.txt" to get the observations for test subjects
* Read "y_test.txt" to get rows for activity data for test subjects
* Create testData data frame for test data set by column binding the subject, activity and Observations

#### Step 4. Read the data from train files into local dataframes to create train dataframe
* Read "subject_train.txt" to get the rows for training subjects  
* Read "X_train.txt" to get the observations for training subjects
* Read "y_test.txt" to get rows for activity data for training subjects
* Create trainData data frame for training data set by column binding the subject, activity and Observations


#### Step 5. Merge the test and train dataset
* Binding the together using "rbind"and name the new dataset "mergeData".

#### Step 6. Give meaningful description to the column names 
* Read column names from "features.txt" into a local variable "namesCol"
* Rename the columns 3 through 563 in the dataset "mergeData" with "namesCol" and add descriptive headings for column 1 and 2.

#### Step 7. Create a subset of data with mean and std columns
* Identify the required columns with mean() or std() to be extracted using the grep function.
* Create a dataframe of the subsetted data called "subsetData" to be inclusive of Subject, Activity and columns returned by grep function.

#### Step 8. Add activity description to the "subsetData"
* Read "activity_label.txt" to get the activity descriptions into a local dataframe "namesActivity"
* Rename the columns to "Activity" and "Activity_Description" to aide merging and providing meaningful naming to column headers
* Merge "namesActivity" with the "subsetData" to add the activity description to the subsetted Data

#### Step 9. Reshaping Data to create "reshapedData" dataset
* Melt the "subsetData" into a new dataframe "meltData"
* Using dcast, reshape the "meltData" into a dataframe grouped by Activity and Subject with mean value for each of the variable in "meltData"
* Change column names on the reshaped data to reflect that the values in the column are now the "mean of" the mean or std deviation previously represented by the variables

#### Step 10. Write data to text file "tidyData.txt" without the rownames



### Assumptions
1. Rows in subject_test.txt and subject_train.txt map to the same row in X_text.txt and X_train.txt
2. Rows in y_test.txt and y_train.txt map to the same row in X_text.txt and X_train.txt




[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

