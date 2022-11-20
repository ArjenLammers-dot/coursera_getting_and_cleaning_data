# Load required packages
library(dplyr)

# Read text files into tables
df_activity_labels <- read.table("activity_labels.txt")
df_features <- read.table("features.txt")
df_subject_train <- read.table("subject_train.txt")
df_X_train <- read.table("X_train.txt")
df_y_train <- read.table("y_train.txt")
df_subject_test <- read.table("subject_test.txt")
df_X_test <- read.table("X_test.txt")
df_y_test <- read.table("y_test.txt")

# Merge test and train data frames by rows
df_subjects <- rbind(df_subject_test, df_subject_train)
df_X <- rbind(df_X_test, df_X_train)
df_y <- rbind(df_y_test, df_y_train)

# Name the columns in the data frames
colnames(df_subjects) <- c("Subject")
colnames(df_X) <- df_features[, 2]
colnames(df_y) <- c("Activity")

# Replace integers with activity label names, to improve (human) readability
df_y$Activity <- factor(x = df_y$Activity, levels = df_activity_labels$V1, labels = df_activity_labels$V2)

# Select all columns in df_X that contain either the word "mean" or the 
#  abbreviation "std" in their descriptive name.
df_X <- df_X[grepl('mean|std', names(df_X), ignore.case = TRUE)]

# Merge subjects, X, and y into a single data frame by column.
df_tidy <- cbind(df_subjects, df_y, df_X)

# ------------------------------------------------------------------------------
# Create a second data frame, with average measurements grouped by activity 
#  and subject (so 30 subjects x 6 activities = 180 rows)
df_grouped_tidy <- df_tidy
df <- df_grouped_tidy %>%
    group_by(Subject, Activity) %>%
    summarise_all(mean)

write.csv(df, file = "activity_measurements_tidy.txt", col.names = TRUE, row.names = FALSE)
