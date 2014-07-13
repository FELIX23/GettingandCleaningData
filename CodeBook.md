Getting and Cleaning Data --- Course Project
========================================================

Author: Felix

This file contains information about the data transformation from the raw source UCI


###Raw Data


Human Activity Recognition Using Smartphones Dataset
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit� degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

###Accesible at

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Data: Full Description

Available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
()

### Data Set Details

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


### Project- Point 1. 

Merge the training and the test sets to create one data set.

Reading source files:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

Add names to the columns pertaining to the different above-mentioned data sets.
Including general values such as features


Creating the final test_Data according to the following structure
 Activity_Id ---  Activity_Name --- Subject --- Variables(564 columns) 


## Project- Point 2.

Extract only the measurements on the mean and standard deviation for each measurement. 

Steps: 
- Get the positions of the mean and std variables
- Create the new vector with only mean and std values.
- First variables {Activity_Id ---  Activity_Name --- Subject} are also added


## Project- Point 3. 

Use descriptive activity names to name the activities in the data set

Change formats in the column names to make descriptive variable names


## Project- Point 4.

Appropriately label the data set with descriptive variable names.

Included in Point 3.

Change formats in the column names to make descriptive variable names


## Project- Point 5.

Create a second, independent tidy data set with the average of each variable for each activity and each subject

Steps:
-Deselect Activity Name from Complete_Data
-Aggregate data to summarize the mean values of variables per subject and Activity
-Add the Activity Name to the data set 
- Write txt with the data set


