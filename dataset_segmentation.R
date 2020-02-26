lloc=total_metrics$LLOC
tlloc=total_metrics$TLLOC
source("TLLOC_Complexity_farleft_outliers.R")

# Instances_with_TLLOC_complexity = [0    0    6 1781 2920]
# We deduce that methods with 1 to 3 lines of code , have maximum readability and zero complexity so we characterize the
# former as far-left outliers

source("far_left_Outliers_percentage.R")

# We create matrixes of objects based on their LLOC value .
# We define as small size methods those that have between 4 and 15 logical lines of code (less than a pageful)
# We define as medium size methods those that have between 16 and 35 logical lines of code (roughly a pageful)
# We define as large size methods those that have between 36 and 90 logical lines of code (code that covers 1 to 3 pages)
# We define as far right Outliers those that have over 91 logical lines of code (by definition non-readable but will be 
# examined for their complexity status)

small_size=total_metrics[which((total_metrics$LLOC>3)&(total_metrics$LLOC<16)),]
medium_size=total_metrics[which((total_metrics$LLOC>17)&(total_metrics$LLOC<35)),]
large_size=total_metrics[which((total_metrics$LLOC>36)&(total_metrics$LLOC<91)),]
far_right_outliers=total_metrics[which(total_metrics$LLOC>90),]

