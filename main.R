
library(cluster)
library(Ckmeans.1d.dp)
library(devtools)
install_github("kassambara/factoextra")
library("factoextra")
library(neuralnet)

# einai sinartisi pou kaleitai sto clustering twn metrikwn opote
# kanoume to script source apo twra
source('outlier_detection.R')

source('metrics_selection_PCA.R')
source('dataset_segmentation.R')

source('large_size_CD_clustering')
source('medium_size_CD_clustering')
source('small_size_CD_clustering')
source('large_size_CLC_clustering')
source('medium_size_CLC_clustering')
source('small_size_CLLC_clustering')
source('large_size_HDIF_clustering')
source('small_size_MIMS_clustering')
source('large_size_MI_clustering')
source('medium_size_HVOL_clustering')
source('small_size_TLOC_clustering')
source('medium_size_MI_clustering')
source('large_size_NL_NLE_clustering')
source('medium_size_NL_plus_NLE_clustering')
source('small_size_NL_NLE_clustering')

source('ANN.R')







