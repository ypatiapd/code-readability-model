sum = 0
for (i in 1:3){
  for (j in 1:length(lloc)){
    if (lloc[j]==i)
      sum = sum +1
  }
}
sum 
far_left_Outliers_percentage = (sum / length(lloc))
# The percentage of far-left Outliers
far_left_Outliers_percentage