Monkey 笔记
====

# Monkey链接
- [monkey](http://developer.android.com/intl/zh-cn/tools/help/monkey.html)
- [monkeyrunner](http://developer.android.com/intl/zh-cn/tools/help/monkeyrunner_concepts.html)

# 教程
- [使用 monkeyrunner](http://www.cnblogs.com/youxilua/archive/2011/11/12/2246576.html)
- [androidmonkey](https://code.google.com/p/androidmonkey/) -- Tester/User can easily use the library to create random test cases to test android apps with GUI. -[使用的例子](http://blog.csdn.net/itfootball/article/details/45697575#t0)  - 这就是一个典型的使用monkey源码的例子啊
- [极客学院monkey学习视频](http://www.jikexueyuan.com/course/1851.html)

# 用shell管理monkey
[shell 管理 monkey 压力测试](https://testerhome.com/topics/3553)

# Motivation
为类似QQ这样不能重新签名的Android应用编写自动化测试用例……能够满足这个要求的测试技术只有monkey。可是不知道Google是出于什么考虑，只把monkey设计成一个随机发送按键消息的程序 – 跟猴子一样，在手机键盘上乱敲乱点；而没有给monkey加上类似Instrumentation的抓取控件的支持。


# 让Monkey获得控件的方法
- [使用 ViewServer](http://www.cnblogs.com/vowei/archive/2012/10/12/2721846.html)
- [使用Dump命令]()


# Android注入事件的三种方法
- 内部API - 只能在自己的应用中
- instrumentation  - 在应用内操作的话完全没有问题，但一旦跳出这个应用去触发按键事件的话就会崩溃。
- 直接注入事件到设备/dev/input/eventX

```
需要root
设备文件eventX默认是被设置为660这个权限的(Owner和同组成员有读写，而owner是root)。为了向这个设备注入事件，你必须让它能可写

adb shell
su
chmod 666 /dev/input/event3 
```

# Monkey用法
## 命令列表

```
usage: monkey [-p ALLOWED_PACKAGE [-p ALLOWED_PACKAGE] ...]
              [-c MAIN_CATEGORY [-c MAIN_CATEGORY] ...]
              [--ignore-crashes] [--ignore-timeouts]
              [--ignore-security-exceptions]
              [--monitor-native-crashes] [--ignore-native-crashes]
              [--kill-process-after-error] [--hprof]
              [--pct-touch PERCENT] [--pct-motion PERCENT]
              [--pct-trackball PERCENT] [--pct-syskeys PERCENT]
              [--pct-nav PERCENT] [--pct-majornav PERCENT]
              [--pct-appswitch PERCENT] [--pct-flip PERCENT]
              [--pct-anyevent PERCENT] [--pct-pinchzoom PERCENT]
              [--pkg-blacklist-file PACKAGE_BLACKLIST_FILE]
              [--pkg-whitelist-file PACKAGE_WHITELIST_FILE]
              [--wait-dbg] [--dbg-no-events]
              [--setup scriptfile] [-f scriptfile [-f scriptfile] ...]
              [--port port]
              [-s SEED] [-v [-v] ...]
              [--throttle MILLISEC] [--randomize-throttle]
              [--profile-wait MILLISEC]
              [--device-sleep-time MILLISEC]
              [--randomize-script]
              [--script-log]
              [--bugreport]
              [--periodic-bugreport]
              COUNT
              
常用选项及参数说明
-p 允许的包名列表，可同时指定多个包名，每个包都需要使用“-p”参数指定。包名的获取，可参考 python 脚本get_package_name.py
—ignore-crashes 忽视应用 crash 报错，不指定该参数时，应用出现 crash，monkey 会自动停止发送事件，指定该参数后，mongkey 会在 crash 后也一直发送事件，知道所有事件发送完成
—ignore-timeouts 忽视超时导致的错误，即ANR的错误
—ignore-security-exceptions 忽视权限方面的错误
—monitor-native-crashes 监控由 C/C++ 代码引起的 crash
—ignore-native-crashes 忽视由 C/C++ 代码引起的 crash
—kill-process-after-error 当出现错误后杀掉应用的进程
—hprof 指定该选项后，monkey会在发送事件完成后生成性能报告，报告一般存放于/data/misc目录下，对报告的分析，需要使用Traceview
—pct-touch 设定 touch 事件比例
—pct-motion 设定手势事件比例，例如滑动事件
—pct-trackball 设定跟踪球事件的比例
—pct-syskeys 设定系统按键事件的比例，如 Home、Back、音量+/-等
—pct-nav 设定”基本”导航事件的比例
—pct-majornav 设定”主要”导航事件比例
—pct-appswitch 设定启动 Activity 的事件比例
—pct-pinchzoom 设定缩放事件比例
—pct-anyevent 设定其他事件比例
-s 设定种子数，方便用于重现 bug
-v 设定输出信息的详细级别，1个 -v 表示级别为1，2个 -v 表示级别为2
—throttle 设定事件之间的延时，单位为毫秒
COUNT 事件数目

```

## 基本用法
- adb shell monkey [options] <event-count>
- 例如:adb shell monkey -p com.android.settings 1000
- []代表可选参数，<>代表一定要填的参数

### 两种运行方式
一种是PC端直接运行`adb shell monkey [options] <event-count> > d:\monkey.txt`,这样输入输出流在PC端，直接保存在PC端的文件中即可。

另一种是先用`adb shell`进入手机shell,然后调用`monkey [options] <event-count> > mnt/sdcard/monkey.txt`,这样输入输出流在手机端，应保存在手机的文件中。

另外linux系统中有标准输出流（默认为1）和标准错误流（默认为2），我们可以将这两种输出流分别重定向。例如：

```
monkey -p com.chuanwg.chuanwugong -v -v -v 1000 1>/mnt/sdcard/monkey.txt 2>/mnt/sdcard/error.txt
```
在船务工的error.txt中输出

```
shell@hwH60:/mnt/sdcard $ cat error.txt
Can't open carrierweekinfo-conf.xml
```
在monkey.txt中输出
```
:Sending Touch (ACTION_MOVE): 0:(493.87717,1677.6576)
:Sending Touch (ACTION_MOVE): 0:(512.0884,1702.0065)
:Sending Touch (ACTION_MOVE): 0:(519.83636,1724.2574)
Events injected: 1000
:Sending rotation degree=0, persist=false
:Dropped: keys=0 pointers=1 trackballs=0 flips=0 rotations=0
## Network stats: elapsed time=9539ms (0ms mobile, 0ms wifi, 9539ms not connected)
// Monkey finished
```

测试中发现，在船务工运行过程中接受到了短信，导致了crash。

### 基本参数
- -p 指定包名，包名可以用`pm list packages`列出所有包名
- -c 指定catalog，如果应用没有这个标签是起不来的，我们可以自定义这个catalog，也可以测试。
- -s 指定伪随机数，指定随机数相同将生成相同的测试序列，可以重复
- —-throttle 设定事件之间的延时，单位为毫秒
- --randomize-throttle 和throttle配合使用 ，随机延时，0-throttle

```
—pct-touch 设定 touch 事件比例       类型0
—pct-motion 设定手势事件比例，例如滑动事件      类型1
—pct-trackball 设定跟踪球事件的比例，早期的手机有，现在应该都没了，可以设成0   类型3
—pct-syskeys 设定系统按键事件的比例，如 Home、Back、音量+/-，startcall等   类型7
—pct-nav 设定”基本”导航事件的比例，如上下左右，来自方向输入设备，好像是以前手机的上下左右，似乎没卵用，设成0   类型5
—pct-majornav 设定”主要”导航事件比例，如中间按键，回退，菜单等可能引发图形界面中动作的事件，好像也是以前手机的事件   类型6
—pct-appswitch 设定启动 Activity 的事件比例，作为最大覆盖包种全部Activity的一个方法。  类型8
—pct-pinchzoom 设定缩放事件比例    类型2
—pct-anyevent 设定其他事件比例  类型10
-pct-rotation 旋转   类型4
-pct -pinch 软键盘  类型9
```
- 以上设置每种事件的比率,所有事件加起来不能超过100


### 调试参数
控制测试过程

- --dbg-no-events,进入Activity不进一步生成测试用例
- --hprof 生成profile ，分析意义不大
- —ignore-crashes 忽视应用 crash 报错，不指定该参数时，应用出现 crash，monkey 会自动停止发送事件，指定该参数后，mongkey 会在 crash 后也一直发送事件，直到所有事件发送完成
—ignore-timeouts 忽视超时导致的错误，即ANR的错误
以上两个在平常测试过程中都要加上去。

- —ignore-security-exceptions 忽视权限方面的错误
- —monitor-native-crashes 监控由 C/C++ 代码引起的 crash
- —ignore-native-crashes 忽视由 C/C++ 代码引起的 crash
- —kill-process-after-error 当出现错误后杀掉应用的进程

验收测试，一旦出现错误马上终止。一般情况下都会忽略这些crash。

### 黑白名单
黑名单：不测试的应用
白名单：只测试的应用 和-p 效果一致

只能使用一个

 - [--pkg-blacklist-file PACKAGE_BLACKLIST_FILE]
 - [--pkg-whitelist-file PACKAGE_WHITELIST_FILE]

用txt一行存一个包名即可，然后用adb push <source> <dest>即可，一般用/data/loal/tmp/

## 如何结束Monkey运行

执行 Monkey 的过程中如果想中途停止 Monkey 程序的运行，需要将 Monkey 的进程杀掉。
windows 下使用findstr，linux/mac 下用grep
执行adb shell ps | grep monkey 第一个数字即进程号
获取到 monkey 进程的 pid 之后运行adb shell kill 进程ID

## ANR输出异常格式
`System.err.println("//NOT RESPONDING: "+processName+"(pid "+ pid + ")" )`

```
ANR输出输出LOG：// NOT RESPONDING: com.android.quicksearchbox (pid 6333)ANR in com.android.quicksearchbox (com.android.quicksearchbox/.SearchActivity)CPU usage from 8381ms to 2276ms ago:procrank:      adb shell procrankanr traces:    保存于/data/anr/traces.txtmeminfo:     adb shell dumpsys meminfoBugreport    adb bugreport  可选通过  --bugreport 参数控制
```

## Crash输出格式
```
System.err.println("// CRASH: " + processName + " (pid " + pid + ")");System.err.println("// Short Msg: " + shortMsg);System.err.println("// Long Msg: " + longMsg);System.err.println("// Build Label: " + Build.FINGERPRINT);System.err.println("// Build Changelist: " + Build.VERSION.INCREMENTAL);System.err.println("// Build Time: " + Build.TIME);System.err.println("// " + stackTrace.replace("\n", "\n// "));
```

```
CRASH输出输出LOG：// CRASH: com.android.quicksearchbox (pid 1699)// Short Msg: java.lang.NullPointerException// Long Msg: java.lang.NullPointerException: Attempt to invoke virtual method 'com.android.quicksearchbox.SourceResult com.android.quicksearchbox.Suggestions.getResult()' on a null object reference// Build Label: generic/vbox86p/vbox86p:5.0/LRX21M/buildbot12160004:userdebug/test-keys// Build Changelist: eng.buildbot.20141216.000103// Build Time: 1418684697000// java.lang.RuntimeException: Unable to stop activity {com.android.quicksearchbox/com.android.quicksearchbox.SearchActivity}: java.lang.NullPointerException: Attempt to invoke virtual method 'com.android.quicksearchbox.SourceResult com.android.quicksearchbox.Suggestions.getResult()' on a null object reference// 	at android.app.ActivityThread.performStopActivityInner(ActivityThread.java:3344)// 	at android.app.ActivityThread.handleStopActivity(ActivityThread.java:3390)// 	at android.app.ActivityThread.access$1100(ActivityThread.java:144)// 	at android.app.ActivityThread$H.handleMessage(ActivityThread.java:1307)// 	at android.os.Handler.dispatchMessage(Handler.java:102)// 	at android.os.Looper.loop(Looper.java:135)
```
anr traces:    保存于/data/anr/traces.txt


## 测试船务工过程中的bug
- Can't open carrierweekinfo-conf.xml
- 转到注册界面 -> 收到短信 -> crash