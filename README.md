
# 新型態學習演算法作業 房價預測 (之後的作業應該都會放在這裡，會把之前的丟到previous code)
### 作者:  統計四 顧以恩 109304033 \統計四 鄭皓予

## 資料來源:
[house-prices-advanced-regression-techniques](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/data)
## 資料簡介:
### X 為 1460*75的房屋資料集，共有39個categorial variables，35個ordinal variables以及1個continuos variables。
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
### y 為1460*1的房價，介於34900至755000之間，平均為180921.196，標準差為 79442.502883，稍微有點右偏，有些許outliers，不符合常態假設。
### 因為kaggle 競賽的df_test沒有y，所以將df_train 以8:2 分成 train set和validation set。

## --------------------------------------------------------------------------------------------------------

## Conclusion
#### HW4Update 
#### 1.這次把程式整個大改，把訓練與regulization分開，並且寫成一個訓練的函數，可以選擇是否要EB、LG、UA、DO、BN以及調整訓練模式與regulization模式，雖然最後的code在LG+UA的地方和老師有些差異(老師的LG判定放在迴圈最後，我把LG放在forward後面)，但結果看下來是好的。
#### 2.將訓練與regulization分開後，訓練成本大幅下降，從原本50000步左右變成大約75步，應該是因為加上l2後損失函數圖形變得太複雜，以及沒有l2的話超過75步後容易overfitting導致。一開始把l2丟掉時沒有發現overfitting，等到後來發現model 有訓練模式與評估模式，才發現超級大過擬。
#### 3.小問題，DO layer加上去後拿來做UA的ReduceLROnPlateau就失效了，不管loss 多大lr就是不會變，網路上也找不到相關的議題，可能需要跟老師憶起研究一下。

#### HW3Update 這次加上了顯卡支援跑到了大約50000 epochs 左右，效果也稍微有提升，我發現torch 套件的 torch.optim.lr_scheduler 的 ReduceLROnPlateau 就是在做UA的部分

#### HW2update 這次一開始調了一堆參數增加了好幾層但最後結果都不太理想，後來發現一個問題是我Xavier函數沒寫好，幾乎等於沒做，補好之後發現生出來的數字可以調整scale。另一點模型表現增加最多的地方是對y做了scale，用robust scaler 調整並用來訓練，訓練完後再把test 預測出來的結果用inverse_transform轉換回去。

## hidden nodes:
#### 6 layer 改成 4layer  214 100 50 11 1 
## initial weight:
#### Xavier 
## Activation:
#### 主要用LeakyRELU
## Loss:
#### MSE ,把 l2 regulization 去掉後從50000步降到75步...
## Optmizer epoch
#### Adam 
## learning_rate
#### 起始值設10^-3, UA停止值設 6^10-4, 用ReduceLROnPlateau做UA learn rate decay, loss > 0.1時 lr大概在10^-6 上下，到10^-7左右時跑的超慢
## learn rate scheduler
#### 用ReduceLROnPlateau做UA, 每次變成0.9倍, loss 5輪沒降才會調, 停止值設 6^10-4
## DO
#### 每層被丟掉ˋ的機率都是0.1
## BN
#### 做的是BatchNorm1d，不確定和BatchNorm2d有什麼差別
## Ensembles
#### 下次一定做
