# Load required packages

# Read textfiles into tables
df_activity_labels <- read.table("activity_labels.txt")
df_features <- read.table("features.txt")
df_subject_train <- read.table("subject_train.txt")
df_X_train <- read.table("X_train.txt")
df_y_train <- read.table("y_train.txt")
df_subject_test <- read.table("subject_test.txt")
df_X_test <- read.table("X_test.txt")
df_y_test <- read.table("y_test.txt")