---
title: ""
output: html_document
---

The tidy data set "FinalDataSet.txt" has been created by running the script "run_analysis.R".

Assuming the working direktory is set with data folder "UCI HAR Dataset" in it. What the scrip does is - it:

* reads the data files from "UCI HAR Dataset" folder and subfolders "train" and "test" into R;

* gives the names for variables;

* binds data into two separate data frames - data from "train" subfolder and data from "test" subfolder;

* binds together both data frames;

* extracts only the variables that are mean or standard deviation for each measurement;

* appropriately labels the data set with descriptive variable names (by substituting "-", "(", ")", "," in variable names);

* names the activities in the data set using file "activity_labels.txt";

* creates a second, independent tidy data set with the average of each variable for each activity and each subject;

* writes the "FinalDataSet.txt".

"CodeBook.md" is a code book that describes the variables, the data, and transformations that has been performed to clean up the data.