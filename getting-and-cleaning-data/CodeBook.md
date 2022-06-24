This code book identifies the variables in the data set and steps taken to clean the data.

## Data Cleaning
The R script in the file (run_analysis.R) performs the following actions:
- downloads the zip file containing the data and information files
- unzips the file and reads relevant tables into R
- combines test and training data sets
- adds descriptive labels for activity and measurement type
- keeps only means and standard deviations of measurements
- creates a new, tidy data set with means of measurements for each activity and subject
 
## Identifiers
- `subject` - test subject ID
- `activity` - type of activity performed while subject's cell phone was recording data, including
  -`1` `WALKING`
  -`2` `WALKING_UPSTAIRS`
  -`3` `WALKING_DOWNSTAIRS`
  -`4` `SITTING`
  -`5` `STANDING`
  -`6` `LAYING`

## Measurements
The measurements below were taken as follows:
- `t` - time domain variable
- `tBodyAcc-XYZ` and `tGravityAcc-XYZ` - body acceleration and gravity acceleration in the X, Y, and Z planes
- `tBodyAccJerk` and `tBodyGyroJerk` - jerk signals derived in time from linear body acceleration and angular velocity
- `tBodyAccMag`, `tGravityAccMag`, `tBodyAccJerkMag`, `tBodyGyroMag`, `tBodyGyroJerkMag` - magnitude using Euclidean norm of jerk signals
- `fBodyAcc-XYZ`, `fBodyAccJerk-XYZ`, `fBodyGyro-XYZ`, `fBodyAccJerkMag`, `fBodyGyroMag`, `fBodyGyroJerkMag` - fast Fourier transform applied to relevant measurement

Measurements taken:
- `tBodyAcc-XYZ`
- `tGravityAcc-XYZ`
- `tBodyAccJerk-XYZ`
- `tBodyGyro-XYZ`
- `tBodyGyroJerk-XYZ`
- `tBodyAccMag`
- `tGravityAccMag`
- `tBodyAccJerkMag`
- `tBodyGyroMag`
- `tBodyGyroJerkMag`
- `fBodyAcc-XYZ`
- `fBodyAccJerk-XYZ`
- `fBodyGyro-XYZ`
- `fBodyAccMag`
- `fBodyAccJerkMag`
- `fBodyGyroMag`
- `fBodyGyroJerkMag`
