#thetoume kentra ston kmeans kai epilegoume k=3


#2 clusters mean_sil=0.56
#3 clusters mean_sil=0.6
#4 clusters mean_sil=0.62
#5 clusters mean_sil=0.65

a = large_size$NL

b = large_size$NLE
all=data.frame(a,b)
plot(all)

all=na.omit(all)
source('outlier_detection.R')
outlierKD(all,a)

outlierKD(all,b)
all=na.omit(all)

plot(all)

X=c(2,4,5)
Y=c(2,3,5)
cent=data.frame(X,Y)

model<-kmeans(all,centers=cent)

NLALL_LOW=b[which(model$cluster==1),1]
NLALL_MED=b[which(model$cluster==2),1]
NLALL_HIGH=b[which(model$cluster==3),1]

plot(all,col=model$cluster)



