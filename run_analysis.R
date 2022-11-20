# Load required packages
library(dplyr)
library(data.table)

# Read text files into tables
df_activity_labels <- read.table("activity_labels.txt")
df_features <- read.table("features.txt")
df_subject_train <- read.table("subject_train.txt")
df_X_train <- read.table("X_train.txt")
df_y_train <- read.table("y_train.txt")
df_subject_test <- read.table("subject_test.txt")
df_X_test <- read.table("X_test.txt")
df_y_test <- read.table("y_test.txt")

# Merge test and train data frames
df_X <- rbind(df_X_test, df_X_train)
df_y <- rbind(df_y_test, df_y_train)

# Name the columns in the data frames
colnames(df_X) <- df_features[, 2]
colnames(df_y) <- c("Activity")

# Replace integers with activity label names, using a factor
df_y$Activity <- factor(x = df_y$Activity, levels = df_activity_labels$V1, labels = df_activity_labels$V2)

# Select all columns in df_X that contain either the word "mean" or the 
#  abbreviation "std" in their descriptive name.
df_X <- df_X[grepl('mean|std', names(df_X), ignore.case = TRUE)]
