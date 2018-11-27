---
layout: post
title: 机器学习
modified: 2018-11-26
tags: [Machine Learning]
author: 晋戈
---

### 机器学习模型组成

一个机器学习的任务，主要包含以下几个组成部分：

1. 数据       : $(X,y)$
2. 模型函数    : $f(x)$
3. 损失函数    : $L(f(x),\hat{y})$
4. 优化器      : $Optimizer$
5. 评估       : $Eval$

机器学习任务，可以看作是，$\underline{以数据作为输入，用优化器最小化损失函数，得到模型函数f，用于预估给定的x，并进行评估。}$
一般的，考虑到模型预估的准确和泛化，两个方面的需求，损失函数常被定义成如下形式:

\begin{equation}
L(f(x),\hat{y}) = H(f(x),\hat{y}) + \phi(f(x))
\end{equation}

其中，$H$, $\phi$ 分别指预测损失和结构损失，前者反映模型预测的准确性，后者是为了保证模型的泛化性能。

可以看出，模型训练的关键在于最小化损失函数。优化器的选取和对应的原理从而成为关键。

### 从梯度下降法说起

梯度下降算法是一类应用非常广泛优化方法，属于批量优化算法的一个分支。其思想，尤其简单直接：$\underline{沿着下降速度最快的方向迭代}$

\begin{equation}
\theta_{n+1} = \theta_{n} - \eta \nabla {J_{\theta}(\theta_{n}) }
\end{equation}

下面证明 $$J(\theta_{n+1}) < J(\theta_{n}) $$

\begin{equation}
J(\theta_{n+1}) - J(\theta_{n}) 
= \nabla {J(\theta_{n})(\theta_{n+1} - \theta_{n})} + o(\theta)  
= -\eta \nabla{J(\theta_{n})} \cdot \nabla{J(\theta_{n})} + o(\theta)
= -\eta \nabla J^2(\theta_{n}) + o(\theta) \leq 0
\end{equation} 

根据上面公式可以得到两个结论：
- 梯度下降法，在更新步长足够小的情况下(上述证明中用到了中值定理)，是能够逐步优化损失函数值的，得到$J(\theta_{n}) > J(\theta_{n+1}) > J(\theta_{n+2}) > ... $
- 因为梯度是当前点下降最快的方向。所以梯度下降法是一个贪心地最快优化方法。


#### 学习率

学习率，亦即步长。是梯度下降法最 trick 的地方：首先，learning_rate 不能太大，因为这个会破坏上面证明中的前提条件（中值定理的前提条件); 然后，learning_rate 不能太小，步长小，更新慢。最后，learning_rate大，除了可能会破坏中值定理的前提条件，也会带来另外的好处，跳出局部最优解。

所以，一个合理的learning_rate 的选取，要既能够保证收敛，获得一个局部最优解；又能够在几个局部最优解中，选择到最优的那个解。

#### 动量

历史更新量，刻画历史更新的方向，对当下更新的影响。能加快收敛，减小震荡。

#### 梯度

当前点的梯度，更新方向的基础量

### 梯度下降框架流程

梯度下降基本框架和执行流程：

(1) 计算目标函数关于参数的梯度

\begin{equation}
g_t = \nabla_{\theta}J(\theta_t)
\end{equation}

(2) 根据历史梯度计算一阶和二阶动量
\begin{equation}
m_t = \phi(g_1,g_2,g_3,...,g_t)
\end{equation}

\begin{equation}
v_t = \psi(g_1,g_2,g_3,...,g_t)
\end{equation}


(3) 更新模型参数
\begin{equation}
\theta_{t+1} = \theta_{t} - \frac{1}{\sqrt{v_t + \epsilon}} m_t
\end{equation}

其中， $\epsilon$ 为平滑项，防止分母为零，通常取 1e-8。

### 基于框架的算法实例


#### 随机梯度下降 (SGD)

学习率$\eta$是固定的，不考虑动量。

\begin{equation}
\theta_{t} = \theta_{t-1} - \eta g_{t}
\end{equation}

#### 动量 momentum (SGD-M)
相信历史更新的方向，也很有可能是接下来的更新方向: 
\begin{equation}
m_{t} = \lambda m_{t-1}  + \eta g_t 
\end{equation}

\begin{equation}
\theta_{t} = \theta_{t-1} - m_{t} = \theta_{t-1} - \eta g_{t}  - \lambda m_{t-1}
\end{equation}

- 当梯度保持相同方向时，加大步长，加速参数更新；
- 当梯度方向改变时，动量会拉小步长，减缓参数更新。

#### 带梯度预估的更新方式(NAG)
算法能够在目标函数有增高趋势之前，减缓更新速率

\begin{equation}
g_t = \nabla_\theta J(\theta_t - \gamma m_{t-1})
\end{equation}

其他步骤和动量momentum保持一致
\begin{equation}
m_t = \gamma m_{t-1} + \eta g_t
\end{equation}

\begin{equation}
\theta_{t+1} = \theta_t - m_t 
= \theta_t - \eta \nabla_\theta J(\theta_t - \gamma m_{t-1}) - \gamma m_{t-1}
\end{equation}

#### Adagrad

SGD、SGD-M 和 NAG 均是以相同的学习率去更新 $\theta$ 的各个分量。而深度学习模型中往往涉及大量的参数，不同参数的更新频率往往有所区别。$\underline{区分对待不同特征的学习率}$. 对于更新不频繁的参数（典型例子：更新 word embedding 中的低频词），我们希望单次步长更大，多学习一些知识；对于更新频繁的参数，我们则希望步长较小，使得学习到的参数更稳定，不至于被单个样本影响太多。

Adagrad[4] 算法即可达到此效果。其引入了二阶动量：

\begin{equation}
v_t = \text{diag}(\sum_{s=1}^t g_{s,1}^2, \sum_{s=1}^t g_{s,2}^2, \cdots, \sum_{s=1}^t g_{s,d}^2)
\end{equation}

其中， $v_t \in \mathbb{R}^{d\times d} $是对角矩阵，其元素 $v_{t, ii}$ 为参数第 $i$维从初始时刻到时刻 $t$ 的梯度平方和。

\begin{equation}
v_{t, ii} = \sum_{s=1}^t g_{s,i}^2
\end{equation}

\begin{equation}
\theta_{t+1,i} = \theta_{t,i} - \frac{\eta}{\sqrt{ v_{t, ii}+ \epsilon }} \cdot g_t
\end{equation}
此时，可以这样理解：学习率等效为 $\eta / \sqrt{v_t + \epsilon} $。对于此前频繁更新过的参数，其二阶动量的对应分量较大，学习率就较小。这一方法在稀疏数据的场景下表现很好。
 
#### RMSprop
在 Adagrad 中， $v_t$ 是单调递增的，使得学习率逐渐递减至 0，可能导致训练过程提前结束。为了改进这一缺点，可以考虑在计算二阶动量时不累积全部历史梯度，而只关注最近某一时间窗口内的下降梯度。根据此思想有了 RMSprop[5]。记 $g_t \odot g_t$ 为 $g_t^2$ ，有
\begin{equation}
v_t = \gamma v_{t-1} + (1-\gamma) \cdot \text{diag}(g_t^2)
\end{equation}
其二阶动量采用指数移动平均公式计算，这样即可避免二阶动量持续累积的问题。和 SGD-M 中的参数类似，$\gamma$ 通常取 0.9 左右。

#### Adam
Adam[6] 可以认为是 RMSprop 和 Momentum 的结合。和 RMSprop 对二阶动量使用指数移动平均类似，Adam 中对一阶动量也是用指数移动平均计算。
\begin{equation}
m_t = \eta[ \beta_1 m_{t-1} + (1 - \beta_1)g_t ]
\end{equation}
\begin{equation}
v_t = \beta_2 v_{t-1} + (1-\beta_2) \cdot \text{diag}(g_t^2)
\end{equation}
其中，初值
$m_0 = 0$, $v_0 = 0$

注意到，在迭代初始阶段，$m_t$ 和 $v_t$ 有一个向初值的偏移（过多的偏向了 0）。因此，可以对一阶和二阶动量做偏置校正 (bias correction)，
\begin{equation}
\hat{m}_t = \frac{m_t}{1-\beta_1^t}
\end{equation}
\begin{equation}
\hat{v}_t = \frac{v_t}{1-\beta_2^t}
\end{equation}

再进行更新，
\begin{equation}
\theta_{t+1} = \theta_t - \frac{1}{\sqrt{\hat{v}_t} + \epsilon } \hat{m}_t
\end{equation}

可以保证迭代较为平稳。

