title: "Framer笔记"
tags:
---


> framer js是一个原型设计工具，用编程的方式

## 资源
- [官网](http://framerjs.com/)
- [github](https://github.com/koenbok/Framer)
- [framer中文网](https://framerjscn.github.io/)
- []()
## 教程
- [新手教程](https://medium.com/@designforhuman/new-to-framer-just-3-things-to-get-you-started-47397f27c71e)
- [很不错的slides](http://nlevin.com/framer)
---

> from

## 资源
- [官网](http://www.relativewave.com/form/)
- [pixate](http://www.pixate.com/)


## framer 注册
> mojado@gnu.org
959267c9140c1bd8b7b68e3b64219e

## 注意
- Framer 只能识别到 Sketch 中的图层组
- opacity为0时为透明，为1时为完全不透明
- default状态默认存在

## 技巧
以下内容提炼于
下面以example这个sketch文件为例,该sketch的结构如下:
--Circles
 |-Circle1
 |-Circle2
 |-Circle3

### import 从sketch 中import 会生成以下代码
```
example = Framer.Importer.load "imported/Example"
```

### 获取Circles对象:
```
example.Circles
example.Circle1
example.Circle2
example.Circle3
# 不需要像example.Circles.Circle1...这样获取对象
```
然后可以对它进行一系列操作
```
example.Circles.scale = 1.2   //所有圆放大1.2倍
example.Circle1.opacity = 0.5 //将圆1的透明度设为0.5
example.Circle1.rotation = 90 //将圆1旋转90度
```

### 动画
动画涉及到3方面的东西: Layer,Event,State
接下来的内容的材料来自于[该sketch](https://www.dropbox.com/s/4d95mgf76vvkmxb/framer101_inbox.sketch?dl=0)

### 层Layer
一般在层不要自己创建，除非需要特殊的效果的时候。
在sketch中进行UI方面的制作，交互交给framer来做。
导入sketch文件的时候framer会自动帮你创建层结构，和sketch中你定义的文件想对应
例如
```
inbox = Framer.Importer.load "imported/framer101_inbox"
inbox.fab.scale = 1.2
inbox.overlay.opacity = 0.5
```
你可以用inbox对象获得所有的层,并对层的属性进行改变

### 事件Event
 Click, TouchStart, TouchEnd, Drag, Scroll等

 - 点击事件Click
 ```
 inbox.fab.on Events.Click, ->
   inbox.fab.opacity = 0 // 点击后fab按钮消失
 ```

- 点按下去TouchStart
```
inbox.fab.on Events.TouchStart, ->
	inbox.fab.opacity = 0 // 按下去的时候fab按钮消失
```

- 点按放开TouchEnd
```
inbox.fab.on Events.TouchEnd, ->
	inbox.fab.opacity = 1 //放开的时候fab按钮显示
```

以上两个连起来就是按下去的时候fab按钮消失，抬起来的时候又出现

- 输出print
```
inbox.fab.on Events.Click, ->
	print "clicked" // 在右边页面显示控制台，打印clicked
	inbox.fab.opacity = 0
```

### 状态State
如果初始的层的状态是stateA,我们添加stateB，可以把状态想象成A和B之间预置的动画。
- 添加状态
```
inbox.fab.states.add
	fadeout: //状态B的名称fadeout,A的名称为default
		opacity: 0
		scale: 1.5
```
- 切换状态
```
inbox.fab.on Events.Click, ->
	inbox.fab.states.switch("fadeout")
  //或者用.next()也可以
```
切换状态时产生动画
- 改变动画效果
```
inbox.fab.on Events.Click, ->
	inbox.fab.states.animationOptions=curve:"spring(300,30,0)"   //spring为弹跳效果，三个参数分别为张力(tension)，摩擦力(friction)和速度(velocity)
	inbox.fab.states.switch("fadeout")
```

### 一个完整地实例
```
# This imports all the layers for "framer101_inbox" into framer101_inboxLayers
inbox = Framer.Importer.load "imported/framer101_inbox"

initFaceScale =0.5
inbox.face1.scale = initFaceScale
inbox.face2.scale = initFaceScale
inbox.face3.scale = initFaceScale
inbox.face4.scale = initFaceScale
inbox.face5.scale = initFaceScale

inbox.options.opacity = 0
inbox.overlay.opacity = 0
inbox.icon_write.opacity = 0
inbox.icon_write.rotation = -90

inbox.face1.states.add
	on:
		scale : 1
inbox.face1.states.animationOptions=curve:"spring(500,30,0)"

inbox.face2.states.add
	on:
		scale : 1
inbox.face2.states.animationOptions=curve:"spring(500,30,0)"

inbox.face3.states.add
	on:
		scale : 1
inbox.face3.states.animationOptions=curve:"spring(500,30,0)"

inbox.face4.states.add
	on:
		scale : 1
inbox.face4.states.animationOptions=curve:"spring(500,30,0)"

inbox.face5.states.add
	on:
		scale : 1
inbox.face5.states.animationOptions=curve:"spring(500,30,0)"

inbox.icon_write.states.add
	on:
		opacity : 1
		rotation: 0
inbox.icon_write.states.animationOptions=curve:"spring(500,30,0)"

inbox.icon_plus.states.add
	on:
		opacity : 0
		rotation: 90
inbox.icon_plus.states.animationOptions=curve:"spring(500,30,0)"

inbox.options.states.add
	on:
		opacity : 1
inbox.options.states.animationOptions=curve:"spring(300,30,0)"

inbox.overlay.states.add
	on:
		opacity : 1
inbox.overlay.states.animationOptions=curve:"spring(300,30,0)"

inbox.fab.on Events.Click, ->
	inbox.overlay.states.switch("on")
	inbox.options.states.switch("on")
	inbox.icon_write.states.switch("on")
	inbox.icon_plus.states.switch("on")
	inbox.face1.states.switch("on")
	inbox.face2.states.switch("on")
	inbox.face3.states.switch("on")
	inbox.face4.states.switch("on")
	inbox.face5.states.switch("on")

inbox.overlay.on Events.Click, ->
	inbox.overlay.states.switch("default")
	inbox.options.states.switch("default")
	inbox.icon_write.states.switch("default")
	inbox.icon_plus.states.switch("default")
	inbox.face1.states.switch("default")
	inbox.face2.states.switch("default")
	inbox.face3.states.switch("default")
	inbox.face4.states.switch("default")
	inbox.face5.states.switch("default")



```
