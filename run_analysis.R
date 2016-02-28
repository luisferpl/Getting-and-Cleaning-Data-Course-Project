
#Human Activity Recognition Using Smartphones Data Set 

# 1. Merges the training and the test sets to create one data set
# 2. Extracts only the measurements on the mean and standard deviation for each measurement
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

# Set the working directory
setwd("C:/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
print (getwd())

# Read the list of all features
features <- read.table("features.txt")[,2]

# Read the labels with their activity name
activity_labels <- read.table("activity_labels.txt")[,2]

# Read the test set
x_test <- read.table("test/x_test.txt")

# Read the test labels
y_test <- read.table("test/y_test.txt")

# Read the subject test
# Each row identifies the subject who performed the test activity for each window sample
# Its range is from 1 to 30
subject_test <-  read.table("test/subject_test.txt")
names(x_test) = features

# Extracts only the measurements on the mean and standard deviation for each measurement
extract_features <- grepl("mean|std",features)
x_test = x_test[,extract_features]

# Uses descriptive activity names to name the activities in the data set
# Links the class labels with their activity name
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind test data
test_data <- cbind(as.data.table(subject_test), y_test, x_test)

# Read the training set
x_train <- read.table("train/x_train.txt")

# Read the training labels
y_train <- read.table("train/y_train.txt")

# Each row identifies the subject who performed the train activity for each window sample
# Its range is from 1 to 30
subject_train <-  read.table("train/subject_train.txt", quote = "\"")
names(x_train) = features

# Extracts only the measurements on the mean and standard deviation for each measurement
x_train = x_train[,extract_features]

# Uses descriptive activity names to name the activities in the data set
# Links the class labels with their activity name
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind training data
train_data <- cbind(as.data.table(subject_train), y_train, x_train)

# Merges the training and the test sets to create one data set
test_train_data <- rbind(test_data, train_data)

# Appropriately labels the data set with descriptive variable names
id_labels = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(test_train_data), id_labels)
melt_data = melt(test_train_data, id = id_labels, measure.vars = data_labels)

# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)


