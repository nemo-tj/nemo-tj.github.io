---
layout: post
title: linux learning
modified: 2019-02-12
tags: [linux, shell]
author: 晋戈
---

1. 批量查找某个目下文件的包含的内容，例如：
    
    grep -rn "要找查找的文本" ./

2. 批量查找并替换文件内容。

    sed -i "s/要找查找的文本/替换后的文本/g" \`grep -rl "要找查找的文本" ./\`