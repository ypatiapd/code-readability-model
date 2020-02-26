Line_Sums_Of_small_outliers = c(0,0,0,0,0)
Instances_with_TLLOC_complexity= c(0,0,0,0,0)


for (j in 1:5){
  
  for (i in 1:length(lloc)){
    if (lloc[i]==j){
      
      Line_Sums_Of_small_outliers[j]=Line_Sums_Of_small_outliers[j]+1
      if (tlloc[i]> 1.5*lloc[i])
        Instances_with_TLLOC_complexity[j]=Instances_with_TLLOC_complexity[j]+1
    }
  }
}
Instances_with_TLLOC_complexity