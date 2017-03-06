#!/bin/bash

TITLE="# TechStack"
INTRO="每个人都有自己的技术栈，这是我的技术笔记和学习资料,边学边完善,大部分来自浏览的网站以及阅读的书,一些内容比较多的整理成markdown,部分内容已发表在我的[blog](http://www.mclspace.com)中。"
INDEX="# 目录结构"

rm README.md
touch README.md
echo ${TITLE} >> README.md
echo ${INTRO} >> README.md
echo ${INDEX} >> README.md
echo "\`\`\`" >> README.md
tree -N -L 3 >> README.md
echo "\`\`\`" >> README.md
exit 0