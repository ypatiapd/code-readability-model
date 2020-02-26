Line_Sums = c()
for (i in 90:max(lloc)){
  Line_Sums[i]=0
}
for (j in 90:max(lloc)){
  
  for (i in 1:length(lloc)){
    if (lloc[i]==j)
      
      Line_Sums[j]=Line_Sums[j]+1
    
  }
}

Line_Sums=na.omit(Line_Sums)
print("Line_Sums:",Line_Sums)
far_right_Outliers_percentage = sum(Line_Sums)/length(lloc)
far_right_Outliers_percentage