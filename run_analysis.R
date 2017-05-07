library(dplyr)

# data directory
data_dir <- "./UCI HAR Dataset/"

# read in features & activity
features <- read.table(paste0(data_dir, "features.txt"), stringsAsFactors = FALSE)
activity <- read.table(paste0(data_dir, "activity_labels.txt"), stringsAsFactors = FALSE)

# read in train data
train_dir <- paste0(data_dir, "train/")
train_x <- read.table(paste0(train_dir, "X_train.txt"))
train_y <- read.table(paste0(train_dir, "Y_train.txt"))
train_subject <- read.table(paste0(train_dir, "subject_train.txt"))

# read in test data
test_dir <- paste0(data_dir, "test/")
test_x <- read.table(paste0(test_dir, "X_test.txt"))
test_y <- read.table(paste0(test_dir, "Y_test.txt"))
test_subject <- read.table(paste0(test_dir, "subject_test.txt"))

# 1. Merges the training and the test sets to create one data set.
# merge training and test data sets
train <- cbind(train_subject, test = 0, train_x, train_y)
test <- cbind(test_subject, test = 1, test_x, test_y)
merged_data <- rbind(train, test)

# 3. Uses descriptive activity names to name the activities in the data set
# renaming
colnames(merged_data) <- c("subject_id", "test", features$V2, "activity")
merged_data$activity <- factor(merged_data$activity, levels = 1:6, labels = activity$V2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# filter the data to get only mean/std
final_data <- merged_data[,c("subject_id", "test", 
  grep("mean|std", colnames(merged_data), value = TRUE, ignore.case = TRUE), "activity")]

# fix column names
final_data <- merged_data[,c("subject_id", "test", 
  grep("mean|std", colnames(merged_data), value = TRUE, ignore.case = TRUE), "activity")]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(final_data)[3:(ncol(final_data)-1)] <- gsub("BodyBody", "body", colnames(final_data)[3:(ncol(final_data)-1)])
colnames(final_data)[3:(ncol(final_data)-1)] <- gsub("^t", "\\time_", colnames(final_data)[3:(ncol(final_data)-1)])
colnames(final_data)[3:(ncol(final_data)-1)] <- gsub("^f", "\\freq_", colnames(final_data)[3:(ncol(final_data)-1)])
colnames(final_data)[3:(ncol(final_data)-1)] <- gsub("Acc", "_acc_", colnames(final_data)[3:(ncol(final_data)-1)])
colnames(final_data)[3:(ncol(final_data)-1)] <- gsub("\\()", "", colnames(final_data)[3:(ncol(final_data)-1)])
colnames(final_data)[3:(ncol(final_data)-1)] <- gsub("-", "_", colnames(final_data)[3:(ncol(final_data)-1)])
colnames(final_data)[3:(ncol(final_data)-1)] <- gsub("Gyro", "_gyro_", colnames(final_data)[3:(ncol(final_data)-1)])
colnames(final_data)[3:(ncol(final_data)-1)] <- gsub("Mag", "_mag", colnames(final_data)[3:(ncol(final_data)-1)])
colnames(final_data)[3:(ncol(final_data)-1)] <- gsub("__", "_", colnames(final_data)[3:(ncol(final_data)-1)])
colnames(final_data) <- tolower(colnames(final_data))

#. 5. From the data set in step 4, creates a second, independent tidy data set with 
#     the average of each variable for each activity and each subject.
final_data_summary <- final_data %>% group_by(subject_id, activity) %>% summarize_each(funs(mean))
write.table(final_data_summary, 'final_data_summary.txt', row.names = FALSE)
