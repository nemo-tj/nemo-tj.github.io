---
layout: post
title: xgboost原理和源码分析
modified: 2018-11-26
tags: [Machine Learning]
author: 晋戈
---

### xgboost 原理

### 源码走读

```
cli_main.cc:
main()
     -> CLIRunTask()
          -> CLITrain()
               -> DMatrix::Load()
               -> learner = Learner::Create()
               -> learner->Configure()
               -> learner->InitModel()
               -> for (i = 0; i < param.num_round; ++i)
                    -> learner->UpdateOneIter()
                    -> learner->Save()    
learner.cc:
Create()
      -> new LearnerImpl()
Configure()
InitModel()
     -> LazyInitModel()
          -> obj_ = ObjFunction::Create()
               -> objective.cc
                    Create()
                         -> SoftmaxMultiClassObj(multiclass_obj.cc)/
                              LambdaRankObj(rank_obj.cc)/
                              RegLossObj(regression_obj.cc)/
                              PoissonRegression(regression_obj.cc)
          -> gbm_ = GradientBooster::Create()
               -> gbm.cc
                    Create()
                         -> GBTree(gbtree.cc)/
                              GBLinear(gblinear.cc)
          -> obj_->Configure()
          -> gbm_->Configure()
UpdateOneIter()
      -> PredictRaw()
      -> obj_->GetGradient()
      -> gbm_->DoBoost()         
 
gbtree.cc:
Configure()
      -> for (up in updaters)
           -> up->Init()
DoBoost()
      -> BoostNewTrees()
           -> new_tree = new RegTree()
           -> for (up in updaters)
                -> up->Update(new_tree)    
 
tree_updater.cc:
Create()
     -> ColMaker/DistColMaker(updater_colmaker.cc)/
        SketchMaker(updater_skmaker.cc)/
        TreeRefresher(updater_refresh.cc)/
        TreePruner(updater_prune.cc)/
        HistMaker/CQHistMaker/
                  GlobalProposalHistMaker/
                  QuantileHistMaker(updater_histmaker.cc)/
        TreeSyncher(updater_sync.cc)
```



