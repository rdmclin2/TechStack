
-----

> 本篇为advanced-bash-scripting-guide的笔记,记录那些有用的脚本,最佳实践等。具体的脚本会在本文件夹的scripts目录下

# 教程
- [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/),上面的教程大多应该来自该书
- [ABS github翻译](https://imcmy.gitbooks.io/advanced-bash-scripting-guide-in-chinese/content/source/part1/01_shell_programming.html)
,这是ABS的翻译项目，赶脚还不错,就是没完成

# 惯例 & 最佳实践
## 起始行
```
#!/bin/bash
# Bash脚本标准起始行。
```

## 变量
```
LOG_DIR=/var/log
# 变量比硬编码（hard-coded）要更合适一些
```

## 命令分隔符;
命令分隔符[分号]。允许在同一行内放置两条或更多的命令。
注意在分号以后有一个空格

## 句点命令 `.`
句点命令[句点],等价于source命令,这是一个bash的内建命令。

## 逗号运算符。
逗号运算符将一系列的算术表达式串联在一起。所有的算术表达式都会被执行，但只有最后一个被计算的表达式的值将会被返回。
```
let "t2 = ((a = 9, 15 / 3))"
# 设定 "a = 9" 与 "t2 = 15 / 3"
```

## :

空命令[冒号]。它在shell中等价于"NOP"（即no op，空操作），同时也被认为是shell内建命令true的同义词。它本身是Bash的内建命令，返回值是true（0）。
```
:
echo $?   # 0
```
它在死循环中的情况：
```
while :
do
   operation-1
   operation-2
   ...
   operation-n
done

# 等价于
#    while true
#    do
#      ...
#    done
```
它在 if/then 中作为占位符的情况：
```
if condition
then :   # 什么都不做，只是建立一个分支
else
   take-some-action
fi
```

与>重定向操作符结合，可以在不改变权限的情况下清空文件。如果文件不存在，那么将会创建这个文件。
```
: > data.xxx   # 文件 "data.xxx" 已经被清空

# 与 cat /dev/null >data.xxx 作用相同
# 但是这个操作并不会产生一个新的进程，因为 ":" 是一个内建命令。
```

## *

算术运算符。在进行算术运算时，* 代表乘法运算。

** 双星号可以表示乘方运算或扩展文件匹配

## ()

命令组。
```
(a=hello; echo $a)

notice 通过括号执行一系列命令会产生一个子shell（subshell）。

在括号中的变量，即在子shell中的变量，在脚本的其他部分是不可见的。父进程脚本不能访问子进程（子shell）中所创建的变量。

a=123
( a=321; )

echo "a = $a"   # a = 123
```

在括号中的 "a" 看起来像一个局部变量。

## {xxx,yyy,zzz,...}

大括号扩展结构。
```
echo \"{These,words,are,quoted}\"   # " 将会作为单词的前缀和后缀
# "These" "words" "are" "quoted"


cat {file1,file2,file3} > combined_file
# 将 file1, file2 与 file3 拼接在一起后写入 combined_file 中。

cp file22.{txt,backup}
# 将 "file22.txt" 拷贝为 "file22.backup"
```
## {a..z}

扩展大括号扩展结构。
```
echo {a..z} #  a b c d e f g h i j k l m n o p q r s t u v w x y z
# 输出 a 到 z 之间所有的字母。

echo {0..3} # 0 1 2 3
# 输出 0 到 3 之间所有的数字。


base64_charset=( {A..Z} {a..z} {0..9} + / = )
# 使用扩展大括号扩展符初始化一个数组。
```

## 离开脚本
```
exit # 这是正确终止脚本的方式。
     # 不带参数的exit返回的是上一条命令的结果。
```

## 运行脚本
不推荐使用sh scriptname来调用脚本，因为这会禁用脚本从标准输入（stdin）中读入数据。更好的方法是
```
执行命令：

chmod 555 scriptname（给予所有用户读取和执行的权限）2

或者

chmod +rx scriptname（给予所有用户读取和执行的权限）

chmod u+rx scriptname（仅给予脚本所有者读取和执行的权限）
```

然后直接使用./scriptname3进行调用测试了

## 放到系统文件夹
当你在完成调试与测试后，你可能会将脚本文件移至/usr/local/bin（使用root权限）文件夹中，使得脚本可以被所有用户以系统调用的方式进行调用。那么你可以在命令行中输入scriptname [ENTER]直接调用脚本。
