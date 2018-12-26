#Johns Hopkins University - Coursera
#Data Science Specialization
#Course: Getting and Cleaning Data
#Task: Course Project
#Date: Dec - 2018
#Author: Carlos Lima Santoro

print(paste("Working directory: ",getwd(), sep = "", collapse = NULL))

#Source the required packages and functions
source("./Functions.R")

#Get data
download.data()

#Read all data required
features <- read_column("./UCI HAR Dataset/features.txt")
features <- features[-seq(from = 1, to = length(features), by = 2)]     #Clean the feature vector
train_data <- read_dataset("train", features)
test_data <- read_dataset("test", features)
labels <- read_sets("./UCI HAR Dataset/activity_labels.txt")

#Merge datasets
names(train_data)[4] <- "Value.Train"
names(test_data)[4] <- "Value.Test"
dataset <- full_join(x = train_data, y = test_data, by = c("y", "subject", "Feature"))
names(labels) <- c("y", "Activity.Label")
dataset <- left_join(x = dataset, y = labels, by = "y")       #Put descreptive activity names

#Manipulation of data
class(dataset$Value.Train) <- "numeric"
class(dataset$Value.Test) <- "numeric"
dataset <- dataset %>%
        select(-y) %>%
        filter(grepl("mean|std", Feature))
final_dataset <- dataset %>%
        group_by(Activity.Label, subject) %>%
        summarise(Value.Train = mean(), Value.Test = mean())
        
        



        
        










