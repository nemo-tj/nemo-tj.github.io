---
layout: post
title: IOT中的深度学习和应用
description: "Mobile Computation，Deep Learning FrameWork, Application"
modified: 2020-03-29
tags: [IOT]
---

（1）方案设计：
- 定义：
    + 节点：可以进行无线通信和收集传感器信息
    + 协调器：节点和服务器通信的中介，将节点信息传给服务器，接收服务器指令
    + 传感器：安装在节点上，用以采集信息，如红外检测、水流速度等
其中，节点搭载低功耗处理器和传感器，应用人工智能深度学习算法，具有信息采集、定位、处理到智能识别的一体化功能。节点可以大规模自由部署，动态组网，构建救援现场的”生命浮标网“。该方案从两方面来保证救援工作的开展：
    + 收集受灾现场信息、检测受困人员的体征、位置信息 
    + 为指挥救援工作提供一线信息支持

（2）创新性：
应用智能识别算法，融合异构多元信息，进行实时识别和监测，保证救援的及时性和科学性。通过动态部署无线节点进行信息收集和预处理，相比于现有的信息收集手段，更加智能和鲁棒，极大的减少了搜救工作的难度。在低功耗节点上部署人工智能算法，在第一时间识别受灾人员的安全状况，为救援工作提供科学的数据支撑。

（3）可行性：
当前人工智能算法应用在语音、图像识别等领域，已经取得显著效果，相关的研究和工业产品也在逐步成熟。但是这类应用由于本身对数据的依赖很强，算法模型的训练需要消耗大量的计算资源，对部署的平台资源要求较高。为解决模型效果和资源之间的矛盾，目前有学者进行了相关的研究，并取得了一定的进展。比如：通过对模型的压缩裁剪，降低了功耗和计算量，从而具备了落地应用的可能性。
无线传感网技术伴随物联网iot的发展，已经有了长足的进步。如面包屑传感网在消防救援中，已经初步落地。具备初期的技术积累和工程经验。
由此，在此类水灾救援中，搭建一个基于无线传感网的智能救援系统，是可行的，且具有现实意义的。


## 面包屑系统应用于极端恶劣条件救援
+ 基础：低成本分布式的数据采集、处理、训练和学习
    * 模型压缩和裁剪：在低功耗节点上进行深度学习框架的部署
    * 样本数据生成和结果评估：半监督式生成数据标签、提高模型能力
    * 多数据源融合算法：异构的数据源，统一特征抽取，模型训练和学习
+ 可行性：
    * 低功耗硬件+智能算法
    * 端到端闭环IoT系统：分布式部署、智能组网、数据采集训练应用平台
+ 先进性：
    * 智能算法
    * 分布式
    * 端到端


### DeepSense: a Unified Deep Learning Framework for Time-Series Mobile Sensing Data Processing
+ 多传感器数据融合，序列信息学习：空间（多个传感器输入） + 时间（时间序列）
+ CNN 提取空间特征，进行融合；
+ RNN 学习时间序列，进行预测
+ 有监督学习：
    * 回归问题：导航定位
    * 分类问题：姿态识别

### DeepIoT: Compressing Deep Neural Network Structures for Sensing Systems with a Compressor-Critic Framework
+ 模型压缩，落地应用到低功耗端上

### SenseGAN: Enabling Deep Learning for Internet of Things with a Semi-Supervised Framework
+ 半监督学习， 打标签
+ GAN: 生成对抗网络

### FastDeepIoT: Towards Understanding and Optimizing Neural Network Execution Time on Mobile and Embedded Devices
+ In this paper, we show how a better understanding of the non-linear relation between neural network structure and performance can further improve execution time and energy consumption without impacting accuracy

### STFNets: Learning Sensing Signals from the Time-Frequency Perspective with Short-Time Fourier Neural Networks
+ 特征工程：
+ 引入频域信号：傅立叶变化

### ApDeepSense: Deep Learning Uncertainty Estimation Without the Pain for IoT Applications
+ Uncertainty Estimation

### SADeepSense: Self-Attention Deep Learning Framework for Heterogeneous On-Device Sensors in Internet of Things Applications
+ Attention: 区分对待模型的输入源

### Eugene: Towards Deep Intelligence as a Service
+ IOT 系统综述：深度学习的应用和挑战
+ Training and Data Labeling
+ Model Reduction and Caching
+ Execution Profiling
+ Result Quality Estimation
+ Run-time Inference



苏州中心智库

机器人、消防头盔、中建公司










