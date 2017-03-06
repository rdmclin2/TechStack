
# 教程
- [c语言中文网shell教程](http://c.biancheng.net/cpp/view/6994.html),以下大部分内容来自该网

# 资源
- [awesome-shell](https://github.com/alebcay/awesome-shell/blob/master/README_ZH-CN.md)
> 各种bash资源
- [Laptop](https://github.com/thoughtbot/laptop)
> A shell script which turns your OS X laptop into an awesome web development machine.

#第一个shell脚本
```
#!/bin/bash
echo "Hello World !"
```

#常识
- shell的扩展名一般是sh(sh代表shell),但扩展名并不影响脚本执行
- `#!` 是一个约定的标记，它告诉系统这个脚本需要什么解释器来执行，即使用哪一种Shell。
- 一个使用/bin/sh作为解释器的脚本是不是可以省去第一行呢？是的。

# 运行shell
- 作为可执行程序,第一行一定要写对，好让系统查找到正确的解释器
```
chmod +x test.sh  #使脚本具有执行权限
./test.sh  #执行脚本,用`./`告诉系统就在当前目录找
```

- 作为解释器参数,直接运行解释器，其参数就是shell脚本的文件名,这种方式运行的脚本，不需要在第一行指定解释器信息，写了也没用
```
/bin/sh test.sh
/bin/php test.php
```

# 变量
## 定义变量 variableName=""
```
variableName="value" # 变量名和等号之间不能有空格,等号和值之间也不能有空格
# 首个字符必须为字母（a-z，A-Z）。
# 中间不能有空格，可以使用下划线（_）。
```

## 使用变量 $variableName,${variableName}
```
# 使用一个定义过的变量，只要在变量名前面加美元符号（$）即可
your_name="rdmclin2"
echo $your_name
echo ${your_name} #变量名外面的花括号是可选的，加不加都行，加花括号是为了帮助解释器识别变量的边界
# 推荐给所有变量加上花括号，这是个好的编程习惯。
```

## 重新定义变量
已定义的变量，可以被重新定义,重新赋值即可,注意不要加$

## 只读变量 readonly variable_name
```
#!/bin/bash
myName="rdmclin2"
readonly myName # 使用 readonly 命令可以将变量定义为只读变量，只读变量的值不能被改变。
myName="rdmclin" #该句报错 : ./3.sh: line 4: myName: readonly variable
```

## 删除变量 unset variable_name
```

#!/bin/sh

myUrl="http://mclspace.com"
unset myUrl  # 变量被删除后不能再次使用；unset 命令不能删除只读变量。
echo $myUrl  # 无任何输出
```

## 变量类型
运行shell时，会同时存在三种变量：
1) 局部变量

局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量。
2) 环境变量

所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量。
3) shell变量

shell变量是由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行

## 特殊变量
变量名只能包含数字、字母和下划线，因为某些包含其他字符的变量有特殊含义，这样的变量被称为特殊变量。
- $$ 表示当前Shell进程的ID，即pid,对于 Shell 脚本，就是这些脚本所在的进程ID
- $0 当前脚本的文件名
- $n 传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2
- $# 传递给脚本或函数的参数个数
- $* 传递给脚本或函数的所有参数
- $@ 传递给脚本或函数的所有参数。被双引号(" ")包含时，与 $* 稍有不同
- $? 上个命令的退出状态，或函数的返回值,上一个命令执行后的返回结果,一般情况下，大部分命令执行成功会返回 0，失败返回 1

# $* 和 $@ 的区别
$* 和 $@ 都表示传递给函数或脚本的所有参数，不被双引号(" ")包含时，都以"$1" "$2" … "$n" 的形式输出所有参数。
但是当它们被双引号(\" \")包含时，\"$\*\" 会将所有的参数作为一个整体，以"$1 $2 … $n"的形式输出所有参数；"$@" 会将各个参数分开，以"$1" "$2" … "$n" 的形式输出所有参数。
```
echo "print each param from \"\$*\""
for var in "$*"
do
    echo "$var"
done

echo "print each param from \"\$@\""
for var in "$@"
do
    echo "$var"
done


# 结果
print each param from "$*"
a b c d
print each param from "$@"
a
b
c
d
```

#例子
```
#!/bin/bash
echo "What is your name?"
read PERSON
echo "Hello, $PERSON"
```

# 替换
## 转义字符
- "\\n" 换行
- "\\\\" 反斜杠
- "\\a" 警报，响铃
- "\\b" 退格
- "\\f" 换页
- "\\r" 回车
- "\\t" 制表符
- "\\v" 垂直制表符,显示屏无效，只有打印机能体现出来

> 换行和回车有啥区别? 换行好理解，就是跳到下一行嘛,回车嘛,在计算机还没有出现之前，有一种叫做电传打字机（Teletype Model 33）的玩意，每秒钟可以打10个字符。但是它有一个问题，就是打完一行换行的时候，要用去0.2秒，正好可以打两个字符。要是在这0.2秒里面，又有新的字符传过来，那么这个字符将丢失。于是，研制人员想了个办法解决这个问题，就是在每行后面加两个表示结束的字符。一个叫做“回车”，告诉打字机把打印头定位在左边界；另一个叫做“换行”，告诉打字机把纸向下移一行。这就是“换行”和“回车”的来历，从它们的英语名字上也可以看出一二。后来，计算机发明了，这两个概念也就被般到了计算机上。那时，存储器很贵，一些科学家认为在每行结尾加两个字符太浪费了，加一个就可以。于是，就出现了分歧。Unix系统里，每行结尾只有“<换行>”，即“\n”；Windows系统里面，每行结尾是“<换行><回车 >”，即“\n\r”；Mac系统里，每行结尾是“<回车>”。一个直接后果是，Unix/Mac系统下的文件在Windows里打开 的话，所有文字会变成一行；而Windows里的文件在Unix/Mac下打开的话，在每行的结尾可能会多出一个^M符号。


```
#!/bin/bash

a=10
echo "Value of a is $a \n"
```

## 命令替换 \`command\`
命令替换是指Shell可以先执行命令，将输出结果暂时保存，在适当的地方输出,例如

```
#!/bin/bash

DATE=`date`
echo "Date is $DATE"
```

## 变量替换
- ${var}	变量本来的值
- ${var:-word}	如果变量 var 为空或已被删除(unset)，那么返回 word，但不改变 var 的值。
- ${var:=word}	如果变量 var 为空或已被删除(unset)，那么返回 word，并将 var 的值设置为 word。
- ${var:?message}	如果变量 var 为空或已被删除(unset)，那么将消息 message 送到标准错误输出，可以用来检测变量 var 是否可以被正常赋值。
- 若此替换出现在Shell脚本中，那么脚本将停止运行。
- ${var:+word}	如果变量 var 被定义，那么返回 word，但不改变 var 的值。

# 运算符
原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。
```
#!/bin/bash

val=`expr 2 + 2`  # 表达式和运算符之间要有空格
echo "Total value : $val"
```

## 算数运算符
- 运算符	说明	举例
- +	加法	`expr $a + $b` 结果为 30。
- -	减法	`expr $a - $b` 结果为 10。
- *	乘法	`expr $a \* $b` 结果为  200。  #注意乘法要用\\*
- /	除法	`expr $b / $a` 结果为 2。
- %	取余	`expr $b % $a` 结果为 0。
- =	赋值	a=$b 将把变量 b 的值赋给 a。
- ==	相等。用于比较两个数字，相同则返回 true。	[ $a == $b ] 返回 false。 # 条件表达式要放在方括号之间，并且要有空格
- !=	不相等。用于比较两个数字，不相同则返回 true。	[ $a != $b ] 返回 true。

## 关系运算符
- 运算符	说明	举例
- -eq	检测两个数是否相等，相等返回 true。	[ $a -eq $b ] 返回 true。
- -ne	检测两个数是否相等，不相等返回 true。	[ $a -ne $b ] 返回 true。
- -gt	检测左边的数是否大于右边的，如果是，则返回 true。	[ $a -gt $b ] 返回 false。
- -lt	检测左边的数是否小于右边的，如果是，则返回 true。	[ $a -lt $b ] 返回 true。
- -ge	检测左边的数是否大等于右边的，如果是，则返回 true。	[ $a -ge $b ] 返回 false。
- -le	检测左边的数是否小于等于右边的，如果是，则返回 true。	[ $a -le $b ] 返回 true。

## 布尔运算符
- 运算符	说明	举例
- !	非运算，表达式为 true 则返回 false，否则返回 true。	[ ! false ] 返回 true。
- -o	或运算，有一个表达式为 true 则返回 true。	[ $a -lt 20 -o $b -gt 100 ] 返回 true。
- -a	与运算，两个表达式都为 true 才返回 true。	[ $a -lt 20 -a $b -gt 100 ] 返回 false。

## 字符串运算符
- 运算符	说明	举例
- =	检测两个字符串是否相等，相等返回 true。	[ $a = $b ] 返回 false。
- !=	检测两个字符串是否相等，不相等返回 true。	[ $a != $b ] 返回 true。
- -z	检测字符串长度是否为0，为0返回 true。	[ -z $a ] 返回 false。
- -n	检测字符串长度是否为0，不为0返回 true。	[ -z $a ] 返回 true。
- str	检测字符串是否为空，不为空返回 true。	[ $a ] 返回 true。

## 文件测试运算符
- 操作符	说明	举例
- -b file	检测文件是否是块设备文件，如果是，则返回 true。	[ -b $file ] 返回 false。
- -c file	检测文件是否是字符设备文件，如果是，则返回 true。	[ -b $file ] 返回 false。
- -d file	检测文件是否是目录，如果是，则返回 true。	[ -d $file ] 返回 false。
- -f file	检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。	[ -f $file ] 返回 true。
- -g file	检测文件是否设置了 SGID 位，如果是，则返回 true。	[ -g $file ] 返回 false。
- -k file	检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。	[ -k $file ] 返回 false。
- -p file	检测文件是否是具名管道，如果是，则返回 true。	[ -p $file ] 返回 false。
- -u file	检测文件是否设置了 SUID 位，如果是，则返回 true。	[ -u $file ] 返回 false。
- -r file	检测文件是否可读，如果是，则返回 true。	[ -r $file ] 返回 true。
- -w file	检测文件是否可写，如果是，则返回 true。	[ -w $file ] 返回 true。
- -x file	检测文件是否可执行，如果是，则返回 true。	[ -x $file ] 返回 true。
- -s file	检测文件是否为空（文件大小是否大于0），不为空返回 true。	[ -s $file ] 返回 true。
- -e file	检测文件（包括目录）是否存在，如果是，则返回 true。	[ -e $file ] 返回 true。

# 注释
以“#”开头的行就是注释，会被解释器忽略。

sh里没有多行注释，只能每一行加一个#号。

如果在开发过程中，遇到大段的代码需要临时注释起来，过一会儿又取消注释，怎么办呢？每一行加个#符号太费力了，可以把这一段要注释的代码用一对花括号括起来，定义成一个函数，没有地方调用这个函数，这块代码就不会执行，达到了和注释一样的效果。

# 字符串
字符串可以用单引号，也可以用双引号，也可以不用引号
## 单引号 str=\'this is a string\'
单引号字符串的限制：
- 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
- 单引号字串中不能出现单引号（对单引号使用转义符后也不行）。

## 双引号
```
your_name='qinjx'
str="Hello, I know your are \"$your_name\"! \n"
```
双引号的优点：
- 双引号里可以有变量
- 双引号里可以出现转义字符

## 字符串拼接
```
your_name="qinjx"
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"

echo $greeting $greeting_1
```

## 获取字符串长度
```
string="abcd"
echo ${#string} #输出 4
```

## 提取子字符串
```
string="alibaba is a great company"
echo ${string:1:4} #输出liba
```

## 查找字符串
```
string="alibaba is a great company"
echo `expr index "$string" is`
```
注意mac下的expr不支持

# 数组
bash支持一维数组（不支持多维数组），并且没有限定数组的大小。

## 定义数组
```
array_name=(value0 value1 value2 value3)

# or
array_name=(
value0
value1
value2
value3
)

# or
array_name[0]=value0
array_name[1]=value1
array_name[2]=value2
# 可以不使用连续的下标，而且下标的范围没有限制
```

## 读取数组
读取数组元素值的一般格式是：${array_name[index]}
```
NAME[0]="Zara"
echo "First Index: ${NAME[0]}"
```
使用@ 或 * 可以获取数组中的所有元素，例如：
```
#!/bin/sh

NAME[0]="Zara"
NAME[1]="Qadir"
NAME[2]="Mahnaz"
NAME[3]="Ayan"
NAME[4]="Daisy"
echo "First Method: ${NAME[*]}"
echo "Second Method: ${NAME[@]}"
```
输出
```
$./test.sh
First Method: Zara Qadir Mahnaz Ayan Daisy
Second Method: Zara Qadir Mahnaz Ayan Daisy
```

## 获取数组的长度
```
# 取得数组元素的个数
length=${#array_name[@]}
# 或者
length=${#array_name[*]}
# 取得数组单个元素的长度
lengthn=${#array_name[n]}
```

# echo
echo是Shell的一个内部指令，用于在屏幕上打印出指定的字符串。命令格式：
`echo arg`
您可以使用echo实现更复杂的输出格式控制。
## 显示转义字符

echo "\"It is a test\""

结果将是：
"It is a test"

双引号也可以省略。

## 显示变量

name="OK"
echo "$name It is a test"
结果将是：
OK It is a test

同样双引号也可以省略。

如果变量与其它字符相连的话，需要使用大括号（{ }）：
mouth=8
echo "${mouth}-1-2009"
结果将是：
8-1-2009

## 显示换行

echo "OK!\n"
echo "It is a test"
输出：
OK!
It is a test

## 显示不换行

echo "OK!\c"
echo "It is a test"
输出：
OK!It si a test

## 显示结果重定向至文件

echo "It is a test" > myfile

## 原样输出字符串

若需要原样输出字符串（不进行转义），请使用单引号。例如：
echo '$name\"'

## 显示命令执行结果

echo `date`
结果将显示当前日期

从上面可看出，双引号可有可无，单引号主要用在原样输出中。

# printf
printf 命令的语法：
`printf  format-string  [arguments...]`

这里仅说明与C语言printf()函数的不同：
- printf 命令不用加括号
- format-string 可以没有引号，但最好加上，单引号双引号均可。
- 参数多于格式控制符(%)时，format-string 可以重用，可以将所有参数都转换。
- arguments 使用空格分隔，不用逗号。

```
# format-string为双引号
$ printf "%d %s\n" 1 "abc"
1 abc
# 单引号与双引号效果一样
$ printf '%d %s\n' 1 "abc"
1 abc
# 没有引号也可以输出
$ printf %s abcdef
abcdef
# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
$ printf %s abc def
abcdef
$ printf "%s\n" abc def
abc
def
$ printf "%s %s %s\n" a b c d e f g h i j
a b c
d e f
g h i
j
# 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
$ printf "%s and %d \n"
and 0
# 如果以 %d 的格式来显示字符串，那么会有警告，提示无效的数字，此时默认置为 0
$ printf "The first program always prints'%s,%d\n'" Hello Shell
-bash: printf: Shell: invalid number
The first program always prints 'Hello,0'
$
```
> 注意，根据POSIX标准，浮点格式%e、%E、%f、%g与%G是“不需要被支持”。这是因为awk支持浮点预算，且有它自己的printf语句。这样Shell程序中需要将浮点数值进行格式化的打印时，可使用小型的awk程序实现。然而，内建于bash、ksh93和zsh中的printf命令都支持浮点格式。

# if else
- if ... fi 语句；
- if ... else ... fi 语句；
- if ... elif ... else ... fi 语句
- test 命令用于检查某个条件是否成立，与方括号([ ])类似
语法
```
if [ expression ]
then
   Statement(s) to be executed if expression is true
fi
```
expression 和方括号([ ])之间必须有空格，否则会有语法错误

# case
```
echo 'Input a number between 1 to 4'
echo 'Your number is:\c'
read aNum
case $aNum in
    1)  echo 'You select 1'
    ;;
    2)  echo 'You select 2'
    ;;
    3)  echo 'You select 3'
    ;;
    4)  echo 'You select 4'
    ;;
    *)  echo 'You do not select a number between 1 to 4'
    ;;
esac
```

# for
```
for 变量 in 列表
do
    command1
    command2
    ...
    commandN
done
```

# while
```
while command
do
   Statement(s) to be executed if command is true
done
```
例如:
```
COUNTER=0
while [ $COUNTER -lt 5 ]
do
    COUNTER='expr $COUNTER+1'
    echo $COUNTER
done
```
或者用来读取信息
```
echo 'type <CTRL-D> to terminate'
echo -n 'enter your most liked film: '
while read FILM
do
    echo "Yeah! great film the $FILM"
done
```

# until
until 循环执行一系列命令直至条件为 true 时停止。
```
until command
do
   Statement(s) to be executed until command is true
done
```
例如:
```
#!/bin/bash

a=0

until [ ! $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done
```

# break & continue
break命令允许跳出所有循环（终止执行后面的所有循环）。break 命令后面还可以跟一个整数，表示跳出第几层循环.
continue命令与break命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。
```
#!/bin/bash
while :
do
    echo -n "Input a number between 1 to 5: "
    read aNum
    case $aNum in
        1|2|3|4|5) echo "Your number is $aNum!"
        ;;
        *) echo "You do not select a number between 1 to 5, game is over!"
            break
        ;;
    esac
done
```

# 函数
```
Shell 函数的定义格式如下：
function_name () {
    list of commands
    [ return value ]
}
如果你愿意，也可以在函数名前加上关键字 function：
function function_name () {
    list of commands
    [ return value ]
}
函数返回值，可以显式增加return语句；如果不加，会将最后一条命令运行结果作为返回值。
Shell 函数返回值只能是整数，一般用来表示函数执行成功与否，0表示成功，其他值表示失败。如果 return 其他数据，比如一个字符串，往往会得到错误提示：“numeric argument required”。
如果一定要让函数返回字符串，那么可以先定义一个变量，用来接收函数的计算结果，脚本在需要的时候访问这个变量来获得函数返回值。

```

## 调用函数
调用函数只需要给出函数名，不需要加括号。

## 删除函数
像删除变量一样，删除函数也可以使用 unset 命令，不过要加上 .f 选项，如下所示：
```
$unset .f function_name
```

## 函数参数
在Shell中，调用函数时可以向其传递参数。在函数体内部，通过 $n 的形式来获取参数的值，例如，$1表示第一个参数，$2表示第二个参数...
$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。
另外，还有几个特殊变量用来处理参数，前面已经提到：
- $#	传递给函数的参数个数。
- $*	显示所有传递给函数的参数。
- $@	与`$*`相同，但是略有区别，请查看Shell特殊变量。
- $?	函数的返回值。

# 输入输出重定向
## 输出重定向
```
$ command > file # 输出重定向会覆盖文件内容
```
or
```
$ command >> file # 如果不希望文件内容被覆盖，可以使用 >> 追加到文件末尾
```

## 输入重定向
```
command < file
```

## 标准错误文件stderr
标准错误文件(stderr)：stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息。
```
$command 2 > file # stderr 重定向到 file
```
or
```
$command 2 > file # stderr 追加到 file 文件末尾
```
or
```
$command > file 2>&1 # 将 stdout 和 stderr 合并后重定向到 file
```
or
```
$command >> file 2>&1
```
or
```
$command < file1 >file2 # 对 stdin 和 stdout 都重定向
```

## 嵌入文档
```
command << delimiter
    document
delimiter
```

## /dev/null 文件
如果希望执行某个命令，但又不希望在屏幕上显示输出结果，那么可以将输出重定向到 /dev/null：
```
 $ command > /dev/null # 将命令的输出重定向到它，会起到”禁止输出“的效果。
```
如果希望屏蔽 stdout 和 stderr，可以这样写：
```
$ command > /dev/null 2>&1
```

# shell文件包含
. filename
或
source filename


# 常用脚本
获取busybox的命令并用alias输出，存到一个sh文件中，通过source命令执行即可完成命令映射
```
#!/bin/sh

for var in $(adb shell busybox | sed -n "$[$(adb shell busybox | sed -n '/Currently\ defined\ functions/=')+1],$ p") ; 
do 
    echo ${var} | awk -F',' '{printf("alias %s=\047busybox %s\047\n",$1,$1)}'
done
```
