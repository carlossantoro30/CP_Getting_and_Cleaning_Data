#Functions of the run_analysis.R script.

library(dplyr)
library(tibble)
library(readtext)
library(stringr)
library(tidyr)

download.data <- function(){
        #This function download the required data and save it in a new directory.

        web_path <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        if(!dir.exists("Course_Project_GCD")){
                dir.create("./Course_Project_GCD")
                download.file(web_path, destfile = "./Course_Project_GCD/data.zip")
                setwd("./Course_Project_GCD")
                unzip("data.zip")
                file.remove("data.zip")
        }
        else{
                setwd("./Course_Project_GCD")
                if(!dir.exists("UCI HAR Dataset")){
                        download.file(web_path, destfile = "./data.zip")
                        unzip("data.zip")
                        file.remove("data.zip")
                }
        }
}

read_sets <- function(fx){
        #
        
        readtext(fx)[[2]] %>%
                strsplit("\n") %>%
                lapply(str_squish) %>%
                lapply(strsplit, split = " ") %>%
                data.frame() %>%
                t() %>%
                tbl_df()
}

read_column <- function(cpath){
        #This function reads a .txt file where each value separated by
        #       whitespace is an element of a vector. It returns the character
        #       vector.

        readtext(cpath) %>%
                str_squish() %>%
                str_split(pattern = " ") %>%
                unlist()
}

read_dataset <- function(dataset, features){
        #This function reads the training or test dataset.

        f <- paste("./UCI HAR Dataset/", dataset, collapse = NULL, sep = "")

        fx <- paste(f, "/X_", dataset, ".txt", collapse = NULL, sep = "")
        x_df <- read_sets(fx)

        fy <- paste(f, "/Y_", dataset, ".txt", collapse = NULL, sep = "")
        f_subject <- paste(f, "/subject_", dataset, ".txt", collapse = NULL, sep = "")
        y <- read_column(fy)
        subject <- read_column(f_subject)

        #names(x_df) <- paste(y, subject, sep = "_", collapse = NULL)
        names(x_df) <- features
        x_df <- add_column(x_df, y, subject)

        df <- x_df %>%
                gather(key = "Feature", value = "Value", -y, -subject)
        df
}
