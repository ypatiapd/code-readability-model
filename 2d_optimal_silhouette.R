

for(i in 2:5){

model<-kmeans(all,centers=i)
plot(all,col=model$cluster)
model_silhouette=silhouette(model$cluster, dist(all))
plot(model_silhouette)

}

