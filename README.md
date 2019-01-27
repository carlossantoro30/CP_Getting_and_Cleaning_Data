# CP_Getting_and_Cleaning_Data

Repository for the Johns Hopkins Course Project of Getting and Cleaning Data.

The data on this repository come from **Human Activity Recognition Using Smartphones Data Set** project, that can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. A transformation is applied on the data of this project by the **run_analysis.R**, script to produce *final_dataset.csv*. The *final_dataset.csv* is tidy, because it follows the tidy data principles (Wickham 2014):
 * Eeach variable forms a column.
 * Each observation forms a row.
 * Each type of observational unit forms a table.

## Files

* **run_analysis.R:** Main script which get the required data, apply the required transformation producing and saving the *final_dataset.csv*.
* **Functions.R:** Script which is called by *run_analysis.R*. It contains all needed packages and functions of the main script. It was coded separately to make this project more organized and readable.
* **final_dataset.csv:** The dataset produced by *run_analysis.R* script. It come from the *final_dataset* variable of this script.
* **Codebook:** A codebook that explains the details of *final_dataset.csv*.

## Sourcing the Main Script

The main script *run_analysis.R* must be sourced in the same directory of *Funtions.R* script. The main script will create some directories and files. The data required will be downloaded automatically, so a web connection is required.

## Reading *final_dataset.csv*

If *final_dataset.csv* is on the working directory, it can be loaded into R by using the code below:

```rscript
final_dataset <- read.csv(file = "final_dataset.csv",
                      header = TRUE,
                      colClasses = c("character",
                                     "character",
                                     "character",
                                     "numeric")
                      )
´´´

## References

Wickham H (2014). Tidy Data. Journal of Statistical Software, 59(10), 4.
 URL https://www.jstatsoft.org/article/view/v059i10/v59i10.pdf
