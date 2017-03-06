title: "Head First HTML 与 CSS》读书笔记之HTML篇"
date: 2015-08-19 16:41:29
categories: web 
tags: [html]
---

> 本文为阅读《Head First HTML 与 CSS》的html部分的读书笔记，方便回顾书上的知识，另一篇为[Head First HTML 与 CSS》读书笔记之CSS篇](http://mclspace.com/2015/08/20/css-note/)

<!--more -->

---

## 常识

### 简称
- html是`hyperText markup language`的缩写,译为`超文本标记语言`
- css是`Cascading Style Sheets`的缩写，译为`层叠样式表`

### 元素类型
- 块(block)元素,前后都有一个换行, 如`<h1> ~ <h6>, <p> , <blockquote>`,特点是: 特立独行
- 内联(inline)元素,总在“行内”出现, 如`<q>, <a>, <em>`,特点是: 随波逐流
- void元素,这个元素没有实际内容，会用简写来表示，如`<img>, <br>`,这样能提高效率

### 浏览器与服务器惯例
- 浏览器不会显示空白符和换行,制表符等
- web服务器默认文件名为"index.html"或"default.htm",所以如果浏览器请求目录，服务器会在该目录下寻找"index.html"或"default.htm"，如果找到则返回。如果末尾没有正斜杠，如果该目录确实存在，那么浏览器会自动帮你加上末尾的斜线
- 文件URL有3个斜线而不是2个，http url中删去网站名也会有3个斜线
- web服务器默认端口为80
- web页面用来阅读，web应用则用来交互,完成具体的工作.

### 规范
- 遵照标准编写html，尽量减少错误，用`doctype`告诉浏览器你使用的那一版本的html，可以减少浏览器显示效果的差异.现在html5的doctype很简单，告诉浏览器你在使用标准html：
```
  <!DOCTYPE html>
  #也可以写成doctype,两个都可以
  #每个html页面都应该加
```
- 页面中增加`<meta>`标记指定字符编码,通常使用`utf-8`,它是Unicode系列中的一个编码。如下:
```
  <meta charset="utf-8">
  #这个标记要放到<head>元素中所有其他元素的上面
```
- [html标准验证工具](http://validator.w3.org)
- 以后html不再有版本号，甚至不是html5,从现在起它只是"HTML".标准改变，浏览器会继续支持老方式，同时也会支持新的方式，这叫做向后兼容性.

---

## 实践

### 一般
- 标记在不同浏览器中的效果不太一样，需要对不同浏览器进行适配
- 规划页面时先设计大的块元素,然后用内联元素完善
- 尽可能使用元素告诉浏览器内容的含义
- id属性是唯一标识元素的方法，可以使用大小写，不过必须一致, (每次都用小写会更容易些), id在它的页面必须唯一。
- 任何元素都可以增加title属性，为其增加工具提示.任何元素都可以有id属性进行标示

### 链接
- 内部网页使用相对地址，外部网页使用绝对地址
- 带id的元素有一个特殊特性：你可以直接链接这些元素.如`<a href="index.html#chai">see chai tea</a>`,方法为在链接后加#,再加上目标标识符。
- 通常在页面的最上面定义一个目标"top"，并在页面最下面定义一个目标"Back to top",要链接到同一页面的top目标，可以写为`<a href="#top">Back to top</a>`
- 链接要简洁，可以在title中提供额外的信息，不要使用诸如"单击这里",或"这一页"之类的链接标签,不要把链接放在一起
- 一般用`http://wickedlysmart.com/buzz/index.html#Coffee`进行链接，不能使用`http://wickedlysmart.com/buzz#Coffee`的形式进行元素链接,因为浏览器会在末尾加斜杠，可能取代id引用，不过可以用`http://wickedlysmart.com/buzz/#Coffee`

### 嵌套
- 适当嵌套元素,要完全嵌套
- 嵌套元素要当心，不要把`<a>`元素嵌到另一个`<a>`元素中，会让访问者迷惑。不允许在`<img>`等void元素中嵌套其他内联元素。

### 工具
- Dreamweaver
- [Hype(Tumult)](http://tumult.com/hype/)
- [Coda(Panic)](https://www.panic.com/coda/)
- [Flux(The Escapers)](http://www.theescapers.com/flux/)
...

---

## HTML首部元素
### `html` 根元素
web页面的根元素,只有`<head>`和`<body>`能直接放在`<html>`标签中

### `head` 页面头部
- head包含有关页面的信息,只能放置`<title>`,`<meta>`和`<style>`元素。
- `<meta>` : 关于页面的信息,属性包括 > charset : 指定字符集,通常为utf-8
- `<title>` : 页面标题
- `<style>` : 页面样式,属性包括 > type: 样式类型, 一般为"text/css",如`<style type="text/css">...</style>`

---

##  HTML页面主体
### `body` 主体元素
web页面的主体元素

### `h1`- `h6` 6级标题
标题默认是粗体,例如: `<h1>一级标题</h1>`

### `p` 段落
块元素,paragraph的缩写,例如: `<p>...</p>`

### `a` 超链接
- 内联元素,at的缩写,如 `<a href=""></a>`
- `<a>`元素的内容可以是文字，图像甚至块元素(html5)
- `href`: hyper reference的缩写,指定链接地址
- `title`: 所要链接页面的文本描述
- `target`: 告诉浏览器使用一个不同的窗口，使用_blank作为目标，就会打开一个新的窗口显示页面.如果多个a元素都制定`_blank`作为target,那么每个链接都会在一个新的空窗口中打开，如果指定另一个名字，如Coffee，那么有相同目标名的所有链接都会在同一个窗口中打开。

### `em` 强调
内联元素，emphasize的缩写,例如: `<em>强调</em>`

### `br` 换行
void元素,break的缩写,例如`<br>`

### `code` 显示计算机程序代码
块元素,例如: `<code>...</code>`

### `pre` 原样显示文本
块元素,例如: `<pre></pre>`

### `strong` 加粗文本
内联元素 例子: `<strong>加粗</strong>`

---

## 引用

### `q` 短引用
作为现有段落的一部分,大部分浏览器会加引号，内联元素,quotation的缩写

### `blockquote` 长引用
- 需要单独显示，`<blockquote>`创建了单独的一个文本块，另外把文字稍稍缩进，使它更像一个引用。它是个块元素。
- 如果想引用一段或者多段文字，就要使用`<blockquote>`,不过如果只想把一个引用放在现有的文字里，作为其中一个部分，就可以
使用`<q>`。
- 可以把`<p>`放到`<blockquote>`中，形成多个段落
- 可以把`<q>`放到`<blockquote>`中，表示引用的引用

---

## 列表
`<ol>`和`<li>`(或者`<ul>`和`<li>`)总是要一起使用,列表可以嵌套,例如:
```
<ul>
  <li class="selected"><a href="index.html">HOME</a></li>
  <li><a href="blog.html">BLOG</a></li>
  <li><a href="">INVENTIONS</a></li>
  <li><a href="">RECIPES</a></li>
  <li><a href="">LOCATIONS</a></li>
</ul>
```

### `li` 列表项
块元素,list item的缩写

### `ol` 有序列表
块元素, ordered list的缩写,浏览器负责编号

### `ul` 无序列表
块元素, unordered list的缩写

### `dl`,`dt`,`dd` 定义列表
每一项都由一个定义术语和定义描述组成
```
  <dl>
    <dt>Burma Shave Sign...</dt>
      <dd>Road signs common in the US</dd>
    <dt>Route 66</dt>
      <dd>Most famous road in the U.S. highway system</dd>
  </dl>
```

---

## 字符实体
- 用简单缩写来指定特殊字符,但并不保证在所有浏览器上都能显示
- 输入实体时都会用到&amp;,如果内容中确实需要一个&amp;,就要使用&amp;
- 除了用实体名还可以用实体编号比如`&#100;`,并不是所有实体都有名字
- &gt; `&gt;` 大于符号
- &lt; `&lt;` 小于符号
- &amp; `&amp;` 与符号
- &copy; `&copy;` 版权符号
- [详尽的字符实体清单](http://www.unicode.org/charts/)

---

## 图像

### `img` 图片
- void元素,image的缩写
- `src`: 必要属性,指定img的源文件位置，可以指定相对位置
- `alt`: 必要属性,指定描述这个图像的一些文本,可以在图像无法显示的时候显示文本，也可以帮视力障碍的用户，这个属性得加，不然无法通过html标准验证
- `width`: 指定图像宽度
- `height`: 指定图像高度
- 例子:  `<img src="" alt="" width="800" height="600">`

### 图片格式
- web上最常用的3种格式: JPEG, PNG 和 GIF.
- 照片和复杂图像使用JPEG,支持1600万种不同颜色，有损格式，缩小文件时会丢掉图像信息，不支持透明度，不支持动画，文件较小，便于web高效显示
- PNG,GIF适合单色图像和线条构成的图像，如logo,剪切画和图像中的小文本,都是无损格式，都支持透明度，都比相应的JPEG更大些。
- PNG可以包含上百万种颜色，有PNG-8,PNG-24和PNG-32.
- GIF最多表示256种不同颜色，但是能支持动画.

### 实践
- 指定宽度和长度的原因是浏览器预先知道了长宽就可以在显示图像之前就开始建立页面布局，否则浏览器得先下载图像，知道大小，然后再重新调整布局。
- width和height也可以用来图片缩放，不过处于各种原因，还是不要这样达到目的的好。因为浏览器在调整图像之前还是必须得下载完整的大图像
- 图像宽度要小于800像素，是一个好经验。
- 图像可以作为指向其他web页面的链接，将img放在a元素的内容中，如下所示:
```
    <a href="html/seattle_classic.html">
       <img src="thumbnails/seattle_classic.jpg" alt="A classic iPod in Seattle, WA">
    </a>
```

---

## 容器
### 标记逻辑区
逻辑区就是页面上彼此相关的一组元素,`div`和`span`容器用来标记一组元素

### `div` 块元素容器
- 在属于一个逻辑区的元素周围放置`<div>`开始和结束标记
- div中的元素也会从div继承一些属性(如`font-size`,`color`等)
- 可以用div为页面增加更多结构，进一步展示页面的底层逻辑结构，但不要为了加结构而不必要地增加结构，在完成任务的前提下让结构尽可能简单
- 你也可以嵌套结构，例如可以把cats,dogs的`<div>`放在一个pets `<div>`中,如:
```
<div class="pets">
  <div class="cats">...</div>
  <div class="dogs">...</div>
</div>

```

### `span` 内联元素容器
类似于div，不过是针对内联元素的，建立内联内容的逻辑分组,如:
```
  <ul>
    <li><span class="cd">Buddha Bar</span>, <span class="artist">Claude Challe</span></li>
    <li><span class="cd">When It Falls</span>, <span class="artist">Zero 7</span></li>
    <li><span class="cd">Earth 7</span>, <span class="artist">L.T.J. Bukem</span></li>
    <li><span class="cd">Le Roi Est Mort</span>, <span class="artist">Vive Le Roi!, Enigma</span></li>
    <li><span class="cd">Music for Airports</span>, <span class="artist">Brian Eno</span></li>
  </ul>
```

---

## 表格

### `table` 表格
用`<table>`标记开始一个表格，一行用`<tr>`开始,每个`<th>`分别是某一列的表头,表头是前后排列的。每个`<td>`元素包含表格中的一个单元格。例子:
```
<table>
  <tr>
    <th>City</th>
    <th>Date</th>
    <th>Temperature</th>
    <th>Altitude</th>
    <th>Population</th>
    <th>Diner Rating</th>
  </tr>
  <tr>
    <td>Walla Walla, WA</td>
    <td>June 15th</td>
    <td>75</td>
    <td>1,204 ft</td>
    <td>29,686</td>
    <td>4/5</td>
  </tr>
  <tr>
    <td>Magic City, ID</td>
    <td>June 25th</td>
    <td>74</td>
    <td>5,312 ft</td>
    <td>50</td>
    <td>3/5</td>
  </tr>
</table>
//添加css
table {
	margin-left: 20px;
	margin-right: 20px;
	border: thin solid black;
	caption-side: bottom;//将标题放在底部
}

td, th {
	border: thin dotted gray;
	padding: 5px;
}

caption {
	font-style: italic;
	padding-top: 8px;
}

```

### `caption` 标题
增加标题`<caption>...</caption>`, 放在`<table>`元素之下,`<tr>`元素之上（即使你后面要用css把它显示在下方）,默认会显示在表格上方。

### `background-color` 背景色
添加颜色, 设置背景色即可，如:
```
  th {
    background-color: #cc6600;
  }
```

### 颜色交替
为各行指定交替的颜色, 能够更容易得区分各行, 可以先定义一个新类, `cellcolor`, 然后把这个类增加到你希望着色的各行(tr)上，如:
```
  .cellcolor {
    background-color: #fcba7a;
  }
```
另外还可以用下面的`nth-child`实现

### `nth-child` 伪类
`nth-child`伪类是一种更高级地选择元素的方法，例如让偶数段落有红色背景，奇数段落有绿色背景:
```
  p:nth-child(even){
    background-color: red;
  }
  p:nth-child(odd){
    background-color: green;
  }
```
这个伪类还可以更加灵活，用数字n制定简单表达式，如奇偶数：
```
  p:nth-child(2n){
    background-color: red;
  }
  p:nth-child(2n+1){
    background-color: green;
  }
```

### 合并单元格
就是说有的单元格要跨越多行，可以使用`rowspan`属性，指定一个数据单元格占多少行，然后从这个单元格所跨越的其他行中删除相应的表格元素。表格元素还能跨多列，只要为td元素增加colspan属性，然后指定列数，跨多列时需要删除同一行中的表格数据元素，例如：
```
<tr>
  <td rowspan="2">Truth or Consequences, NM</td>
  <td class="center">August 9th</td>
  <td class="center">93</td>
  <td rowspan="2" class="right">4,242 ft</td>
  <td rowspan="2" class="right">7,289</td>
  <td class="center">5/5</td>
</tr>
<tr>

  <td class="center">August 27th</td>
  <td class="center">98</td>


  <td class="center">4/5</td>
</tr>
```

### 嵌套表格
表格里可以嵌套表格,只需要把另一个table元素放在一个td中，例如：
```
<tr>
  <td class="center">August 27th</td>
  <td class="center">98</td>
  <td class="center">
    <table>
      <tr>
        <th>Tess</th>
        <td>5/5</td>
      </tr>
      <tr>
        <th>Tony</th>
        <td>4/5</td>
      </tr>
    </table>
  </td>
</tr>
```



### 处理表格双线
默认情况下每个单元格都有边框，会形成双线，分散注意力，可以在table中将border-spacing设置为0px,还可以用border-collapse的css属性来折叠边框，使单元格之间根本没有边框间距，这样浏览器会忽略所有边框间距，然后将紧挨的两个边框合并成一个边框(good),例如：
```
table {
  margin-left: 20px;
  margin-right: 20px;
  border: thin solid black;
  caption-side: bottom;
  border-collapse: collapse;
}
```

### 其他实践
- 如果没有足够的元素，要写成`<td></td>`.如果省去这个数据单元格，表格就不能正确地排列对齐
- 如果希望表头放在表格的左侧，可以把表格表头元素放在各行中，而不是都放在第一行中。
- html表格允许你用html标记指定表格的结构，而css表格则提供一种方法，可以用一种类似表格的方式显示块级元素。需要在页面中创建表格数据时就用html表格，不过如果只需要对其他类型的内容使用一种类似表格的表现方式，就可以用css表格显示布局。
- 表格单元格确实有内边距和边框，不过单元格之间的空间叫做border-spacing是针对整个表格定义的，表格单元格没有外边距，不过可以在垂直方向和水平方向上设置不同的边框间距`border-spacing: 10px 30px`,10像素水平间距，30像素垂直边框间距

---

## 表单

### 表单`form`
action属性包含web服务器的url, method属性确定表单数据如何发送到服务器，如POST,另外input 是内联元素, 如果想要有换行用<br>, 例子如下:
```
<form action="http://wickedlysmart.com/hfhtmlcss/contest.php" method="POST">
  <p>Just type in your name (and click Submit) to enter the contest:<br>

    First name: <input type="text" name="firstname" value=""><br>
    Last name:  <input type="text" name="lastname" value=""><br>
    <input type="submit">
  </p>
</form>
```

### `POST`和`GET`请求
浏览器发送数据的方法主要有两种，POST和GET。POST和GET完成的任务是一样的，都是把表单数据从浏览器发送到服务器，不过采用了两种不同的方式，POST会打包你的表单变量，在后台把它们发送到服务器，GET也会打包你的表单变量，但是会把这些数据追加到URL的最后，然后向服务器发送一个请求.

那么什么时候使用post什么时候使用get呢？如果你希望用户能够对提交表单后的结果页面加书签，就必须使用GET,因为如果使用POST就无法加书签了。那什么时候需要加书签呢？假设服务器返回一个搜索列表，你可能希望用户对结果加书签，那么他们就能直接查看这些结果，而不用再填写表单。另外，如果你有一个处理订单的服务器脚本，可能不希望给这个页面加标签，因为否则每次他们返回这个标签时，都会重新提交这个订单。

还有一种情况肯定不想用GET，比如你的表单中的数据是私有的，如信用卡或口令，url是明文看到的，所以不安全。最后，如果你用了textarea就应该用POST,因为可能会发送大量数据，get和post对数据量都有限制，但是post要宽松的多。

### 可访问性
应该用<label>元素来标记那些标签，label元素可以提供页面结构的更多的信息，使你能更容易地使用css对标签设置样式，另外对于有视力障碍的人，也有助于他们使用的屏幕阅读器更准确地标识表单元素要使用表单元素必须为表单元素增加一个id属性，然后增加一个label，设置其for属性为相应的id。例如:
```
<input type="radio" id="whole_beantype" name="beantype" value="whole">
<label for="whole_beantype">Whole bean</label><br>
<input type="radio" id="ground_beantype" name="beantype" value="ground" checked>
<label for="ground_beantype">Ground</label>
```

### `field`和`legend` 分组
当表单变的越来越大时，在视觉上对元素分组会很有帮助，可以用fieldset做到，legend为这一组提供一个标签,例如:
```
<fieldset>
  <legend>Ship to</legend>
  <div class="tableRow">
  ...
</fieldset>
```

### `passwords input` 密码
输入的文本会加掩码,例如：
```
<input type="password" name="secret">
```

### `file input` 文件
创建一个文件输入控件,使用这个元素的前提是必须使用POST方法, 例如:
```
<input type="file" name="doc">
```

### 多选菜单
为select元素增加布尔属性multiple，在屏幕上显示所有项，选择时同时按下ctrl或command键，可以选择多个选项,例如：
```
<select name="characters" multiple>
  <option value="Buckaroo">Buckaroo Banzai</option>
  <option value="Tommy">Perfect Tommy</option>
  <option value="penny">Penny Priddy</option>
  <option value="Jersey">New Jersey</option>
  <option value="John">John Parker</option>
</select>
```

###`placeholder` 提示
为填写表单的人提供提示, 比正常内容浅一些, 例如：
```
<input type="text" placeholder="Buckaroo Banzai">
```

### `Required` 必要
可用于任何表单控件, 指示一个域是必要的, 对于设置了这个属性的控件, 如果没有指定值, 就无法正常提交表单, 例如:
```
<input type="text" placeholder="Buckaroo Banzai" required>
```

### `text input` 文本输入
用type属性指示你希望得到一个"文本"输入, 大多数表单元素都需要一个名字, 服务器脚本将使用这个元素名, 用maxlength限制最大字符数, 例如创建一个单行控件：
```
<input type="text" name="fullname">
```

### `submit input` 提交输入
创建一个按钮, 允许你提交表单, 点击该按钮时, 浏览器将表单发送到服务器进行处理。标签默认为"Submit"(提交), 或者"Submit Query"(提交查询), 用value属性制定提交按钮的名字, 例如：
```
  <input type="submit">
```

### `radio input` 单选按钮
创建包含多个按钮的控件, 一次只能选择一个按钮。给一组给定选项关联的单选按钮必须有相同的名字...每个选项可以有不同的值, 通常将单选按钮的标签放在元素右边,使用checked布尔属性默认选中某个元素,例如：
```
    <input type="radio" name="hotornot" value="hot"> hot
    <input type="radio" name="hotornot" value="not" checked> not
```

### `checkbox input` 复选按钮
创建复选框控件，可以选中也可以不选中,允许选择0个或多个选项。给一组给定选项关联的单选按钮必须有相同的名字name...每个选项有不同的值value,通常将复选按钮的标签放在元素右边,使用checked布尔属性默认选中某个元素,例如：
```
    <input type="checkbox" name="spice" value="salt">
    <input type="checkbox" name="spice" value="Pepper">
    <input type="checkbox" name="spice" value="Garlic" checked>
```

### `textarea` 文本区
- `<textarea>` 元素会创建一个多行的文本区，如果文本在文本区中放不下，右边还会出现一个滚动条，非空元素
- `name` 指定唯一的名字
- `rows` 告诉浏览器文本区高度为多少字符,`cols`属性告诉浏览器文本区宽度为多少字符。
- 例如:
```
  <textarea name="comments" rows="10" cols="48"></textarea>
```

### `select` 菜单
- 创建一个菜单控件，从一组选项中做出选择
- `name` 指定名字
- `option` 元素的内容用作作为菜单项的描述
- 例子:
```
  <select name="characters">
    <option value="Buckaroo">Buckaroo Banzai</option>
    <option value="Tommy">Perfect Tommy</option>
    <option value="penny">Penny Priddy</option>
    <option value="Jersey">New Jersey</option>
    <option value="John">John Parker</option>
  </select>
```

---

## html5表单控件
### `number input` 数字输入
限制只能输入数字，用min,max来限制允许输入的数字, 例子:
```
  <input type="number" min="0" max="20">
```

### `range input` 范围输入
类似number，显示滑动条,step指定步长,例子:
```
<input type="range" min="0" max="20" step="5">
```

### `color input` 颜色输入
单击时弹出颜色选择器,例子:
```
  <input type="color">
```

### `date input` 日期输入
日期选择器,例子:
```
  <input type="date">
```

### `email input` email输入
文本输入元素，在移动浏览器上，开始输入email时会得到一个方便输入email的定制键盘,例子 :
```
<input type="email">
```

### `tel input` tel 输入
与email类似，在移动设备上弹出一个定制键盘, 例子 :
```
<input type="tel">
```

### `url input` url 输入
和email，tel类似, 例子 :
```
<input type="url">
```

## html5新增元素
上面的都是属于html的标准的，html5在这个基础上又添加了一些新的元素，如article,nav,header,footer,time,aside,section,video等,虽然这些新元素用起来和原来的一样，但是使用新元素，浏览器，搜索引擎和开发人员就能肯定该元素是什么，用最合适的元素完成任务。比如aside元素，在屏幕大小受限的移动手机上，浏览器知道这个内容是一个aside，你可能会看到内容被塞到页面最下面，让你首先看到最重要的内容。相反如果使用div就什么情况都可能发生。这些元素本身没有多少样式，不过可以为页面中的内容增加含义信息.

### `footer` 页脚
用`footer`表明这段是页脚，例如:
```
<footer>
  &copy; 2012, Starbuzz Coffee
  <br>
  All trademarks and registered trademarks appearing on
  this site are the property of their respective owners.
</footer>
//相应的css也需要改变，把#footer 改成footer
footer {
  background-color: #675c47;
  color:            #efe5d0;
  text-align:       center;
  padding:          15px;
  margin: 0px 10px 10px 10px;
  font-size:        90%;
}
```

### `section` 节
用`section`将相关内容组织在一起,例如可以把饮料内容都放在一起，主要内容放在一起,例如 :
```
<section id="drinks">
  <h1>BEVERAGES</h1>
    <p>House Blend, $1.49</p>
    <p>Mocha Cafe Latte, $2.35</p>
    <p>Cappuccino, $1.89</p>
    <p>Chai Tea, $1.85</p>
  <h1>ELIXIRS</h1>
    <p>
      We proudly serve elixirs brewed by our friends
      at the Head First Lounge.
    </p>
    <p>Green Tea Cooler, $2.99</p>
    <p>Raspberry Ice Concentration, $2.99</p>
    <p>Blueberry Bliss Elixir, $2.99</p>
    <p>Cranberry Antioxidant Blast, $2.99</p>
    <p>Chai Chiller, $2.99</p>
    <p>Black Brain Brew, $2.99</p>
</section>
```

### `article` 文章
用`article`包含独立的内容，如一个新闻报道，例如:
```
<article>
  <header>
    <h1>Starbuzz uses computer science</h1>
    <time datetime="2012-03-10">3/10/2012</time>
  </header>
  <p>
    Have you ever noticed how efficient a Starbuzz Coffee
    house is? The lines alway move fast, and despite the
    astronomical number of different drinks any customer can
    order, we have your drink up, hot (or cold if that's the
    way you want it) and ready in seconds. How do we do it?
  </p>
</article>
```

### `time` 日期
time元素有个重要的属性:datetime,datetime要用官方internet日期格式来写，如果内容没有按官方日期写，就必须有datetime属性。官方日期完整格式为yyyy-MM-dd hh:mm，可以指定一部分.例如：
```
  <time datetime="2012-02-18">2/18/2012</time>
```

### `header` 元素
可以为article,section,aside增加header元素，可以增加一些内容，比如署名，footer元素也可以,通常，section和article都会有一个header,用来提供描述或介绍,即使只有一个标题也可以使用header,提供额外的语义含义，将文章的首部与其余的内容区分开。例如:
```
<section id="blog">
<article>
<header>
  <h1>Starbuzz meets social media</h1>
  <time datetime="2012-03-12">3/12/2012</time>
</header>
...
```

### `nav` 导航
导航nav,创建一组链接，包围在一个无序列表中，使用一个类来标识被选中的一项,nav可以插入到页眉的下面
```
<nav>
  <ul>
    <li><a href="index.html">HOME</a></li>
    <li class="selected"><a href="blog.html">BLOG</a></li>
    <li><a href="">INVENTIONS</a></li>
    <li><a href="">RECIPES</a></li>
    <li><a href="">LOCATIONS</a></li>
  </ul>
</nav>
//对应要为他们设置css样式，不然不符合期望
nav {
    background-color: #efe5d0;
	   margin: 10px 10px 0px 10px;
}
nav ul {
	margin: 0px;
	list-style-type: none;
	padding: 5px 0px 5px 0px;
}
nav ul li {
	display: inline;
	padding: 5px 10px 5px 10px;
}
nav ul li a:link, nav ul li a:visited {
	color: #954b4b;
	border-bottom: none;
	font-weight: bold;
}
nav ul li.selected {
	background-color: #c8b99c;
}

```

### 其他html5元素
- `mark`：突出显示某些文本
- `audio`: 声音内容
- `progress`: 显示任务完成进度
- `meter`: 显示某个范围的度量
- `figure`: 定义类似照片，图表，甚至代码清单等独立的内容

---

## 视频
### `video`
`<video>`可以用来播放视频，一般的格式如下:
```
    	<video controls autoplay width="512" height="288" src="video/tweetsip.mp4">
      </video>
```
- `autoplay`,指定自动播放
- `controls`,提供一组控件来控制播放，暂停，调节音量等
- `autoplay`和`controls`是"布尔属性",有就显示，没有就不会出现。注意autoplay属性，通常用户希望决定加载页面时是否播放视频，另外controls属性对于不同浏览器提供的控件有所不同
- `poster`属性可以在视频未播放时显示这个图像`poster="images/poster.png"`,通常浏览器会显示视频第一帧，往往是黑屏
- `preload`用来细粒度地控制视频如何加载，实现优化。大多数情况下，浏览器根据autoplay和用户带宽决定加载多少视频，可以覆盖这种设置。preload取值:
 - `none`,则用户播放视频之前不加载视频
 - `metadata`，下载视频元数据
 - `auto`,让浏览器做决定
- `loop` 属性，布尔属性，决定视频结束后哦是否自动重新开始播放视频.
- `width`,`height`设置视频显示区，海报会缩放到指定宽度和高度，视频会保持宽高比，有多余则显示黑边.

### 视频格式
一个视频文件包括两个部分，一个视频部分和一个音频部分，每个部分使用特定编码类型来编码，容器也有自己的格式和格式名,现在主要有3种格式的视频：`mp4(H.264,aac)` ,`webm(vp8,vorbis)` ,`ogg(theora,vorbis)` ,那么如何处理所有这些格式呢？在video元素中可以对应每种格式分别使用一个`<source>`元素，浏览器从上往下找，直到找到它能播放的一种格式。
```
<video controls autoplay width="512" height="288">
  <source src="video/tweetsip.mp4">
  <source src="video/tweetsip.webm">
  <source src="video/tweetsip.ogv">
  <p>Sorry, your browser doesn't support the video element.</p>//如果浏览器不支持视频，显示此文本
</video>
```

### 视频选择
`source`中可以具体的指定视频格式，为浏览器提供帮助，因为浏览器在决定是否能够播放一个文件之前还要做一些侦查工作，type指定视频文件的容器格式，视频编码器和音频编码器,如果不知道`codecs`参数可以省略,例如：
```
  <source src="video/tweetsip.ogv" type='video/ogg; codecs="theora, vorbis"`>
```
如果你喜欢flash可以把flash放到`<object>...</object>`控件中，并放到source标记下面，如果浏览器不认识video元素，就会使用flash视频。
