#Clear workspace

rm(list=ls())


########################## POINT 1

# Download general vectors (feautues names and activities labels) for both data sets 

features = read.table("UCI HAR Dataset/features.txt",header = FALSE)
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt",header= FALSE)


# Download text files to create test Data Set. 
# X_test.txt  Observation values. 564 Variables and 2947 Observations (rows)
# y_test.txt  Activity pertaining to each observation. 6 Different activities
# subject.txt Subject of the corresponding observation, by rows. 

X_test = read.table("UCI HAR Dataset/test/X_test.txt",header= FALSE)
y_test = read.table("UCI HAR Dataset/test/y_test.txt",header= FALSE)
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt",header= FALSE)

#Adding names to the columns pertaining to the different above-mentioned data sets.
#Including general values such as features.

colnames(X_test) = features[,2]
colnames(activity_labels)=c("Activity_Id", "Activity_Name")
colnames(y_test) = "Activity_Id"
colnames(subject_test) = "Subject"

#Creating the final test_Data according to the following structure
#  Activity_Id ---  Activity_Name --- Subject --- Variables(564 columns) 

test_Data = cbind(merge(y_test,activity_labels,by="Activity_Id"),subject_test,X_test)

# Download text files to create test Data Set. 
# X_train.txt  Observation values. 564 Variables and 7352 Observations (rows)
# y_train.txt  Activity pertaining to each observation. 6 Different activities
# subject.txt Subject of the corresponding observation, by rows. 

Y_train = read.table("UCI HAR Dataset/train/X_train.txt",header= FALSE)
y_train = read.table("UCI HAR Dataset/train/y_train.txt", header= FALSE)
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt",header= FALSE)

#Adding names to the columns pertaining to the different above-mentioned data sets.
#Including general values such as features.

colnames(Y_train) = features[,2]
colnames(y_train) = "Activity_Id"
colnames(subject_train) = "Subject"

#Creating the final train_Data according to the following structure
#  Activity_Id ---  Activity_Name --- Subject --- Variables(564 columns) 

train_Data = cbind(merge(y_train,activity_labels,by="Activity_Id"),subject_train,Y_train)

#Releasing memory. Deleting all internal variables but the remaining test_Data and
# train_Data

rm(list=setdiff(ls(), c("test_Data","train_Data")))

# Create complete_Data adding test data to the train data.

complete_Data = rbind (train_Data, test_Data)

########################## POINT 2 & POINT 3

# Getting the positions of teh mean and std variables

mean_Positions = grep("mean",colnames(complete_Data))
std_Positions = grep("std",colnames(complete_Data))

# Create the new vector with only mean and std values.
# First variables {Activity_Id ---  Activity_Name --- Subject} are also added

position_vector = c(1,2,3, mean_Positions, std_Positions)
mean_std_complete_Data = complete_Data[position_vector]

#Release memory. Deleting several internal

rm(list=setdiff(ls(), c("test_Data","train_Data","complete_Data","mean_std_complete_Data")))


########################## POINT 2 & POINT 3

colNames = colnames(mean_std_complete_Data)

# Change formats in the column names to make descriptive variable names

for (i in 1:length(colNames)){
  
  colNames[i] = paste(toupper(substring(colNames[i],1,1)),substring(colNames[i],2,nchar(colNames[i])),sep="")
  colNames[i] = gsub("-std()","_StdDev",colNames[i])
  colNames[i] = gsub("-mean()","_Mean",colNames[i])
  colNames[i] = gsub("T","Time_",colNames[i])
  colNames[i] = gsub("F","Frequency_",colNames[i])
  colNames[i] = gsub("Body","Body_",colNames[i])
  colNames[i] = gsub("Gravity","Gravity_",colNames[i])
  colNames[i] = gsub("Gyro","Gyro_",colNames[i])
  colNames[i] = gsub("Acc","Acc_",colNames[i])
  colNames[i] = gsub("Jerk","Jerk_",colNames[i])
  colNames[i] = gsub("Mag","Magnitude",colNames[i])
  
};


colnames(mean_std_complete_Data)= colNames

#Write txt file with mean_std_complete_Data
write.table(mean_std_complete_Data, './mean_std_complete_Data.txt',row.names=TRUE,sep='\t');

########################## POINT 2 & POINT 3

#Deselect Activity Name from Complete_Data
complete_Data_withouActivityName  = complete_Data[,names(complete_Data) != 'Activity_Name'];


activity_labels = read.table("UCI HAR Dataset/activity_labels.txt",header= FALSE)
colnames(activity_labels) = c("Activity_Id","Activity_Name")

# Aggregatting data to summarize the mean values of variables per subject and Activity
second_Data_Set    = aggregate(complete_Data_withouActivityName[,names(complete_Data_withouActivityName) != c('Activity_Id','Subject')],by=list(Activity_Id=complete_Data_withouActivityName$Activity_Id,Subject = complete_Data_withouActivityName$Subject),mean);

# Adding the Activity Name 
second_Data_Set    = merge(activity_labels,second_Data_Set,by='Activity_Id',all.x=TRUE);

colNames = colnames(mean_std_complete_Data)

# Change formats in the column names to make descriptive variable names

#Write txt file with second data set
write.table(second_Data_Set, './SecondDataSet.txt',row.names=TRUE,sep='\t');