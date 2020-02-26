#thetoume kentra ston kmeans kai epilegoume k=3

#2 clusters mean_sil=0.93
#3 clusters mean_sil=0.72
#4 clusters mean_sil=0.72
#5 clusters mean_sil=0.99

#den xreiazetai outliers ,sampling 10000

a = small_size$NL

b = small_size$NLE
all=data.frame(a,b)
plot(all)

all=na.omit(all)

all = all[sample(nrow(all),10000),]

X=c(1,3,4)
Y=c(1,2,3)
cent=data.frame(X,Y)

model<-kmeans(all,centers=cent)

NLALL_LOW=b[which(model$cluster==1),1]
NLALL_MED=b[which(model$cluster==2),1]
NLALL_HIGH=b[which(model$cluster==3),1]

plot(all,col=model$cluster)





