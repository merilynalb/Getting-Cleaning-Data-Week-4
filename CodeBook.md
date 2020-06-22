# Tidy data set description

The final tidy data set was created from the code written in the ```run_analysis.R``` file

## 1. Download the dataset
Data was downloaded from UCI HAR Dataset

## 2. Assign data to variables
   * ```features``` = ```features.txt```
   * ```activities``` = ```activity_labels.txt```
   * ```subject_test``` = ```text/subject_test.txt```
   * ```X_test``` = ```test/X_test.txt```
   * ```Y_test``` = ```test/Y_test.txt```
   * ```subject_train``` = ```train/subject_train.txt```
   * ```X_train``` = ```trains/X_train.txt```
   * ```Y_train``` = ```train/Y_train.txt```

## Merging data together 
   * ```x```created by merging ```x_test``` with ```x_train``` using rbind() function
   * ```y``` created by merging ```y_test``` with ```y_train``` using rbind() function
   * ```subject``` created by merging ```subject_test``` with ```subject_train``` using rbind() function
   * ```merged_data``` created by merging ```subject```, ```x``` and ```y``` using cbind() function
          
 ## Extracting only the mean and standard deviation measurements
  ```my_data``` created by subsetting ```merged_data```. Selecting columns ```subject``` and ```code```, along with measurements ```mean``` and ```std``` (standard deviation) for each measurement
  
  ## Using descriptive activity names to name the activities in the data set
 ```code``` column of the ```my_data``` was replaced with corresponding activity taken from second column of the ```activities``` variable
 
 ## Appropriately labelling the data set with descriptive variable names
   * ```code``` column was renamed ```Activity```
   * ```Acc``` was renamed ```Accelerometer```
   * ```Gyro``` was renamed ```Gyroscope```
   * ```BodyBody``` was renamed ```Body```
   * ```Mag``` was renamed ```Magnitude```
   * ```^t``` was renamed ```Time```
   * ```^f``` was renamed ```Frequency```
   * ```-mean```was renamed ```Mean```
   * ```-std``` was renamed ```STD```
   * ```-freq``` was renamed ```Frequency```
      
  ## From previous step, create a tidy data set with average of each variable for each activity
  ```FinalData.txt``` is the final, independent, tidy file created from the code written in R. It contains 180 columns and 88 rows, with average calculated for each variable in each activity
