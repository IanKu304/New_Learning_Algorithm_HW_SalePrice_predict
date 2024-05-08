# conclusion
#### 整體而言可能是因為只有一層，從肉眼看預測結果就能發現有點underfitig，許多預測結果和實際值相差甚遠，並且迭帶夠多的話最後所有y都會收斂到價格平均大約180000上下，可能需要加入強化式學習
#### 資料來源:
[house-prices-advanced-regression-techniques](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/data)
## preprocessing:
#### 做了mice imputing 和robust scaling 沒做normalization
## hidden nodes:
#### 不管5、8或11 訓練出來的結果差不多，可能是前面proeprocessing 的時候 dummy 產生過多categorical variables
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
