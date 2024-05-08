
setwd('C:/Users/User/OneDrive/桌面/顧以恩資料/kaggle 20240327/Steel-Plate-Defect-Prediction-HW1')
sample = read.csv('data/sample_submission.csv')


for(i in 1:nrow(sample)){
  for(j in ncol(sample)){
    sample[i,j] = runif(1,0,1)
  }
}

write.csv(sample,'data/random_generated1.csv',
          row.names = F)







