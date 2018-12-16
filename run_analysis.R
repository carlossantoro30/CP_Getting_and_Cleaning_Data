#Johns Hopkins University - Coursera
#Data Science Specialization
#Course: Getting and Cleaning Data
#Task: Course Project
#Date: Dec - 2018
#Author: Carlos Lima Santoro

#Set the working directoty as the same of the "UCI HAR Dataset" directory
directory <- "D:/Documentos/Carlos/Profissional/Carreira/Coursera/Johns Hopkins - Data Science/3-Getting and Cleanning Data/Course Project"
setwd(directory)

#Source the required functions
source("./CP_Getting_and_Cleaning_Data/Functions.R")

features <- read_column("./UCI HAR Dataset/features.txt")
features <- features[-seq(from = 1, to = length(features), by = 2)]
features <- data.frame(Feature = features) %>% tbl_df

train_data <- read_dataset("train", features)
test_data <- read_dataset("test", features)




        
        










