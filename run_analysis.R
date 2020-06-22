library(dplyr)

##Reading data
unzip("Coursera_Final.zip")
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

##(1)Merging the training and test sets into one data set
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, y, x)

##(2)Extracting mean and SD measurements for each measurement
my_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))

##(3)Using descriptive activity names to name the activities in the data set
my_data$code <- activities[my_data$code, 2]

##(4)Labelling the data set with descriptive variable names
names(my_data)[2] <- "Activity"
names(my_data) <- gsub("Acc", "Accelerometer", names(my_data))
names(my_data) <- gsub("Gyro", "Gyroscope", names(my_data))
names(my_data) <- gsub("BodyBody", "Body", names(my_data))
names(my_data) <- gsub("Mag", "Magnitude", names(my_data))
names(my_data) <- gsub("^t", "Time", names(my_data))
names(my_data) <- gsub("^f", "Frequency", names(my_data))
names(my_data) <- gsub("-mean", "Mean", names(my_data))
names(my_data) <- gsub("-std", "STD", names(my_data))
names(my_data) <- gsub("-freq", "Frequency", names(my_data))

##(5)Creating second tidy data set with average of each variable for each activity and each subject
final_data <- my_data %>% group_by(subject, Activity) %>% summarise_all(funs(mean))
write.table(final_data, "./FinalData.txt", col.names = TRUE, row.names = FALSE)
