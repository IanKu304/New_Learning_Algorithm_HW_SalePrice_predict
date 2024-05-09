# 之後的作業應該都會放在這裡，會把之前的丟到previous code

## 作者: \n  統計四 顧以恩 109304033 \n統計四 鄭皓予

## 資料來源:
[house-prices-advanced-regression-techniques](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/data)
## 資料簡介:
### X 為 1460*75的房屋資料集，共有39個categorial variables，35個ordinal variables以及2個continuos variables。
##### Missing Rate
|              |total  missing | missing percentage | handling |
|--------------|---------|----------|------------|
| PoolQC       | 1453    | 99.52%   | drop       |
| MiscFeature  | 1406    | 96.30%   | drop       |
| Alley        | 1369    | 93.77%   | drop       |
| Fence        | 1179    | 80.75%   | drop       |
| FireplaceQu  | 690     | 47.26%   | Use IterativeImputer |
| LotFrontage  | 259     | 17.74%   | Use IterativeImputer |
| GarageYrBlt  | 81      | 5.55%    | Use IterativeImputer |
| GarageCond   | 81      | 5.55%    | Use IterativeImputer |
| GarageType   | 81      | 5.55%    | Use IterativeImputer | 
|             |      |  :    |  |
|             |      |  :    |  |
### y 為1460*1的房價，介於34900至755000之間，平均為180921.196，標準差為 79442.502883，稍微有點右偏，不符合常態假設。
### 因為kaggle 競賽的df_test沒有y，所以將df_train 以8:2 分成 train set和validation set。



## Conclusion
#### 這次加加上了顯卡支援跑到了大約50000 epochs 左右，效果也稍微有提升，我發現torch 套件的 torch.optim.lr_scheduler 的 ReduceLROnPlateau 就是在做UA的部分

## hidden nodes:
#### 6 layer 214*150*100*50*20*11*1 沒做drop 
## initial weight:
#### Xavier 優化了code 也丟到GPU上
## Activation:
#### 主要用RELU, Activation function 的種類影響蠻大的
## Loss:
#### MSE + l2 regulization 跑得真的比較久但是新電腦有顯卡支援
## Optmizer epoch
#### Adam 
## learning_rate
#### 起始值設10^-3, UA停止值設 10^-8, 用ReduceLROnPlateau做UA learn rate decay, loss > 0.1時 lr大概在10^-6 上下，到10^-7左右時跑的超慢
## Ensembles
#### 下次一定做
## Batch Normalization
#### 下次一定做

