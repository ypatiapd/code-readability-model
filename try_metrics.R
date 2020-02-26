
#clc xwris outliers
#ci xwris outliers kai sampling
# sto large NL kai NLE boroun coupling



#multi
a = small_size$NL

b = small_size$NLE
all=data.frame(a,b)
plot(all)

all=na.omit(all)

#all=unique(all)
all = all[sample(nrow(all),10000),]

outlierKD(all,a)

outlierKD(all,b)
all=na.omit(all)

#all = all[sample(nrow(all),1000),]

#all$a = (all$a - min(all$a))/(max(all$a) - min(all$a))
#all$b = (all$b - min(all$b))/(max(all$b) - min(all$b))

plot(all)

d=dist(all)
hc = hclust(d, method = "complete")
clusters=cutree(hc,k=3)
plot(all,col=clusters)

X=c(0.2,0.5,0.9)
Y=c(0.2,0.5,0.9)
cent=data.frame(X,Y)

model<-kmeans(all,centers=3)
plot(all,col=model$cluster)

source(2d_optimal_silhouette)

model=dbscan(all,eps=0.1,minPts=100)
plot(all,col=model$cluster)

model = mvnormalmixEM(all, k = 3 , epsilon = 0.1)
plot(model, which = 2)
