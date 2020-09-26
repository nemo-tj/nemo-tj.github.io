---
layout: post
title: 搭建推荐系统
modified: 2020-09-26
tags: [recommendation-system, model, server]
---
准备一步步从零开始搭建一个推荐系统，算作是对自己工作的一个总结和整合。

## 第一期的想法是，
+ 离线：模型走单机的训练，训练数据也是本地文件加载
+ 在线：通过rpc提供服务，利用proto定义 特征输入输出

### kickoff-模型训练
这一部分就准备先用FM搭建，参考 `http://castellanzhang.github.io/`，先看懂别人的代码，看本地多线程的。后面再考虑扩展两点：分布式训练 + 在线学习
distribution-training + online-learning

### MPI 训练框架接入：分布式训练

### 消息队列joiner模块，接入实时数据流训练

### 接入tensorflow，方便模型构图和定义

### 模型和服务升级

### 通用框架 + 可视化

### 服务化