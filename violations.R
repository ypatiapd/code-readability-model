names=c()
a=total_violations[,11:ncol(total_violations)]
for(i in 1:ncol(a)){
cat("sum",i,"=",sum(a[,i]),"\n")
if(sum(a[,i])>30000) {
  names=c(names,names(a[1,1:ncol(a)])[i])
} 
}
for(i in 1:length(names))
  cat(names[i],"\n")




names(a[,])[a[1,]>10000]

names(a[1,11:ncol(a)])[which(a[])]