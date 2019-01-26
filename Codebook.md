# Codebook

This document explains the details of **final_dataset.csv**.

This dataset come from the "final_dataset" variable of *run_analysis.R* script and has 360 rows by 4 columns. The missing values (NA) was kept.

## Dataset Variables

**Activity.Label:** Text variable. The body action played by the volunteer when the accelerometer signals was recorded.
        * WALKING
        * WALKING_UPSTAIRS
        * WALKING_DOWNSTAIRS
        * SITTING
        * STANDING
        * LAYING

**Subject:** Text variable. Number Key that identifies the volunteer that played the actions. There are 30 unique subjects.

**Set.Type:** Text variable. String that indicates if the set of the action was a test set or a training set.

**Mean.Value** Numeric variable. The average value of the features. This is calculated just on the mean and standard deviation features ans is a float.
