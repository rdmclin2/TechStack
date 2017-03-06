
> 会不会写makefile，从一个侧面说明了一个人是否具备完成大型工程的能力

查看[Makefile经典教程](http://blog.csdn.net/ruglcc/article/details/7814546)
程浩老师把原来blog的内容整理成了[电子书](https://htwm.readthedocs.org/zh_CN/latest/),我觉得非常好

# 基本
- Makefile中的命令，必须以[Tab]键开始
- 注释为#
- 变量用$(val)的方式调用
- .PHONY代表伪目标文件，如clean, .PHONY”来显示地指明一个目标是“伪目标”，向make说明，不管是否有这个文件，这个目标就是“伪目标”。只要有这个声明，不管是否有“clean”文件，要运行“clean”这个目标，只有“make clean”这样。
- clean从来都是放在文件的最后
- 在rm命令前面加了一个小减号的意思就是，也许某些文件出现问题，但不要管，继续做后面的事。
- 一般命名为Makefile(推荐),或makefile
- 第一条规则中的目标将被确立为最终的目标
- 如果命令太长，你可以使用反斜框（‘\’）作为换行符
- <"~" $HOME目录>  <"*" 通配符> 

# 一个例子
一个典型的Makefile如下:

```
edit : main.o kbd.o command.o display.o \
          insert.o search.o files.o utils.o
           cc -o edit main.o kbd.o command.o display.o \
                      insert.o search.o files.o utils.o
 
   main.o : main.c defs.h
           cc -c main.c
   kbd.o : kbd.c defs.h command.h
           cc -c kbd.c
   command.o : command.c defs.h command.h
           cc -c command.c
   display.o : display.c defs.h buffer.h
           cc -c display.c
   insert.o : insert.c defs.h buffer.h
           cc -c insert.c
   search.o : search.c defs.h buffer.h
           cc -c search.c
   files.o : files.c defs.h buffer.h command.h
           cc -c files.c
   utils.o : utils.c defs.h
           cc -c utils.c
   clean :
           rm edit main.o kbd.o command.o display.o \
              insert.o search.o files.o utils.o
```

使用变量进行简化:

```
objects = main.o kbd.o command.o display.o \
             insert.osearch.o files.o utils.o 
   edit : $(objects)
           cc -o edit $(objects)
   main.o : main.c defs.h
           cc -c main.c
   kbd.o : kbd.c defs.h command.h
           cc -c kbd.c
   command.o : command.c defs.h command.h
           cc -c command.c
   display.o : display.c defs.h buffer.h
           cc -c display.c
   insert.o : insert.c defs.h buffer.h
           cc -c insert.c
   search.o : search.c defs.h buffer.h
           cc -c search.c
   files.o : files.c defs.h buffer.h command.h
           cc -c files.c
   utils.o : utils.c defs.h
           cc -c utils.c
   clean :
           rm edit $(objects)
```

使用自动推倒以及伪目标:

```
objects = main.o kbd.o command.o display.o \
             insert.o search.o files.o utils.o
 
   edit : $(objects)
           cc -o edit $(objects)
 
   main.o : defs.h
   kbd.o : defs.h command.h
   command.o : defs.h command.h
   display.o : defs.h buffer.h
   insert.o : defs.h buffer.h
   search.o : defs.h buffer.h
   files.o : defs.h buffer.h command.h
   utils.o : defs.h
 
   .PHONY : clean
   clean :
           rm edit $(objects)
```