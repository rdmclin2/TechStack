#!/bin/bash

# 请尝试写一个脚本。
# 当调用脚本时会显示当前的时间和日期
# ，所有已登录的用户和系统的正常运行时间。
# 然后将这些信息保存到一个文件中。
CUR_DIR=`pwd`
FILE="$CUR_DIR/log.txt" 

echo `date` >> $FILE

echo `who` >> $FILE

echo `uptime` >> $FILE
