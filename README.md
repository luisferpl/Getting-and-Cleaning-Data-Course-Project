# Getting-and-Cleaning-Data-Course-Project
Human Activity Recognition Using Smartphones Data Set

The script run_analysis.R of this project works as follows: 

1. Sets the working directory.
2. Reads the list of all features.
3. Reads the labels with their activity name.
4. Reads the test and training set.
5. Reads the test and training labels.
6. Reads the subject test, each row identifies the subject who performed the test activity for each window sample and its range is from 1 to 30.
7. Extracts only the measurements on the mean and standard deviation for each measurement.
8. Uses descriptive activity names to name the activities in the data set and links the class labels with their activity name.
9. Binds the test and training data.
10. Merges the training and the test sets to create one data set.
11. Creates labels of the data set with descriptive variable names.
12. From the previous data set, creates a second independent tidy data set with the average of each variable for each activity and each subject called tidy.txt.

