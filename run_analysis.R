# Johns Hopkins University - Coursera
# Data Science Specialization
# Course: Getting and Cleaning Data
# Task: Course Project
# Date: Dec - 2018
# Author: Carlos Lima Santoro

# Print the working directory
print(paste("Working directory: ",getwd(), sep = "", collapse = NULL))

# Save the working directory to back to it to save the final_dataset.csv
initial_path <- getwd()

# Source the required packages and functions
source("./Functions.R")

# Get data
download.data()

# Read all data required
features <- read_column("./UCI HAR Dataset/features.txt")
features <- features[-seq(from = 1, to = length(features), by = 2)]     #Clean the feature vector
train_data <- read_dataset("train", features)
test_data <- read_dataset("test", features)
labels <- read_sets("./UCI HAR Dataset/activity_labels.txt")

# Merge datasets
names(train_data)[4] <- "Train"
names(test_data)[4] <- "Test"
dataset <- full_join(x = train_data, y = test_data, by = c("y", "subject", "Feature"))
names(labels) <- c("y", "Activity.Label")
dataset <- left_join(x = dataset, y = labels, by = "y")

# Manipulation of "dataset" to build the dataset of step 5 of assignment description
class(dataset$Train) <- "numeric"
class(dataset$Test) <- "numeric"
dataset <- dataset %>%
        select(-y) %>%
        filter(grepl("mean|std", Feature)) %>%
        group_by(Activity.Label, subject) %>%
        summarise(mean(Test), mean(Train))
names(dataset) <- sub("mean\\Q(\\ETest\\Q)\\E", "Test", names(dataset))
names(dataset) <- sub("mean\\Q(\\ETrain\\Q)\\E", "Train", names(dataset))
final_dataset <- gather(dataset, key = "Set.Type", value = "Mean.Value", -Activity.Label, -subject)

# Saving final_dataset in the working directory
setwd(initial_path)
write.csv(final_dataset,
          file = "final_dataset.csv",
          append = TRUE,
          fileEncoding = "UTF-8",
          row.names = FALSE)