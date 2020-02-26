#xwrizoume ta violations  se 2 clusters pou antistoixoun stis times very high readability kai medium readability 

a=large_size_violations
a=na.omit(a)
b=data.frame(a,0)

plot(b, ylim = c(-0.01, 0.90),  xlab = "Data", ylab = "Density")

model=Ckmeans.1d.dp(b$a, k=2, y=1, method=c("linear"), estimate.k=c("BIC"))

plot(model)

mean_cluster1=mean(large_size_violations[which(model$cluster==1)])
#mean1=0.521
mean_cluster2=mean(large_size_violations[which(model$cluster==2)])
#mean2=13.072

large_size_violations[which(model$cluster==1)]=0
large_size_violations[which(model$cluster==2)]=1