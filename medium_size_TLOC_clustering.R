# dialegoume centers=2, efoson yperexei se silhouette twn allwn

library(Ckmeans.1d.dp)
library(cluster)
#2 clusters mean_sil=0.88
#3 clusters mean_sil=0.88
#4 clusters mean_sil=0.87
#5 clusters mean_sil=0.87

a=medium_size$TLOC
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

TLOC_LOW=b[which(model$cluster==1),1]
TLOC_HIGH=b[which(model$cluster==2),1]

