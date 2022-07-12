# 面试记录

## 快看漫画 推荐算法：
+ 2022-05-08（二面）
    + 算法题
        + https://leetcode.com/problems/subarray-sums-divisible-by-k/
``` python
 给定无序数组a , 求有多少个连续子数组 sum(a[i]..a[j]) % N == 0;
 思路:  
 (suma(j) - suma(i)) % N == 0
 suma(j) % N == suma(i) % N
```

+ 2022-05-26（一面）
    + 面试评价：
        + 快看的算法目前还是离线更新，按小时级去同步模型
        + 模型还处于通过·加特征·和调整 DeepFm 结构的阶段
        + 面试官对 AUC 的理解，不够清晰
        + 算法团队大约有20个人，但是负责的业务比较乱；除了优化社区推荐，还有做广告推荐
        + 目前阶段的问题：
            + 模型训练更快的更新（偏向工程）
            + 模型特征挖掘（偏向数据）
            + 模型结构调整
            + 广告等小业务的接入，可能在召回上的工作更多一点
    + 算法题 
```python
#!/usr/bin/python
# 求 x 的平方跟
def sqrt(x):
  left = 0
  right = x
  while True:
    m = (right + left) // 2
    t = m * m
    if t  == x:
      return m
    elif m * m < x:
      left = m + 1
    else:
      right = m - 1
    m = (right + left) // 2
    if right == left:
      return right

# 求青蛙跳台阶问题，时间复杂度？
def jump(n):
  if n == 1:
    return 1
  elif n == 2:
    return 2
  elif n == 3:
    return jump(2) + jump(1) + 1
  else:
    return jump(n-1) + jump(n-2) + jump(n-3)

# 时间复杂度优化
def jump(n):
    a = 1
    b = 2
    c = 4
    if n == 1:
        return a
    elif n == 2:
        return b
    elif n == 3:
        return c
    else:
        for i in range(4, n):
            x = c
            c = c + b + a
            a = b
            b = x
    return c
  ```
  
   


- tiktok 推荐算法工程: 
  + 2022-04-29（一面）
    
    + 如果widedeep参数初始化为0会有什么现象？
        + 对wide侧的LR 而言，没有影响
            $$
            \begin{aligned}
            f(X) =& \sigma(X^T W), \quad a = X^T W \\
            loss =& L(w) = \sum_i y_i log (f(X_i)) + (1-y_i) log (1-f(X_i)) \\
            \frac{\partial L(w)} {\partial w_i} =& \frac{\partial L} {\partial f} \frac{\partial f} {\partial a}  \frac{\partial a} {\partial w_i} 
                = \frac{1}{f} [(1-f)f] x_i = (1-f) x_i \\
                w_i =& w_i - (1-f) x_i
            \end{aligned}
            $$
            
        + 对 DNN 侧，假设有3层 I, H, O
            + forward 时 $a_j = \sum_i w_i x_i,  w_i = 0$ , 导致H层的输入为零，H层的输出为固定值，即 O层的输入为固定值
            
            + backward 时，O层可以更新梯度，但是每个神经元的梯度相同；但是隐层H 由于输入是零，导致其梯度始终为零
                
            + 半径为$R$的圆上，任意一点与圆心距离$d$的期望$E(d)$是？
         $$
         \int_{x = 0}^{x = R} \frac{ 2 \pi x dx }{\pi R^2} x = \frac{\frac{2}{3}x^3 |^R_0}{R^2} = \frac{2}{3}R
         $$
    
    
    
    