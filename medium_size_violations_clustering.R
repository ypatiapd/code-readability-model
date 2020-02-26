#xwrizoume ta violations  se 2 clusters pou antistoixoun stis times  high readability kai medium readability 
#efoson to megethos twn methodwn einai polu mikro 

a=medium_size_violations
a=na.omit(a)
b=data.frame(a,0)

plot(b, ylim = c(-0.01, 0.90),  xlab = "Data", ylab = "Density")

model=Ckmeans.1d.dp(b$a, k=2, y=1, method=c("linear"), estimate.k=c("BIC"))

plot(model)

mean_cluster1=mean(medium_size_violations[which(model$cluster==1)])
#mean1=0.194
mean_cluster2=mean(medium_size_violations[which(model$cluster==2)])
#mean2=8.701

medium_size_violations[which(model$cluster==1)]=0
medium_size_violations[which(model$cluster==2)]=1