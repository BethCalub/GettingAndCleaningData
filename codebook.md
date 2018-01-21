# Code Book
## The following were the things done in relation to this project.
### The sources of file for this project came from:
- The data linked represent data collected from the accelerometers from the Samsung Galaxy S smartphone. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
- The data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
### There were several files associated with the source:
- x: data (rows) of feature measurements
- y: the activity labels corresponding to each data of x
- subject : the subjects on which each row x was measured
- features : these were stored in a file called features.txt
- activity : the list of activities for each subject is stored in activity_labels.txt
### Extracted files.
- From the train folder: xtrain was read from X_train.txt; ytrain from y_train.txt; subjtrain from subject_train.txt
- From the test folder:  xtest was read from X_test.txt; ytest from y_test.txt; subjtest from subject_test.txt
### Merging the files.
- The files from the training and the test sets were merged to create one data set by using rbind() function.
- xmerged merges xtrain and xtest 
- ymerged merges ytrain and ytest 
- subjmerged merges subjtrain and subjtest 
### Transformations on the merged data set
- The Mean ans Standard deviations were extracted from each measurement
