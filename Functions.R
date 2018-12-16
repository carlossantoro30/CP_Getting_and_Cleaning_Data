#Functions of the run_analysis.R script.

library(dplyr)
library(readtext)
library(stringr)
library(tidyr)

read_sets <- function(fx){
        #This function reads a .txt file where each line is a vector where
        #       each element is separated by whitespaces.
        #It returns a tibble data frame where each column correspond to a line
        #       from the .txt. 
        
        readtext(fx)[[2]] %>%
                strsplit("\n") %>%
                lapply(str_squish) %>%
                lapply(strsplit, split = " ") %>%
                data.frame() %>%
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
        
        f <- paste("./UCI HAR Dataset/", dataset, collapse = NULL)
        
        fx <- paste(f, "/X_", dataset, ".txt", collapse = NULL)
        x_df <- read_column(fx)
        
        fy <- paste(f, "/Y_", dataset, ".txt", collapse = NULL)
        f_subject <- paste(f, "/subject_", dataset, ".txt", collapse = NULL)
        y <- read_column(fy)
        subject <- read_column(f_subject)
        
        names(x_df) <- paste(y, subject, sep = "_", collapse = NULL)
        x_df <- cbind(x_df, features)
        
        df <- x_df %>%
                gather(key = "Label_Subject", value = "Value", -Feature) %>%
                separate(Label_Subject, into = c(Label, Subject), sep = "_")
        df
}
