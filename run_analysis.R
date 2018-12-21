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
web_path <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!dir.exists("Course_Project_GCD")){dir.create("./Course_Project_GCD")}
download.file(web_path, destfile = "./Course_Project_GCD/data.zip")
setwd("./Course_Project_GCD")
unzip("data.zip")
file.remove("data.zip")

features <- read_column("./UCI HAR Dataset/features.txt")
features <- features[-seq(from = 1, to = length(features), by = 2)]
features <- data.frame(Feature = features) %>% tbl_df

train_data <- read_dataset("train", features)
test_data <- read_dataset("test", features)




        
        










