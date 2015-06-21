# Getting and Cleaning Data project
The script run_analysis.R works by reading the data files that should be in the working directory.
The files are:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'X_train.txt': Training set.
- 'y_train.txt': Training labels.
- 'X_test.txt': Test set.
- 'y_test.txt': Test labels.
- 'subject_train.txt': Training: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'subject_test.txt': Test: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The script follow the instructions for the project (as commented in the code):

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

 

