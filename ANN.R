#C:\\Users\\ypatia\\AppData\\Local\\Temp\\RtmpqSAuPM\\data.txt6505d2d1047

violations=data.frame(total_violations$PMD_ABSALIL,total_violations$PMD_AMUO,total_violations$PMD_CIS,total_violations$PMD_EIS,total_violations$PMD_UIS
,total_violations$PMD_IESMUB,total_violations$PMD_ISMUB,total_violations$PMD_CTCNSE,total_violations$PMD_PCI,total_violations$PMD_AIO,
total_violations$PMD_APMP,total_violations$PMD_ARP,total_violations$PMD_CR,total_violations$PMD_DLNLISS,total_violations$PMD_MBIS,
total_violations$PMD_UEC,total_violations$PMD_UEM,total_violations$PMD_ClMMIC,total_violations$PMD_ULV,total_violations$PMD_UETCS,
total_violations$PMD_ESB,total_violations$PMD_WLMUB)

#set weights at the violations . 1 for minor, 5 for major, 10 for critical
violations[,1]=5*violations[,1]
violations[,2]=5*violations[,2]
violations[,4]=5*violations[,4]
violations[,5]=5*violations[,5]
violations[,8]=5*violations[,8]
violations[,9]=10*violations[,9]
violations[,13]=10*violations[,13]
violations[,15]=10*violations[,15]
violations[,18]=5*violations[,18]
violations[,19]=5*violations[,19]
violations[,20]=10*violations[,20]


sums=c()

length=nrow(violations)

for(i in 1:length){
  
  sums[i]=sum(violations[i,])
}

total=cbind(total_metrics,sums)

total=na.omit(total)

small_size_set=total[which((total$LLOC>3)&(total$LLOC<16)),]
medium_size_set=total[which((total$LLOC>17)&(total$LLOC<35)),]
large_size_set=total[which((total$LLOC>36)&(total$LLOC<91)),]

NLALL_small=small_size_set$NL+small_size_set$NLE
NLALL_medium=medium_size_set$NL+medium_size_set$NLE
NLALL_large=large_size_set$NL+large_size_set$NLE

small_size_metrics=data.frame(small_size_set$MIMS,small_size_set$CD,NLALL_small,small_size_set$TLOC)
medium_size_metrics=data.frame(medium_size_set$HVOL,medium_size_set$CLC,medium_size_set$CD,NLALL_medium,medium_size_set$TLOC)
large_size_metrics=data.frame(large_size_set$MI,large_size_set$CLC,large_size_set$CD,NLALL_large,large_size_set$HDIF)

small_size_violations=small_size_set$sums
medium_size_violations=medium_size_set$sums
large_size_violations=large_size_set$sums

#clustering twn violations kai thetoume times 1 kai 0 sta clusters pou prokuptoun 

source('small_size_violations_clustering.R')
source('medium_size_violations_clustering.R')
source('large_size_violations_clustering.R')


#normalization of metrics

small_size_metrics = (small_size_metrics - min(small_size_metrics))/(max(small_size_metrics) - min(small_size_metrics))
medium_size_metrics = (medium_size_metrics - min(medium_size_metrics))/(max(medium_size_metrics) - min(medium_size_metrics))
large_size_metrics = (large_size_metrics - min(large_size_metrics))/(max(large_size_metrics) - min(large_size_metrics))

large_data=cbind(large_size_metrics,large_size_violations)

#0 einai readable kai 1 mi readable
large_data_1=large_data[which(large_data$large_size_violations==1),]
large_data_2=large_data[which(large_data$large_size_violations==0),]

large_data_2 = large_data_2[sample(nrow(large_data_2),5*nrow(large_data_1)),]
#large_data = large_data[sample(nrow(large_data),1000),]

large_data=rbind(large_data_1,large_data_2)

set.seed(42)
large_data <- large_data[sample(nrow(large_data)),]
#large_data = large_data[sample(nrow(large_data),500),]



colnames(large_data)=c('MI','CLC','CD','NLALL','HDIF','Y')

model=neuralnet(Y~MI+CLC+CD+NLALL+HDIF,large_data,hidden=c(2,2),threshold = 0.01,rep=20)



a=c(0.013)
b=c(0.0003)
c=c(0)
d=c(0.013)
e=c(0.9)

#data frame me times twn metrikwn pou upologizoume 
#oti tha vgaloun apotelesma medium readability ( timi 1 sto ann model)
x1=data.frame(a,b,c,d,e)

pred=compute(model,x1)
prob=predict$net.result
pred=ifelse(prob>0.5,1,0)

a=c(0.013)
b=c(0.0003)
c=c(0)
d=c(0.013)
e=c(0.9)

#data frame me times twn metrikwn pou upologizoume 
#oti tha vgaloun apotelesma high readability ( timi 0 sto ann model)

x2=data.frame(a,b,c,d,e)

pred=compute(model,x2)
prob=predict$net.result
pred=ifelse(prob>0.5,1,0)

a=c(0.013)
b=c(0.0003)
c=c(0)
d=c(0.013)
e=c(0.9)

#data frame me times metrikwn pou den kanoun emfanes to readability


x3=data.frame(a,b,c,d,e)

pred=compute(model,x3)
prob=predict$net.result
pred=ifelse(prob>0.5,1,0)                     
                      