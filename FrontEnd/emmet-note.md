title: "emmet 用法教程"
date: 2015-06-20 22:26:35
categories: dev
tags: [dev,html,emmet]

---

对于前端开发人员来说,[emmet](http://emmet.io/)简直是神器,可以帮助你少写不少代码，提高编码效率，
最清晰的方式是在一个html文档中输入`html:5`,然后按tab键，然后：
```
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
</head>
<body>

</body>
</html>
```
一个完整的html页面框架就已经生成好了！但是要掌握emmet的用法还是需要一段时间的练习，因此本文总结整理
本屌在学习使用emmet过程中**常用**的代码片段，以备不时查阅。
其实差不多是在翻译emmet的英文文档。emmet多以插件的形式存在，安装就按照官网的来即可。

##一个常用稍复杂的emmet的例子
emmet是用缩写来简化输入的，和snippets类似，下面是一个常用的生成列表的缩写：

`#page>div.logo+ul#navigation>li*5>a{Item $}`

```
<div id="page">
  <div class="logo"></div>
  <ul id="navigation">
    <li><a href="">Item 1</a></li>
    <li><a href="">Item 2</a></li>
    <li><a href="">Item 3</a></li>
    <li><a href="">Item 4</a></li>
    <li><a href="">Item 5</a></li>
  </ul>
</div>

```

##emmet语法
###元素
例如div,p等，emmet并没有一套与定义的元素，任何词都会转成tag形式
如 `div -> <div></div>`

###嵌套操作符
- child: >
子节点，产生嵌套tag，如`div>ul>li`产生:
```
<div>
  <ul>
    <li></li>
  </ul>
</div>
```

- Sibling: +
兄弟节点，产生同层tag,如`div+ul+li`产生：
```
<div></div>
<ul></ul>
<li></li>
```
