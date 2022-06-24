#load library
library(dplyr)

#download files and unzip
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "UCI")
unzip("UCI")

#read in necessary files
x_test <-read.table("UCI HAR Dataset/test/X_test.txt")
y_test <-read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <-read.table("UCI HAR Dataset/test/subject_test.txt")
x_train <-read.table("UCI HAR Dataset/train/X_train.txt")
y_train <-read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <-read.table("UCI HAR Dataset/train/subject_train.txt")
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#merge test and train data sets and name columns
x_merged <- bind_rows(x_test, x_train)
colnames(x_merged) <- features[,2]
y_merged <- bind_rows(y_test, y_train)
names(y_merged) <- "activity number"
subject_merged <- bind_rows(subject_test, subject_train)
names(subject_merged) <- "subject number"

#select mean and standard deviation columns and prettify column names
mean_std_idx <- grep(".*(mean|std)\\(", features[,2])
features_selected <- features[mean_std_idx, 2]
x_selected <- x_merged[,features_selected]
colnames(x_selected) <- gsub("-mean", " Mean ", colnames(x_selected))
colnames(x_selected) <- gsub("-std", " Standard Deviation ", colnames(x_selected))
colnames(x_selected) <- gsub("[()-]", "", colnames(x_selected))

#associate activity number and activity label
colnames(activity_labels) <- c("activity number", "activity name")
y_merged_labels <- left_join(y_merged, activity_labels, by = "activity number")
all_merged <- bind_cols(y_merged_labels, subject_merged, x_selected)

#calculate mean per variable, activity, and subject
variable_means <- all_merged %>%
    group_by(`activity name`, `subject number`) %>%
    summarise_at(vars(2:67), list(mean = mean))

#write table
write.table(variable_means, "tidy_dataset.txt", row.name = FALSE)