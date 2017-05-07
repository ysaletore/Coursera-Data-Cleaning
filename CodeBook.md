# Data Cleaning Course Project Code Book
#### Yogesh Saletore

`run_analysis.R` can be used to perform the main data cleaning. A variable specifies the location of the data set, but it assumes it's extracted in the current working directory. 

# Required Libraries
`dplyr` is required. 

# Variables
1. `data_dir`: Location of the data set
2. `features` and `activity` hold the names of the features and activities
3. `train_dir` and `test_dir` specify the locations of the training and test datasets, respectively.
4. `train` and `test` `_x`, `_y`, and `_subject` are used to load in the training and test data

# Data
1. `merged_data`: merged test and training data set. The `train` variable is used to define which is which (= 1 for test)
2. `filtered_data`: includes only those columns with either the mean or the standard deviation, and the `subject_id`, `test`, and `activity` columns.
3. `final_data`: final data set with variable and columns cleaned. The final data set to use for analysis.
4. `final_data_summary`: tidy data set summarizing each of the variables in `final_data`, calculating the mean of each variable for each `subject_id` and `activity`.

# Transformations
1. `test` variable used to equal `1` for test data, `0` for training data
2. Used `activity` and `features` to rename activity and variable names, respectively
3. Used `gsub` to filter for columns that contain the mean and standard deviation
4. Used series of `gsub` expressions to clean up variable names
5. Used `dplyr`'s `group_by` and `summarize_each` to calculate the means of each of the variables for each subject and activity