Busybox笔记 
=====

# 什么是busybox
BusyBox 是标准 Linux 工具的一个单个可执行实现。BusyBox 包含了一些简单的工具，例如 cat 和 echo，还包含了一些更大、更复杂的工具，例如 grep、find、mount 以及 telnet。有些人将 BusyBox 称为 Linux 工具里的瑞士军刀.简单的说BusyBox就好像是个大工具箱，它集成压缩了 Linux 的许多工具和命令

# 安装
http://jingyan.baidu.com/article/6f2f55a1a000ceb5b83e6c74.html?st=3&net_type=1&bd_page_type=1&os=0&showimg=1&rst=2

# 使用技巧
1. busybox 里有 ash 和 hush 还有 sh 这几种 shell，在命令行输入 ash 或 hush，可以像在 bash 里那样，通过按上下键选择刚才输入的命令。
2. android系统本身就有ls命令，busybox里也有ls，输入ls时调用的是android的ls，那么想用busybox的ls就要每次都在前面加个busybox吗？不用，使用alias命令可以搞定。
alias ls='busybox ls'
同样的，cp、mv等二者都有的命令都可以这样搞定。也可以通过修改 /init.rc 来解决。

# 命令

