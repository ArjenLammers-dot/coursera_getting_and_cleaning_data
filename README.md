# coursera_getting_and_cleaning_data

Activity_measurements_tidy.txt contains a modified version of the data set in the provided zipfile (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  
For a full description of the data in the original data set, view the readme.txt in the zipfile.  
  
activity_measurements_tidy.txt is the result of the following steps performed on the data from the zipfile:

1. All test and train data were merged rowwise
2. Subject, X and Y sets have been merged columnwise to a single data set
3. Only measurements regarding the mean or standard deviation have been kept.
4. Activities have been labeled by name, not by id, using activity_labels.txt
5. The resulting rows have been combined by unique combination of subject and activity. The resulting value is the average of all measurements known for that specific combination of subject/activity.
