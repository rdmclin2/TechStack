title: "Head First HTML 与 CSS》读书笔记之CSS篇"
date: 2015-08-20 08:46:18
categories: web
tags: [css]
---

> 本文为阅读《Head First HTML 与 CSS》的css部分的读书笔记，方便回顾书上的知识，另一篇为[Head First HTML 与 CSS》读书笔记之HTML篇](http://mclspace.com/2015/08/19/html-note/)

<!--more -->

---

# 基本

## 常识与实践
- css的每一个语句包括一个场所，以及这个场所的一个属性，还要应用到这个属性一个样式,一个典型的css规则如下:
```
    p { // 需要增加样式的元素: p,这称为选择器(selector),匹配页面中的所有p元素
        background-color: red; //背景色为红色      格式: < 属性:值; >
        border: 1px solid gray; //边框: 1像素,实线,灰色
    }
```
- css 的注释: `/* */`
- [css验证工具](http://jigsaw.w3.org/css-validator/),你还可以把验证图标放到你的web页面中

---

## 链接方式

### 基本
最基本的方式就是直接在html文件中指定元素样式，这种方式不推荐，因为将表现层和结构层混起来了
```
"style="background-image:url({{user.avatar}})"
```

### 内部链接
要为html直接增加css样式，需要在<head>元素中增加开始和结束style标记，css规则放在里面
```
  <style>
    p {
       color: gray;
    }
  </style>
```

### css文件外置
另一种方式将css文件外置，如style.css,作为样式表(stylesheets),然后从html众创建一个到这个文件的外部链接,用<link>元素,用外部样式表的好处是要修改整个网站的样式，只要进入这个样式表，对css进行几处修改即可。如:
```
  <link type="text/css" rel="stylesheet" href="lounge.css" >
  #放到<head>元素中,在html5中不再需要type这个属性(可选),rel(relation)指定html与所链接文件间的关系,这里指我们要链接到一个样式表
  #link是一个void元素
```

---

## 多样式表
使用多个样式表,顺序很重要，一个样式表会覆盖在它上面链接的样式表中的样式,有时会有一个样式表作为页面的基础样式，要修改样式，链接这个样式表，然后在下面提供自己的样式表，指定要修改的样式,如下所示:
```
<link rel="stylesheet" href="corperate.css">//总公司样式
<link rel="stylesheet" href="beverage-division.css">//部门对总公司的样式做了一些补充，甚至可以覆盖公司的样式
<link rel="stylesheet" href="lounge-seattle.css">//西雅图休闲室对样式表做了自己的调整
```

---



## 简写
css属性太多，能不能不费吹灰之力就指定这些属性呢？可以把同一属性的值结合起来写成一句,即简写。

### 简写格式
#### `padding`
`padding: 0px 40px 30px 20px;`,顺序是上右下左,顺时针有木有,如果都相同可以用`padding: 20px;`
```
  padding-top: 0px;
  padding-right: 40px;
  padding-bottom:30px;
  padding-left: 20px;
```
#### `margin`
上面的padding格式同样对margin也适用,还有另一种方法,如果上下一样，左右一致,可以这样写:`margin: 0px 20px`,前面指定上下，后面指定左右。

#### `border`
边框属性简写 `border: thin solid #007e73;`,可以用你喜欢的任何顺序。

#### `background`
背景简写 `background: white url(images/cocktail.gif) repeat-x;`，同样顺序随便

#### `字体`
字体简写的格式稍微复杂一些:
```
  font : font-style font-variant font-weight font-size/line-height font-family
```
- font的属性中`font-size`必须有
- `font-size`前的属性是可选的，组合任意，不过必须出现在font-size之前
- `line-height`是可选的，只要在`font-size`后加/然后指定行高即可
- `font-family`名之间要使用逗号分隔
- 如: `font : small/1.6em Verdana, Helvetica, Arial,sans-serif;`

###简写的优劣
- 不一定要用简写形式，有些人觉得长形式更可读。
- 简写的好处: 缩写css文件大小，输入更快。
- 简写的不足: 如果存在问题，或者顺序有误，比较难调试
- 简写记起来复杂，可以用参考手册

----

# 选择

## 子孙选择器
父元素和子孙元素名之间有一个空格,子孙选择器会选择所有子孙，包括这个元素中嵌套的所有,不管嵌套多深,例如
```
  #elixirs h2 {//选择elixirs子孙的所有h2
    color: black;
  }
```

### 直接孩子
如果要选择直接的孩子,用>
```
  #elixirs>h2 {//选择elixirs的直接孩子h2
    color: black;
  }
```

### 复杂选择
更复杂的选择,方法还是一样
```
  #elixirs blockquote h2 {//选择elixirs中的blockquote中的h2元素
    color: blue;
  }
```

---

## 规则添加
- 要为多个元素编写一个规则，只需要在选择器之间加上逗号，如 "h1,h2"。
```
    h1,h2 {// 多个选择器
     font-family: sans-serif;
     color: gray;
    }
```
- 元素可以指定多次规则,例如我们想给h1添加下边框，但是不想给h2页也加上，也不想分解上面的规则，可以给h1再增加一个属性:
```
    h1,h2 {
     font-family: sans-serif;
     color: gray;
    }
    h1{
    border-bottom: 1px solid black;
    }
```
- 把元素的所有共同样式归组在一起(如果改变，只需要在一个规则中修改)，然后把一个元素特定的样式写在另一个规则中.

---

## 类
当我们用选择器选择元素使用一个规则时,会对所有该元素应用这个样式，所以如何单独地选择这些元素呢?这里就需要类class,class可以定义一类元素，对属于该类的所有元素应用样式.要将一个元素加入一个类，只需要增加属性"class",并提供类名,如"greentea":
```
  <p class="greentea">
  ...
  </p>
```

### 类元素选择器
先选择这个类中的元素,再用"."指定一个类,最后是类名,如:
```
  p.greentea {
    color: green;
  }
```

### 添加类元素
如果想对所有`<blockquote>`也做同样的处理，可以:
```
  blockquote.greentea,p.greentea {
      color: green;
  }
  <blockquote class = "greentea"
```

### 类选择器
如果想把`<h1>`,`<h2>`,`<h3>`,`<p>`和`<blockquote>`都增加到greentea呢？要对类中的所有元素都用同一样式可以用:
```
  .greentea{
    color: green;
  }
  /*省略所有元素名,只有一个点,则会应用到所有成员*/
```

### 多类元素
元素可以有多个类,例如:
```
  <p class="greentea raspberry blueberry"
  #各个类名用空格分隔
  #类中顺序不重要
```

### 特定元素选择器
如果多个选择器都选择了一个元素呢？例如上面的3个类都与p元素匹配，并且都定义了color属性，那么那个会胜出?
- 如果某个规则更特定，则选择更特定的元素
- 如果特定程度相同，那么会选择css文件中最后列出的规则，例如下面的例子中会选择p.blueberry的规则:
```
  p { color : black;} // 对于所有段落
  .greentea { color: green;} //对于所有greentea类，比上面特定
  p.greentea { color : green;} //只选择greentea类中的段落,比上面特定
  p.raspberry { color : blue;} //同上,与greentea特定程度相同
  p.blueberry { color : purple;} //同上,与greentea特定程度相同
```

---

## `id`

### `id`的作用
id属性用来唯一地命名元素,通常你想对多个元素重用某些样式，才能真正发挥类的作用。但是如果只有一个元素需要样式，或者页面上只有一个元素，那就应该使用id,每个元素只能有一个id，页面中只能有一个元素拥有特定id,一个元素有一个id，同时可以属于一个或多个类,id中不允许出现空格或其他特殊字符,如
```
  <p id="footer">...</p>
```

### 选择元素
用id选择一个元素,需要在id前面使用一个#字符(类是[.]),id选择器只与页面中的一个元素匹配
```
  #footer{
    color: red;
  }//选择id为footer的任意元素
```
```
p#footer{
  color: red;
}//选择id为footer的<p>元素
```

### 实践建议
- 在复杂页面中，可能有些页面把id指定给一个段落，有些页面分配给了一个列表，那么需要为该id定义多个规则,根据页面上不同类型的元素应用不同的规则,如p#someid和blockquote#someid
- 类名要以一个字母开头，不过id名可以以一个数字或字母开头，但它们都不能有空格

---

## 继承

### 样式继承
- 为p选择器增加font-family属性时，也会影响到`<p>`元素中内部元素的字体。
- 元素能够从他们的父元素继承样式。
- 不是所有的样式都能继承,只有一部分,如font-family。
- 并不是所有元素都会继承，如img没有文本，所以不会受到字体影响。
- 继承的样式可以覆盖,例如给`<em>`提供一个特定的规则来覆盖body中指定font-family,浏览器会使用更特定的规则：
```
  body {
    font-family : sans-serif;
  }

  em {
    font-family: serif;
  }
```

### 那哪些元素能够继承
- 如果样式会影响你的文本外观，那么所有这些样式都能继承,如color,font-family,font-size,font-weight,font-style等和字体相关的属性
- 其他属性不能继承，如边框，因为如果body元素有边框，不表示你希望body内的所有元素都有边框
- 根据常识确定，或者试试看

---

### 层叠
- 浏览器会用多个样式表组织样式，首先是你的ccs所有样式表，其次是用户创建的样式，最后浏览器本身会维护一组默认样式
- 给定一组样式表中的一组样式，浏览器会以层叠的方式确定具体使用哪个样式
- 读者可以在他的css属性上加上!important，那他就能覆盖你的样式
- 浏览器需要选择最特定的规则进行显示
- 特定性由3个数开始000：
 - 第一位: 这个选择器包含id吗？每个id加1分
 - 第二位: 这个选择器包含类或伪类吗？每个类和伪类加一分
 - 第三位: 这个选择器包含元素名吗？一个元素名加一分
- 把它们读作真正的数,100>010>001，例如h1.greentea的特定性值为011,ol li p的特定性为003。
- 浏览器首先收集样式表找到所有的声明,然后对所有匹配的规则按作者，读者和浏览器排序，再按特定性对组内的所有声明分别排序，
最后对于冲突的规则，按照他们在各个样式表中出现的顺序排序，如果两个规则得分相同，最后出现的规则胜出。

---

## 媒体查询

### link媒体查询
你可能想针对将要显示页面的设备调整页面的样式，可以用media属性,在link元素中增加这个属性.如
```
<link rel="stylesheet" href="lounge-mobile.css" mdeia="screen and (max-device-width: 480px)">
<link rel="stylesheet" href="lounge-print.css" media="print">
# 其他属性包括min-device-width,max-device-width,orientation(横向landscape,纵向portrait)
```

### css媒体查询
可以直接在css中增加媒体查询,使用@media规则,把对所有媒体类型都通用的规则放在@media规则下面,例如
```
@media screen and (min-device-width: 481px){//当设备屏幕宽度大于480px时使用
#guarantee {
  margin-right: 250px;
}
}
@media screen and (max-device-width: 480px){//当设备屏幕小于等于480px时使用
 #guarantee {
   margin-right: 30px;
 }
}
@media print { // 如果要打印页面，使用该规则
body {
  font-family: Times, "Times New Roman", serif;
}
}
```

### 实践建议
- 如果css文件相当庞大，建议使用link元素
- 除了给出设备的媒体属性，如果你更关心浏览器大小，可以用max-width和min-width

---

# 属性

## 盒模型
盒模型是css看待元素的一种方式，css将每个元素看作由一个盒子表示,每个盒子由一个内容区以及可选的内边距，边框和外边距组成。由内而外分别是:
- `内容区`: content ,包含内容，如文本或图像
- `透明内边距`: padding ,可选,包围内容区
- `边框`: border ,可选,内边距周围
- `透明外边距`: margin,可选,包围所有部分

### 内容区
内容区包含元素的内容，它的大小通常正好包含全部内容

### `padding` 内边距
- 使用内边距可以在内容与盒子边框之间创建一些看得到的空间
- css可以控制内边距的宽度，甚至任意一边的宽度,上下左右
- 透明,无法指定样式
- 元素的背景颜色或背景图像会延伸到内边距下面，但不会延伸到外边距
- 设置padding的顺序很重要，如果先设置padding-left再设置padding，刚才设置的padding-left就会被覆盖
```
  padding: 25px;
  padding-left: 80px;
  # 我们首先有一个属性来控制所有4个边，另外再对每个边单独设置
```

### `border` 边框
- 他是围绕内容的一条线
- 边框可以有不同的宽度，颜色和样式
- 内边距将内容区与边框隔开
- 可以指定任意一边的边框样式 border-top-color,border-top-style,border-top-width等
- 锯齿边框(破折线＋白色):
```
    border-style: dashed;
    border-color: white;
```

### `border-style` 边框样式
- `solid` 实线
- `ridge` 脊线
- `dashed` 破折
- `dotted` 虚线
- `double` 双线
- `groove` 槽线
- `outset` 外凸
- `inset` 内凸

### `border-width` 边框宽度
- 关键字 thin medium thick
- 像素 5px;

### `border-color` 边框颜色
和color 类似,使用颜色名，rgb或16进制码

### `border-radius` 边框圆角
- 可以为4个角分别指定，如border-top-left-radius
- 可以用px或em(相对于元素字体大小)
```
  border-radius: 15px;
```

### `margin` 外边距
- 用外边距在同一个页面上的不同元素之间增加空间
- 和内边距一样，css可以控制外边距的宽度，甚至任意一边的宽度,上下左右
- 透明,无法指定样式
- 和padding一样，设置margin的顺序很重要
```
    margin: 30px;
    margin-right: 250px;
```

---

## `color` 颜色

### 文本元素的字体颜色
- color 元素实际控制着一个元素的前景色,他会控制文本和边框颜色，不过你也可以用border-color属性为边框指定自己的颜色
- 改变p的字体颜色不会影响里面的链接颜色.
- web颜色按构成颜色的红，绿，蓝三个分量所占数量来指定,每种颜色会分别指定一个从0到100%的数值,然后把它们混合起来得到最终的颜色.如100%红,100%绿，100%蓝混合在一起是白色。所有指定web颜色的方法最终都是告诉浏览器：一个颜色的红绿蓝分量分别是多少.
- 对于文本和背景，要使用对比度最大的颜色，能提高可读性

### 用16进制码指定指定颜色
- 如`#fc1257`,这种方式最常用
- 以#开头,分别用2位数字指定红绿蓝
- 例如:
```
  body {
      background-color: #cc6600;
    }
```
- [wiki的web颜色表](http://en.wikipedia.org/wiki/web_colors)
- 如果每一组分量中的两位数字都相同，可以使用简写,例如`#ccbb00`可以简写成`#cb0`,不过如果是`#ccbb10`则不能简写

### 按名指定颜色
- css只定义了大约150个颜色名,颜色名不区分大小写
- 16种基本颜色,所有浏览器都有,以及150种扩展色,它们是:`aqua, black, blue, fuchsia, gray, green, lime, maroon, navy, olive, purple, red, silver, teal, white, yellow`
- 例如:
```
    body {
      background-color: silver;
    }
```

### 用红绿蓝值指定颜色
以rgb开头，在小括号里指定红绿蓝的百分比,例如:
```
  body{
    background-color: rgb(80%, 40% , 0%)//橙色
  }
```
还可以指定0-255之间的一个数值,例如:
```
body{
  background-color: rgb(204, 102, 0)//和上面颜色一致,255*80% = 204...
}
```

---

## `font-family` 字体
大多数计算机上通常只安装了部分字体,所以选择字体时要当心,通常指定的font-family包含一个候选字体列表,他们都来自同一个字体系列,候选字体用逗号分隔,大小写字母必须一致,最后总是放一个通用的字体系列名,如果一个字体名中包含多个单词,比如Courier New，如何指定？用引号,"Courier New",如:
```
  body{
    font-family: Verdana, Geneva, Arial, sans-serif;
  }
```
### 字体系列
每个font-family包含一组有共同特征的字体。共有5个字体系列:
- `Sans-serif` : 无衬线体 , 在计算机上更容易识别, 很多人认为在计算机显示中最适合体文本,包括: [`Verdana` : 大多数pc上都有],[`Geneva` : 大多数Mac上都有],[`Arial` : 在PC和Mac上都很常见]

- `Serif` : 有衬线体 , 新闻报纸的文字排版

- `Monospace` : 固定宽度的字符,主要用于显示软件代码示例

- `Cursive` : 看似手写的字体 , 有时会看到在标题中偶尔使用

- `Fantasy` : 包含有某种风格的装饰性字体

### `@font-face` 指定字体
- `@font-face` 允许你定义一种字体的名字和位置,然后可以在你的页面中使用。
- web字体标准: 字体文件使用".woff"文件扩展名,表示web开放字体格式(web open font format)
- 常用字体格式: ［`TrueType` : .ttf］，［`OpenType` : .otf 建立在tt之上］，［`Embedded OpenType字体` : .eot otf的压缩形式 微软专用，仅ie支持］，［`SVG字体` : .svg 通用图像格式］，［`Web开放字体格式` : .woff 推荐使用,浏览器支持最广泛］
- 缺点: 获取字体需要花费时间，第一次获取字体时页面性能可能会受影响。管理多个字体文件痛苦，最后移动设备和小型设备不支持。
- 有字体托管服务可以为你托管web字体。
- 浏览器会先在用户计算机上查找Verdana字体，如果有，这个元素就使用这个字体，如果不可用，找Geneva,以此类推,
如果前面指定的字体都没有找到，就用浏览器默认的Sans-serif字体，就是我们最后指定的通用字体。
- 利用font-family可以创建一个首选字体列表
- 把该规则增加到文件的最上面,放在body规则之上
```
    @font-face {
    font-family: "Emblema One"; //创建一个名字
    src: url("http://wickedlysmart.com/hfhtmlcss/chapter8/journal/EmblemaOne-Regular.woff"),
         url("http://wickedlysmart.com/hfhtmlcss/chapter8/journal/EmblemaOne-Regular.tff");
    //src属性告诉浏览器到哪里找到这个字体,浏览器会尝试每一个src文件，直到找到它支持的一个文件。
    }
```

### `@import`
`@import` 允许导入其他CSS文件


### `font-weight` 控制文本的粗细
- `lighter` : 相对于继承的值使文本稍细一点。
- `normal` : 正常
- `bold` : 粗体
- `bolder` : 相对于继承的值使文本稍粗一点。
- 还可以设置为100到900之间的一个数（100的倍数),不过并没有广泛支持，通常不使用

### `font-size` 让文本更大或更小
- 像素px指定大小 : `font-size: 14px;` //告诉浏览器字母高度是多少像素.14px中间不能有空格
- 百分数%指定大小 : `font-size: 150%;` //指定相对于父元素的字体大小
- em指定字体大小 : `font-size: 1.2em;` //指定相对于父元素的字体的比例因子,称为相对大小
- 好吧，百分数和em看上去差别不大，可能%更容易理解些,例子:
```
  body {
      font-size: 14px;
  }
  h1 {
      font-size: 150%; //父元素body,这里是14*150% = 21px
  }
  h2 {
      font-size: 1.2em; //父元素body,这里是14*1.2 = 17px
  }
```
- 关键字指定字体大小 : `font-size: small;`, small通常定义为12px,下面每一级大小约比前一个大小大20%，包括:`xx-small`,`x-small`,`small`,`medium`,`large`,`x-large`,`xx-large`

### 指定字体大小的秘诀
(1)选择一个关键字(推荐small或medium),作为body的字体大小,为页面默认字体大小 (2)使用em或百分数,相对于body字体大小指定其他元素的字体大小(em或百分数)这样改变web页面中字体大小就很容易，只要改变body字体大小就可以了,例如:
```
  body { font-size : small; }
  h1 { font-size : 150%; }
  h2 { font-size : 120%; }
```
注意老版IE不支持用像素指定的文本缩放

### 浏览器默认字体大小
- 大多数情况下，浏览器默认的body字体大小都是16像素
- 如果在body中指定字体大小为90%,这将是默认字体的90%
- h1 : 200%, 相对于默认字体,下同
- h2 : 150%
- h3 : 120%
- h4 : 100%
- h5 : 90%
- h6 : 60%

### `text-decoration` 文本装饰
- `underline` : 下划线 ,下划线文本通常被用户误认为是链接文本，所以要谨慎使用
- `none` : 无效果
- `overline` : 上划线
- `line-through` : 删除线,html有个<del>的元素可以将内容标记为要删除的内容
- 一次可以设置多个装饰
- 如果文本继承了你不想要的文本装饰，可以使用值"none"来去除装饰
- 如果em有两个不同的规则，不会累加，要把这两个值合并到一个规则中，才能同时得到这两个文本装饰.
- 例如:
```
  em {
    text-decoration: line-through;
  }
```


### `font-style` 字体风格
- `italic` : 斜体 ,斜体文本向右倾斜,另外衬线还有弯曲
- `oblique` : 倾斜 ,并不是使用一组专门设计的倾斜字符,而是由浏览器将正常文字倾斜

### `list-style` 改变列表中列表项的外观
- 列表的主要属性是`list-style-type`,利用这个属性可以控制列表中使用的项目符号
  - `disc`,默认
  - `circle`,圆圈标记
  - `square`,方块标记
  - `none`，删除列表标记

### 定制列表标记
- 如果想定制列表的标记，可以用`list-style-image`为列表设置标记图像,如:
```
li{
  list-style-image: url(images/backpack.gif);
  padding-top: 5px;
  margin-left: 20px;
}
```
- 对于有序列表也一样，可以用`list-style-type`控制一个有序列表标记:
 - `decimal`,十进制
 - `upper-alpha`,大写字母
 - `lower-alpha`,小写字母
 - `upper-roman`,大写罗马数字
 - `lower-roman`,小写罗马数字
- 列表项的项目符号的位置如何控制?用`list-style-position`,有两个取值`inside`(标记在列表项里)和`outside`（列表项外)。
区别如下:![区别](http://www.wibibi.com/upload/20130930162132.png)


## 其他属性

### `left` 指定一个元素的左边所在位置

### `top` 控制一个元素顶部的位置

### `background-image` 在元素后面放置一个图像,如
```
  background-image: url(images/background.gif);
  //用url括起来,注意没有引号
```

### `background-repeat` 背景图像是否重复
- 默认在水平和垂直方向上重复
- 控制平铺行为,no-repeat,repeat-x,repeat-y,inherit;
```
  background-repeat: no-repeat;
```

### `background-position` 背景图像的位置
- 可以按像素指定，或百分数,还可以用关键字,如top,left,right,bottom和center
```
  background-position: top left;
```

### `background-color` 控制元素的背景颜色

### `text-align` 对齐
- text-align会对块元素中的所有内联内容对齐,而不仅仅是文本
- text-align只能在块元素上设置，对内联元素无效
- `left` 左对齐
- `center` 居中
- `right` 右对齐

### `letter-spacing` 在字母之间设置间距

### `line-height` 设置文本元素中的行间距
```
    body {
        font-size: small;
        font-family: Verdana, Helvetica, Arial, sans-serif;
        line-height: 1.6em; //调整为字体大小的1.6倍
    }
```
- line-height元素有点特殊,可以对它直接使用一个数,而不是相对度量,代表各元素行高是其自己字体大小的多少倍
```
 #elixirs {
   line-height: 1;//代表elixirs中的所有元素的行间距为其自己字体大小的1倍
 }
```
- 设置`line-height`为`normal`，允许浏览器选择一个适当的行高大小,通常根据字体来确定。

### `border-bottom` 下边框
- 下边框会延伸到页面边缘,但是文本的underline属性的下划线只会出现在文本下面
- 1px solid black

### `width` 指定元素宽度
- 宽度永远是设置的值
- width属性只指定内容区的宽度
- 要确定整个盒子的宽度，需要将内容区的宽度加上左和右内边距,左右外边距和边框的宽度
- 一个块的默认宽度为"auto",它会延伸占满可用的空间
- 如果使用百分数，那么宽度会计算为元素所在容器宽度的一个百分比
- 高度也是默认的，也是"auto",一般，不用指定元素的高度，就让它们默认为auto


### `a`元素和它的多重人格
- 页面上的链接有多重显示样式，包括未访问，已访问或者处于悬停状态等(还有focus和active),这里需要用到伪类
- foucs是指浏览器将焦点放在你的链接上时就是焦点状态，浏览器允许用户按下tab键轮流访问时，浏览器访问到某个链接，某个链接就拥有了"焦点"
- active是指用户第一次单击一个链接时，就处于活动状态。
－ a元素可能同时处于多个状态，一般认为适当的顺序是link,visited,hover,focus,active
- 例子:
```
  a:link {
    color: green;
  }
  a:visited {
    color: red;
  }
  a:hover {
    color: yellow;
  }
```

### 伪类
- 上面的a:link,a:visited和a:hover就是伪类
- 它们都允许我指定样式，就好像他们是类一样，但是没有人在html中真正输入这些类
- 浏览器会仔细检查所有a元素，把它们增加到正确的伪类中，如果一个链接已访问过，会放到:visited类中，如果悬停，浏览器会把这个链接
扔到:hover伪类中。浏览器会在后台向这些类增加和删除元素.
- 伪类不止能处理链接，还能对其他类型的元素提供处理，如first-child对应元素的第一个子元素。



# 布局和定位

## 流
- 流：浏览器从html文件最上面开始，从上到下沿着元素流逐个显示所遇到的各个元素。
- 块元素从上向下流，各元素之间有一个换行，内联元素从左上方流向右下方,在水平方向上相互挨着摆放（只要右边还有空间放的下）
- 文本是内联函数的特殊情况，浏览器会把它分解成适当大小的内联元素，以适应给定的空间。
- 对于外边距，浏览器并排放置两个内联元素时，外边距会相加，但是当上下放置两个块元素时，会把它们共同的外边距折叠在一起，高度为最大的外边距高度。
事实上只要两个垂直外边距碰到一起，它们就会折叠，但是如果外面的元素有一个边框，那么两个元素的外边距就不会碰到一起，就不会折叠

### `float`
- float属性首先尽可能远地向左或向右浮动一个元素，然后在它下面的所有内容会绕流这个元素。
- 对于所有浮动元素都有一个要求：它必须有一个宽度。
- 浮动元素的外边距不会折叠,因为它只是浮在页面上，注意到这一点可以避免常见css错误.
- 内联元素也可以浮动，如浮动图像
- float属性可以设置为left或right,不能是中间
```
  #amazing {
    width: 200px;
    float: right;
  }
```
- 下面看浏览器如何处理float（想象一下word的图片浮动):
(1)首先，浏览器像往常一样，正常将元素流入页面，从最上面开始。
(2)浏览器遇到浮动元素时，会把它尽可能放在最右边，还会从流中删除这个段落，好像它浮在页面上一样。
(3)由于该浮动段落已经从正常的流中删除，所以其他块元素会填在这里，就好像没有这个段落一样。
(4)对于内联元素定位时，它们会考虑浮动元素的边界，因此会绕着浮动元素。


### `clear`
- 当元素流入页面时，在这个元素左边，右边或两边不允许有浮动内容,例如为防止页脚和右边栏重叠，可以用clear设置:
```
#footer {
  background-color: #675c47;
  color:            #efe5d0;
  text-align:       center;
  padding:          15px;
  margin:           10px;
  font-size:        90%;
  clear:            right;
}
```
- 现在浏览器放置元素时会查看右边有没有浮动元素，如果有就下移，直到没有浮动元素为止。

### 两栏效果
- 把sidebar放在页眉下面，然后用float将sidebar栏向右浮动,通过将main div的右外边距设置得和sidebar的宽度相同，来创建两栏效果,不过此时如果页面太宽，页脚会上移造成重叠问题,
这个问题可以在页脚肿添加clear属性解决。还有一个问题是因为我们把sidebar放在主要内容前，所以在小的移动设备上会看到边栏在最前面。
- 右紧左松，让主内容向左浮动，设置仿照上面的。这样div的顺序是正确的，不过边栏过于扩展不好，还是固定些好
- 使用绝对定位，类似浮动效果，当主内容区的垂直空间缩小，边栏会向下覆盖页脚
- 使用css表格

### 流体与冻结设计
- 上面讨论的都是流体布局(liquid layouts)，下面讨论冻结布局(frozen layouts),冻结布局会锁定元素，
如将body中的所有内容都放到一个id为#allcontent的div中
```
#allcontent {
  width: 800px;
  padding-top: 5px;
  padding-bottom: 5px;
  background-color: #675c47;
}
```
那么页面的宽度将被限制为800px，无论浏览器宽度如何变化都不会移动,但这会导致浏览器很宽时，右边有很多空白空间

### 凝胶布局 `Jello`
- 凝胶布局会锁定页面中内容区的宽度，不过会将它在浏览器中居中，将内容区的内外边距设为auto即可，浏览器会确定正确的外边距是多少，确保左和右外边距相同，所以内容会居中,如下所示
```
#allcontent {
  width: 800px;
  padding-top: 5px;
  padding-bottom: 5px;
  background-color: #675c47;
  margin-left: auto;
  margin-right: auto;
}
```

## 绝对定位
- 例如上面的边栏，将边栏绝对定位时，它会从流中删除并根据制定的top，left，right或bottom属性定位
- 由于边栏在流之外，其他元素甚至不知道有这样一个元素，它们会将它完全忽略,所以流中的内联内容不会围绕在一个绝对定位的元素周围。
- 如将侧边栏绝对定位
```
  #sidebar {
    position: absolute;
    top:  100px;
    right:  200px;
    width:  280px;
  }
```
- 关于绝对定位还有一个分层放置的问题，一个元素可以放在另一个绝对定位元素上面，那如何分层？谁在上面？每个定位元素都有一个z-index的属性，这会指定它在一个虚拟z轴上的位置（上面的元素“更靠近”你，z-index更大).
- 可以对任何元素指定绝对位置
- position的默认值为static，将元素放在正常的文档流中。position共有4个值:static,absolute,fixed和relative。fixed将元素放在相对于浏览器窗口（区别页面）的一个位置上，固定元素永远不会移动。relative让元素正常流入页面，不过在页面上显示之前要进行偏移。
- 绝对元素不必像浮动元素一样指定宽度，不过默认会占浏览器的整个宽度，所以如果要改变这种行为就要设置width属性
- 指定元素位置还可以用百分数,相对于浏览器宽度.

## css表格
- 类似电子表格，在表格中只放置块元素，所以要把图像包围在一个div中。
- 为整个表格创建一个div，然后为每一行分别创建一个div，对于每一列，只要在行div中放置一个块级元素。  
- 例如一行两列的表格可以按如下方式创建：
```
<div id="tableContainer">
  <div id="tableRow">
    <div id="main">
      ...
    </div>
    <div id="sidebar">
      ...
    </div>
  </div>
</div>
```
- 对应的css为:
```
#tableContainer {
  display: table;
  border-spacing: 10px;//于是不再需要div中的外边距
}

#tableRow {
  display: table-row;
}
#main {
  display: table-cell;
  background:       #efe5d0 url(images/background.gif) top left;
  font-size:        105%;
  padding:          15px;
  /*margin:           0px 10px 10px 10px;*/
  vertical-align: top;//确保表格两个单元格中的所有内容相对于单元格上边对齐，默认为中间对齐,可以设置为top,middle,bottom
}

#sidebar {
  display: table-cell;
  background:       #efe5d0 url(images/background.gif) bottom right;
  font-size:        105%;
  padding:          15px;
  /*margin:           0px 10px 10px 10px;*/
  vertical-align: top;

}
```
- 上面的border-spacing会在单元格之间增加10像素空间，另外在边界周围也会增加10像素空间，但是border-spacing和外边距创建的空间不会折叠！就会导致页眉和页脚与两列之间有20像素的空间，如何修正？将页眉（页脚）的下边距（上边距）设为0即可。
