# dialegoume centers=3 , efoson ola ta silhouettes einai paromoia
# oxi 2 giati to CD einai simantiki metriki gia methodous megalou mikous

#2 clusters mean_sil=0.89
#3 clusters mean_sil=0.87
#4 clusters mean_sil=0.88
#5 clusters mean_sil=0.88

a=small_size$CD
a=na.omit(a)
b=data.frame(a,0)

plot(b, ylim = c(-0.01, 0.90),  xlab = "Data", ylab = "Density")

b = b[sample(nrow(b),1000),]

plot(b, ylim = c(-0.01, 0.90),  xlab = "Data", ylab = "Density")

source('1d_optimal_silhouette.R')

model=Ckmeans.1d.dp(b$a, k=3, y=1, method=c("linear"), estimate.k=c("BIC"))

CD_LOW=b[which(model$cluster==1),1]
CD_MED=b[which(model$cluster==2),1]
CD_HIGH=b[which(model$cluster==3),1]

plot(model)
