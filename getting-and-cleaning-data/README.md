# Getting-and-Cleaning-Data-Course-Project

This repo contains files related to the Getting and Cleaning Data course on Coursera in the Johns Hopkins Data Science Toolbox specialization. The purpose is to prepare a data set downloaded from the web for further analysis. This data set contains measurements from accelerometers in subjects' cell phones while performing six activities as noted in the data set. Futher information on the data set can be found at the following web address: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script in the file (run_analysis.R) performs the following actions:
- downloads the zip file containing the data and information files
- unzips the file and reads relevant tables into R
- combines test and training data sets
- adds descriptive labels for activity and measurement type
- keeps only means and standard deviations of measurements
- creates a new, tidy data set with means of measurements for each activity and subject

A code book is also provided to describe the measurements.
