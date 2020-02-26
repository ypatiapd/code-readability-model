#xwrizoume ta violations  se 2 clusters pou antistoixoun stis times very high readability kai high readability 


a=small_size_violations
a=na.omit(a)
b=data.frame(a,0)

plot(b, ylim = c(-0.01, 0.90),  xlab = "Data", ylab = "Density")

model=Ckmeans.1d.dp(b$a, k=2, y=1, method=c("linear"), estimate.k=c("BIC"))

plot(model)

mean_cluster1=mean(small_size_violations[which(model$cluster==1)])
#mean1=0.072
mean_cluster2=mean(small_size_violations[which(model$cluster==2)])
#mean2=6.748

small_size_violations[which(model$cluster==1)]=0
small_size_violations[which(model$cluster==2)]=1
