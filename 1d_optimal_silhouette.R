
for(i in 2:5){
  
  model=Ckmeans.1d.dp(b$a, k=i, y=1, method=c("linear"), estimate.k=c("BIC"))
  plot(model)
  model_silhouette = silhouette(model$cluster, dist(b$a))
  mean=mean(model_silhouette[,3])
  plot(model_silhouette)
  
}

