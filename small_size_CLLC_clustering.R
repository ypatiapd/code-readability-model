#aporriptetai to small size autis tis metrikis giati o mesos oros=0.136 kai den exei fusiki simasia to clustering tis , den epireazei to readability

a=small_size$CLLC
a=na.omit(a)
b=data.frame(a,0)

plot(b, ylim = c(-0.01, 0.90),  xlab = "Data", ylab = "Density")

b = b[sample(nrow(b),10000),]

plot(b, ylim = c(-0.01, 0.90),  xlab = "Data", ylab = "Density")

source('1d_optimal_silhouette.R')


model=Ckmeans.1d.dp(b$a, k=3, y=1, method=c("linear"), estimate.k=c("BIC"))

plot(model)


mean=mean(a)
cat("mean(CI)=",mean)
