#Johns Hopkins University - Coursera
#Data Science Specialization
#Course: Getting and Cleaning Data
#Task: Course Project
#Date: Dec - 2018
#Author: Carlos Lima Santoro

print(paste("Working directory: ",getwd(), sep = "", collapse = NULL))

#Source the required functions
script_path <- "./Functions.R"
source(script_path)

#Get data
download.data()

features <- read_column("./UCI HAR Dataset/features.txt")
features <- features[-seq(from = 1, to = length(features), by = 2)]

train_data <- read_dataset("train", features)
test_data <- read_dataset("test", features)




        
        










