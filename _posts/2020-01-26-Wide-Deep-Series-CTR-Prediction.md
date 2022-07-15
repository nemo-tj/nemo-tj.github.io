---
layout: post
title: Wide & Deep 系列CTR预估论文
modified: 2019-02-06
tags: [wide&deep, DeepFM, ]
author: 晋戈
---

### Wide & Deep Learning for Recommender Systems
+ wide linear models:  $\underline{memorization}$
+ deep neural networks: $\underline{generalization}$
+ Vocabularies, which are tables mapping categorical feature strings to integer IDs, are also generated in this stage.
The system computes the ID space for all the string features
that occurred more than a minimum number of times. Continuous real-valued features are normalized to $[0, 1]$ by mapping a feature value x to its cumulative distribution function
$P(X \leq x)$, divided into $n_q$ quantiles. The normalized value
is $\frac{i−1}{n_q-1}$ for values in the i-th quantiles. 
![deep&wide]({{ site.url}}/images/paper/deepxxxx/deep-wide.png)

### DeepFM: A Factorization-Machine based Neural Network for CTR Prediction
+ 这个是 wide_deep 的升级版本，主要贡献在于引入 FM 解决稀疏特征的二阶交叉的问题，减少特征工程的工作量。而且FM的时间复杂度是 $O(nk)$, $k$ 是超参数，一般很小。
![deep&fm]({{ site.url}}/images/paper/deepxxxx/deep-FM.png)

+ 引入 embedding layer, 使用joint learning 的方式进行训练，实现end-to-end
+ 缺点：
    * 所有特征项统一进行embedding 成相同的维度，不能差异化体现不同特征的贡献
    * 数值型特征需要先转化成类别型特征，才能处理
    * 同一特征与不同特征的交叉，使用相同的权重embedding，过于粗暴

### Deep & Cross Network for Ad Click Predictions
+ 通过和一阶项进行逐步交叉，得到多阶项。同时避免高阶项之间的交叉，从而控制了参数数量。
![deep&cross]({{ site.url}}/images/paper/deepxxxx/deep-cross.png)


