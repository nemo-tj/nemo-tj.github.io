---
layout: post
title: 熵和机器学习
modified: 2019-06-21
tags: [熵]
author: 晋戈
---

### 一、自信息
自信息表示某一事件发生时所带来的信息量的多少，当事件发生的概率越大，则自信息越小，或者可以这样理解：某一事件发生的概率非常小，但是实际上却发生了(观察结果)，则此时的自信息非常大；某一事件发生的概率非常大，并且实际上也发生了，则此时的自信息较小。

$$
\begin{equation}
I(p_i) = -log(p_i)
\end{equation}
$$


### 二、信息熵
自信息描述的是随机变量的某个事件发生所带来的信息量，而信息熵通常用来描述整个随机分布所带来的信息量平均值，更具统计特性。

$$
\begin{equation}
H(X) = E_{x\sim p}[I(x)] = -E_{x\sim p}[log(p(x))] 
= -\sum_{i=1}^{n}p(x_i)log(p(x_i))
= -\int_{x}p(x)log(p(x))dx
\end{equation}
$$
从公式可以看出，信息熵H(X)是各项自信息的累加值，由于每一项都是整正数，故而 $\underline{随机变量取值个数越多，状态数也就越多，累加次数就越多，信息熵就越大，混乱程度就越大，纯度越小.}$ 越宽广的分布，熵就越大，在同样的定义域内，由于分布宽广性中脉冲分布<高斯分布<均匀分布，故而熵的关系为脉冲分布信息熵<高斯分布信息熵<均匀分布信息熵。可以通过数学证明，当随机变量分布为均匀分布时即状态数最多时，熵最大。熵代表了随机分布的混乱程度，这一特性是所有基于熵的机器学习算法的核心思想。

多维联合信息熵：
$$
\begin{equation}
H(X, Y) = -\sum^n_{i=1}\sum^m_{j=1}p(x_i,y_j)log(p(x_i,y_j))
\end{equation}
$$


### 三、条件熵
条件熵的定义为：在X给定条件下，Y的条件概率分布的熵对X的数学期望
$$
\begin{equation}
H(Y|X)  = E_{x\sim p}[H(Y|X=x)] = \sum^n_{i=1} p(x)H(Y|X = x) 
 = - \sum^n_{i=1}p(x)\sum^m_{j=1}p(y|x)log(p(y|x)) 
 = -\sum^n_{i=1}\sum^m_{j=1}p(x,y)log(y|x) 
\end{equation}
$$

$$
\begin{equation}
= -\left(\sum^n_{i=1}\sum^m_{j=1}p(x,y)log(p(x,y)) - \sum^n_{i=1}\sum^{m}_{j=1}p(x,y)log(p(x))\right)
\end{equation}
$$

$$
\begin{equation}
= -\left(\sum^n_{i=1}\sum^m_{j=1}p(x,y)log(p(x,y)) - \sum^n_{i=1}log(p(x))\sum^m_{j=1}p(x,y)\right)
\end{equation}
$$

$$
\begin{equation}
= -\left(\sum^n_{i=1}\sum^m_{j=1}p(x,y)log(p(x,y)) - \sum^n_{i=1}log(p(x))p(x)\right)
= H(X,Y) - H(X)
\end{equation}
$$



### 四、交叉熵
主要用于度量两个概率分布间的差异性信息。p对q的交叉熵表示q分布的自信息对p分布的期望，公式定义为：
$$
\begin{equation}
H(p;q) = E_{x\sim p}[-log(q(x))] = -\sum^n_{i=1}p(x)log(q(x))
\end{equation}
$$
其中。p是真实样本分布，q是预测得到样本分布。在信息论中，其计算的数值表示：如果用错误的编码方式q去编码真实分布p的事件，需要多少bit数，是一种非常有用的衡量概率分布相似性的数学工具。

其中。p是真实样本分布，q是预测得到样本分布。在信息论中，其计算的数值表示：如果用错误的编码方式q去编码真实分布p的事件，需要多少bit数，是一种非常有用的衡量概率分布相似性的数学工具。

在机器学习中，经常用到的交叉熵：
$$
\begin{equation}
J(\theta) = -\frac{1}{m}\sum^m_{i=1}\left(y_i log\, h_{\theta}(x_i) + (1-y_i)log\,(1-h_{\theta}(x_i))\right)
\end{equation}
$$


### 五、相对熵（KL散度）
$\textbf{交叉熵，其用来衡量在给定的真实分布下，使用非真实分布所指定的策略消除系统的不确定性所需要付出的努力的大小;}$ 
$\textbf{相对熵，其用来衡量两个取值为正的函数或概率分布之间的差异}$

$$
\begin{equation}
\begin{array}{l}{\qquad \begin{array}{c}{D_{K L}(p \| q)=E_{x \sim p}\left[\log \frac{p(x)}{q(x)}\right]=-E_{x \sim p}\left[\log \frac{q(x)}{p(x)}\right]} \\ 
{=-\sum_{i=1}^{n} p(x) \log \frac{q(x)}{p(x)}=H(p; q)-H(p)}\end{array}}\end{array}
\end{equation}
$$

简单对比交叉熵和相对熵，可以发现仅仅差了一个H(p)，如果从优化角度来看，p是真实分布，是固定值，最小化KL散度情况下，H(p)可以省略，此时交叉熵等价于KL散度。

在最优化问题中，最小化相对熵等价于最小化交叉熵；相对熵和交叉熵的定义其实都可以从最大似然估计得到，下面进行详细推导:以某个生成模型算法为例，假设是生成对抗网络GAN，其实只要是生成模型，都满足以下推导。

若给定一个样本数据的真实分布 $P_{data}(x)$ 和生成的数据分布 $P_{G}(x;\theta)$, 那么生成模型希望找到一组参数 $\theta$ 使得分布 $P_{G}(x;\theta)$ 和 $P_{data}(x)$之间的距离最短。也就是找到一组生成器参数，使得生成器能生成十分逼真的分布。现在从真实分布 $P_{data}(x)$ 中抽取m个真实样本： $$x^{1}, x^{2}, \ldots x^{m}$$, $$\underline{对于每一个真实样本，我们可以计算 P_{G}(x^i;\theta), 即在由 \theta 确定的生成分布中，x^i 样本所出现的概率。}$$

因此， 我们可以构建似然函数：
$$
\begin{equation}
L=\prod_{i=1}^{m} P_{G}\left(x^{i} ; \theta\right)
\end{equation}
$$
最大化似然函数，即可求得最优参数 $\theta^\*$, 即：
$$
\begin{equation}
\theta^\*=arg \max_{\theta} \prod_{i=1}^{m} P_{G}\left(x^{i} ; \theta\right)
\end{equation}
$$
转化成对数似然函数：
$$
\begin{equation}
\theta^{\*}=\arg {\max_{\theta}} \log \prod_{i=1}^{m} P_{G}\left(x^{i} ; \theta\right)
\end{equation}
$$

$$
\begin{equation}
= \arg \max_{\theta} \sum_{i=1}^{m} \log P_{G}\left(x^{i} ; \theta\right)
\end{equation}
$$

由于是求最大值，故整体乘上常数对结果没有影响,这里是逐点乘上一个常数，所以不能取等于号，但是因为在取得最大值时候 $P_{G}\left(x^{i} ; \theta\right)$ 和 $P_{data}\left(x\right)$肯定是相似的，并且肯定大于0，所以依然可以认为是近视相等的:
$$
\begin{equation}
\approx \arg \max_{\theta} \sum_{i=1}^{m} P_{d a t a}\left(x^{i}\right) \log P_{G}\left(x^{i} ; \theta\right)
\end{equation}
$$

$$
\begin{equation}
=\arg \max_{\theta} E_{x_i \sim p_{\text { data }}}\left[\log P_{G}\left(x^{i} ; \theta\right)\right]
\end{equation}
$$



$$
\begin{equation}
=\arg \max_{\theta} E_{x_i \sim p_{\text { data }}}\left[\log P_{G}\left(x^{i} ; \theta\right)\right]
\end{equation}
$$
上面这个公式正好是交叉熵的定义式，我们在这个基础上减去一个常数项：

$$
\begin{equation}
\theta^{\*}=\arg \max \\{ E_{x \sim p_{\text {data}}}\left[\log P_{G}\left(x^{i} ; \theta\right)\right] - E_{x \sim p_{\text {data}}}\left[\log P_{\text {data}}\left(x^{i}\right)\right] \\}
\end{equation}
$$

$$
\begin{equation}
=\arg \max_{\theta} \int_{x} P_{data} \log \frac{P_{G}(\theta)}{P_{data}} dx
\end{equation}
$$

$$
\begin{equation}
=\arg \min_{\theta} \int_{x} P_{data} \log \frac{P_{data}}{P_{G}(\theta)} dx
\end{equation}
$$

$$
\begin{equation}
=\arg \min_{\theta} E_{x \sim P_{data}}\left[\log \frac{P_{data}}{P_{G}(\theta)}\right]
\end{equation}
$$

$$
\begin{equation}
=\arg \min_{\theta} K L\left(P_{data}(x) \|\| P_{G}(x ; \theta)\right)
\end{equation}
$$

$\underline{最大化似然函数，等价于最小化负对数似然，等价于最小化交叉熵，等价于最小化KL散度}$

### 六、互信息
互信息在信息论和机器学习中非常重要，其可以评价两个分布之间的距离，这主要归因于其$\underline{对称性}$，假设互信息不具备对称性，那么就不能作为距离度量，例如相对熵，由于不满足对称性，故通常说相对熵是评价分布的相似程度，而不会说距离。互信息的定义为：一个随机变量由于已知另一个随机变量而减少的不确定性，或者说从贝叶斯角度考虑，由于新的观测数据y到来而导致x分布的不确定性下降程度。公式如下：
$$
\begin{equation}
\begin{aligned} I(X, Y) =H(X)-H(X | Y)=H(Y)-H(Y | X) =H(X)+H(Y)-H(X, Y) = H(X, Y)-H(X | Y)-H(Y | X) \end{aligned}
\end{equation}
$$
互信息和相对熵也存在联系，如果说相对熵不能作为距离度量，是因为其非对称性，那么互信息的出现正好弥补了该缺陷，使得我们可以计算任意两个随机变量之间的距离，或者说两个随机变量分布之间的相关性、独立性。
$$
\begin{equation}
I(X, Y)=K L(p(x,y) \|\| p(x) p(y) )
\end{equation}
$$
互信息也是大于等于0的，当且仅当x与y相互独立时候取等号。

互信息也是大于等于0的，当且仅当x与y相互独立时候取等号。

### 七、信息增益
$$
\begin{equation}
g(D, A)=H(D)-H(D | A)
\end{equation}
$$


其中D表示数据集，A表示特征，信息增益表示得到A的信息而使得类X的不确定度下降的程度，在ID3中，需要选择一个A使得信息增益最大，这样可以使得分类系统进行快速决策。

### 八、信息增益率
信息增益率是决策树C4.5算法引入的划分特征准则，其主要是克服信息增益存在的在某种特征上分类特征细，但实际上无意义取值时候导致的决策树划分特征失误的问题。例如假设有一列特征是身份证ID，每个人的都不一样，其信息增益肯定是最大的，但是对于一个情感分类系统来说，这个特征是没有意义的，此时如果采用ID3算法就会出现失误，而C4.5正好克服了该问题。其公式如下：

$$
\begin{equation}
g_{r}(D, A)=g(D, A) / H(A)
\end{equation}
$$


### 九、基尼系数
基尼系数是决策树CART算法引入的划分特征准则，其提出的目的不是为了克服上面算法存在的问题，而主要考虑的是计算快速性、高效性，这种性质使得CART二叉树的生成非常高效。其公式如下：

$$
\begin{equation}
\begin{aligned} \operatorname{Gini}(p)=& \sum_{i=1}^{m} p_{i}\left(1-p_{i}\right)=1-\sum_{i=1}^{m} p_{i}^{2} =1-\sum_{i=1}^{m}\left(\frac{\left|C_{k}\right|}{|D|}\right)^{2} \end{aligned}
\end{equation}
$$

为啥说基尼系数计算速度快呢，因为基尼系数实际上是信息熵的一阶进似，作用等价于信息熵，只不过是简化版本。根据泰勒级数公式，将 $f(x)=-ln(x)$  在$x=1$处展开，忽略高阶无穷小，其可以等价为 $f(x)=1-x$,所以可以很容易得到上述定义。

## 总结
- $\underline{自信息}$是衡量随机变量中的某个事件发生时所带来的信息量的多少，越是不可能发生的事情发生了，那么自信息就越大；
- $\underline{信息熵}$是衡量随机变量分布的混乱程度，是随机分布各事件发生的自信息的期望值，随机分布越宽广，则熵越大，越混乱；
- 信息熵推广到多维领域，则可得到$\underline{联合信息熵}$；
- 在某些先验条件下，自然引出$\underline{条件熵}$，其表示在X给定条件下，Y的条件概率分布熵对X的数学期望，没有啥特别的含义，是一个非常自然的概念；
- 前面的熵都是针对一个随机变量的，而$\underline{交叉熵、相对熵和互信息可以衡量两个随机变量之间的关系}$，三者作用几乎相同，只是应用范围和领域不同。
    - $\underline{交叉熵}$一般用在神经网络和逻辑回归中作为损失函数，
    - $\underline{相对熵}$一般用在生成模型中用于评估生成的分布和真实分布的差距，
    - 而$\underline{互信息}$是纯数学的概念，作为一种评估两个分布之间相似性的数学工具，
- 其三者的关系是：
    - 最大化似然函数，等价于最小化负对数似然，等价于最小化交叉熵，等价于最小化KL散度，互信息相对于相对熵区别就是互信息满足对称性；
    - 作为熵的典型机器学习算法-决策树，广泛应用了熵进行特征划分，常用的有信息增益、信息增益率和基尼系数。



