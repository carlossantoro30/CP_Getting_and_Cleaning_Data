#Johns Hopkins University - Coursera
#Data Science Specialization
#Course: Getting and Cleaning Data
#Task: Course Project
#Date: Dec - 2018
#Author: Carlos Lima Santoro

#Set the working directoty as the same of the "UCI HAR Dataset" directory
data_directory <- "C:/Users/csantoro/Downloads/CP_Getting_and_Cleaning_Data-master"
setwd(data_directory)

#Set the scripts directory
script_directory <- "C:/Users/csantoro/Downloads/CP_Getting_and_Cleaning_Data-master"
script_directory <- paste(script_directory, "/Functions.R", sep = "", collapse = NULL)

#Source the required functions
source(script_directory)

features <- read_column("./UCI HAR Dataset/features.txt")
features <- features[-seq(from = 1, to = length(features), by = 2)]
features <- data.frame(Feature = features) %>% tbl_df

train_data <- read_dataset("train", features)
test_data <- read_dataset("test", features)




        
        










