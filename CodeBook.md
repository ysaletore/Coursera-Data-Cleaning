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

# final_data_summary.txt
## Identifiers
1. `subject_id`: subject identifier (integer)
2. `activity`: activity subject was performing. (factor)
  * `WALKING`
  * `WALKING_UPSTAIRS`
  * `WALKING_DOWNSTAIRS`
  * `SITTING`
  * `STANDING`
  * `LAYING`
3. `test`: = 1 for test data set, 0 for training) (integer)
  
## Variables
These variables describe the mean of the original data variables. `time_` refers to time, `freq_` frequency, and `angle` is the angle. `acc` means acceleration, `gyro` means gyroscope, `mag` means magnitude. `_mean_` is the mean from the data set and `_std_` is the standard deviation. `_x`, `_y_`, and `_z` refer to the x-, y-, and z-axes, respectively. 
1. `time_body_acc_mean_x`: (numeric) 
1. `time_body_acc_mean_y`: (numeric) 
1. `time_body_acc_mean_z`: (numeric) 
1. `time_body_acc_std_x`: (numeric) 
1. `time_body_acc_std_y`: (numeric) 
1. `time_body_acc_std_z`: (numeric) 
1. `time_gravity_acc_mean_x`: (numeric) 
1. `time_gravity_acc_mean_y`: (numeric) 
1. `time_gravity_acc_mean_z`: (numeric) 
1. `time_gravity_acc_std_x`: (numeric) 
1. `time_gravity_acc_std_y`: (numeric) 
1. `time_gravity_acc_std_z`: (numeric) 
1. `time_body_acc_jerk_mean_x`: (numeric) 
1. `time_body_acc_jerk_mean_y`: (numeric) 
1. `time_body_acc_jerk_mean_z`: (numeric) 
1. `time_body_acc_jerk_std_x`: (numeric) 
1. `time_body_acc_jerk_std_y`: (numeric) 
1. `time_body_acc_jerk_std_z`: (numeric) 
1. `time_body_gyro_mean_x`: (numeric) 
1. `time_body_gyro_mean_y`: (numeric) 
1. `time_body_gyro_mean_z`: (numeric) 
1. `time_body_gyro_std_x`: (numeric) 
1. `time_body_gyro_std_y`: (numeric) 
1. `time_body_gyro_std_z`: (numeric) 
1. `time_body_gyro_jerk_mean_x`: (numeric) 
1. `time_body_gyro_jerk_mean_y`: (numeric) 
1. `time_body_gyro_jerk_mean_z`: (numeric) 
1. `time_body_gyro_jerk_std_x`: (numeric) 
1. `time_body_gyro_jerk_std_y`: (numeric) 
1. `time_body_gyro_jerk_std_z`: (numeric) 
1. `time_body_acc_mag_mean`: (numeric) 
1. `time_body_acc_mag_std`: (numeric) 
1. `time_gravity_acc_mag_mean`: (numeric) 
1. `time_gravity_acc_mag_std`: (numeric) 
1. `time_body_acc_jerk_mag_mean`: (numeric) 
1. `time_body_acc_jerk_mag_std`: (numeric) 
1. `time_body_gyro_mag_mean`: (numeric) 
1. `time_body_gyro_mag_std`: (numeric) 
1. `time_body_gyro_jerk_mag_mean`: (numeric) 
1. `time_body_gyro_jerk_mag_std`: (numeric) 
1. `freq_body_acc_mean_x`: (numeric) 
1. `freq_body_acc_mean_y`: (numeric) 
1. `freq_body_acc_mean_z`: (numeric) 
1. `freq_body_acc_std_x`: (numeric) 
1. `freq_body_acc_std_y`: (numeric) 
1. `freq_body_acc_std_z`: (numeric) 
1. `freq_body_acc_meanfreq_x`: (numeric) 
1. `freq_body_acc_meanfreq_y`: (numeric) 
1. `freq_body_acc_meanfreq_z`: (numeric) 
1. `freq_body_acc_jerk_mean_x`: (numeric) 
1. `freq_body_acc_jerk_mean_y`: (numeric) 
1. `freq_body_acc_jerk_mean_z`: (numeric) 
1. `freq_body_acc_jerk_std_x`: (numeric) 
1. `freq_body_acc_jerk_std_y`: (numeric) 
1. `freq_body_acc_jerk_std_z`: (numeric) 
1. `freq_body_acc_jerk_meanfreq_x`: (numeric) 
1. `freq_body_acc_jerk_meanfreq_y`: (numeric) 
1. `freq_body_acc_jerk_meanfreq_z`: (numeric) 
1. `freq_body_gyro_mean_x`: (numeric) 
1. `freq_body_gyro_mean_y`: (numeric) 
1. `freq_body_gyro_mean_z`: (numeric) 
1. `freq_body_gyro_std_x`: (numeric) 
1. `freq_body_gyro_std_y`: (numeric) 
1. `freq_body_gyro_std_z`: (numeric) 
1. `freq_body_gyro_meanfreq_x`: (numeric) 
1. `freq_body_gyro_meanfreq_y`: (numeric) 
1. `freq_body_gyro_meanfreq_z`: (numeric) 
1. `freq_body_acc_mag_mean`: (numeric) 
1. `freq_body_acc_mag_std`: (numeric) 
1. `freq_body_acc_mag_meanfreq`: (numeric) 
1. `freq_body_acc_jerk_mag_mean`: (numeric) 
1. `freq_body_acc_jerk_mag_std`: (numeric) 
1. `freq_body_acc_jerk_mag_meanfreq`: (numeric) 
1. `freq_body_gyro_mag_mean`: (numeric) 
1. `freq_body_gyro_mag_std`: (numeric) 
1. `freq_body_gyro_mag_meanfreq`: (numeric) 
1. `freq_body_gyro_jerk_mag_mean`: (numeric) 
1. `freq_body_gyro_jerk_mag_std`: (numeric) 
1. `freq_body_gyro_jerk_mag_meanfreq`: (numeric) 
1. `angle(tbody_acc_mean,gravity)`: (numeric) 
1. `angle(tbody_acc_jerkmean),gravitymean)`: (numeric) 
1. `angle(tbody_gyro_mean,gravitymean)`: (numeric) 
1. `angle(tbody_gyro_jerkmean,gravitymean)`: (numeric) 
1. `angle(x,gravitymean)`: (numeric) 
1. `angle(y,gravitymean)`: (numeric) 
1. `angle(z,gravitymean)`: (numeric) 