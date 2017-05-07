# Human Activity Recognition
## Coursera Data Cleaning
### Yogesh Saletore

### run_analysis.R
Main R script that can be run to clean the data set. Assumes data set is in the current working directory, but the first path variable can be modified to point to where the data is located. The goals were as follows:
1. Read in and merge the training and test data sets
2. Extract the mean and standard deviation values only
3. Relabel the activities with meaningful names
4. Relabel the variables with more descriptive names
5. Output an independent tidy data set that summarizes the cleaned data set by calculating the mean of each variable for each activity and each subject.

### final_data_summary.txt
The tidy data set summary described in #5 above. I used `dplyr`'s `group_by` and `summarize_each` functions to calculate the mean of each variable. 

### CodeBook.md
Code book for this analysis