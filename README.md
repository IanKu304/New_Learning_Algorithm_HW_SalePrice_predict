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
#### 這次一開始調了一堆參數增加了好幾層但最後結果都不太理想，後來發現一個問題是我Xavier函數沒寫好，幾乎等於沒做，補好之後發現生出來的數字可以調整scale。另一點模型表現增加最多的地方是對y做了scale，用robust scaler 調整並用來訓練，訓練完後再把test 預測出來的結果用inverse_transform轉換回去。

## hidden nodes:
#### 從2 layer 11個nodes改成 6 layer 214*150*100*50*20*11*1
## initial weight:
#### 做了 Xavier，但有做沒做最後都會收斂到差不多的點
## Activation:
#### 主要用RELU ，tanh 不知道為什麼所有的點都預測一樣，可能是因為只有一層，Activation function 的種類影響蠻大的
## Loss:
#### MSE + l2 regulization 加上l2後好像沒差多少.....
## Optmizer epoch
#### Adam 真的比 SGD快多了，Adam 大約200左右就收斂，SGD跑到3000 loss都還在降
## learning_rate
#### 如果用RELU 大概要設在10^-2 左右，tanh的話要設到10^2 loss才會跑。RELU加上cosine 後下降更慢但比較不會出現預測結果都在180000上下的問題
## Ensembles
#### 因為看這幾個模型結果都差不多所以沒做，可能要用不同initial weight的模型來做ensembles
## Batch Normalization
####最後有點趕所以沒做
