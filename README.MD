#Analysis and the script functionality:

The run_analysis is a R script to take the input files (mentioned in the directory)and produce a tidy data set and generates a summary file- (mean of measures per activity per subjectcode).

The script takes the following training files as input:
activity_labels.txt-  Activity labels
features.txt-- Names of the measurments in x_train file.
x_train -Dataset of measurements
y_train - Dataset of the activity code for each measurement in x_train
subject_train.txt - the subject who performed the activity.

and test files:
x_test -Dataset of measurements
y_test - Dataset of the activity code for each measurement in x_train
subject_test.txt - the subject who performed the activity.

Clean the variables names as follows:
1. Removed()
2. Replaced _,,with .
3. lower case

Combined the train and test data and joined with the activity data to get the activity desc on activity id.

The final data set- Activity desc, Performer(subjectcode), all measures.

The measures were grouped by ActivityDesc,Performer(subjectcode) and were sumarised using a mean function. The summary is written to the summary file.

