---
layout: post
title: linux learning
modified: 2019-02-12
tags: [linux, shell]
author: 晋戈
---

3. <font color="Blue">批量删除src_path下：</font>
 - 10天以前的文件：``` find src_path -type f -mtime +20 -exec rm {} \; ```
 - 20分钟以前的文件夹: ``` find src_path -type d -mmin +20 -exec rm {} \; ```

2. <font color="Blue">批量查找src_path下文件的包含to_find_context内容，例如：</font>
 - ``` grep -rn "to_find_context" src_path ```

1. <font color="Blue">在src_path 目录下，批量查找from_context并替换文件内容为 to_context：</font>
 - ```sed -i "s/from_context/to_context/g" `grep -rl "from_context" src_path` ```