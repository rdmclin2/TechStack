#!/bin/bash
# Bash脚本标准起始行。

# Cleanup, version 2

# 使用root权限运行。
# 在这里插入代码用来打印错误信息，并且在未使用root权限时退出。

LOG_DIR=/Users/Calvin/Develop/githubs/TechStack/shell/scripts/log

cd $LOG_DIR

cat /dev/null > messages

cat /dev/null > wtmp

echo "Logs cleaned up."

exit