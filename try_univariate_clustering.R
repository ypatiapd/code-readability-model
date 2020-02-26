# dialegoume centers=2, efoson yperexei se silhouette twn allwn

library(Ckmeans.1d.dp)
library(cluster)
#2 clusters mean_sil=0.64
#3 clusters mean_sil=0.58
#4 clusters mean_sil=0.56
#5 clusters mean_sil=0.54

a=small_size_violations
a=na.omit(a)
b=data.frame(a,0)

plot(b, ylim = c(-0.01, 0.90),  xlab = "Data", ylab = "Density")


outlierKD(b,a)
b=na.omit(b)

plot(b, ylim = c(-0.01, 0.90),  xlab = "Data", ylab = "Density")

b = b[sample(nrow(b),1000),]

plot(b, ylim = c(-0.01, 0.90),  xlab = "Data", ylab = "Density")

source('1d_optimal_silhouette.R')

model=Ckmeans.1d.dp(b$a, k=2, y=1, method=c("linear"), estimate.k=c("BIC"))

plot(model)

MIMS_LOW=b[which(model$cluster==1),1]
MIMS_MED=b[which(model$cluster==2),1]
MIMS_HIGH=b[which(model$cluster==3),1]

model_silhouette = silhouette(model$cluster, dist(b$a))
mean=mean(model_silhouette[,3])
plot(model_silhouette)

d=dist(all)
hc = hclust(d, method = "complete")
clusters=cutree(hc,k=3)
plot(all,col=clusters)

model=dbscan(all,eps=0.1,minPts=100)
plot(all,col=model$cluster)

model = mvnormalmixEM(all, k = 3 , epsilon = 0.1)
plot(model, which = 2)