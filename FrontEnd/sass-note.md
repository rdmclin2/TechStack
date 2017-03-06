title: "sass note"
tags:
---

> 本文多数内容来自 <http://riny.net/2014/sass-guide/>

# 基本命令
## 安装
```
$ gem install sass
```

## 查看版本
```
$ sass -v
```

## 编译单个文件
```
sass test.scss test.css
```

## 设置输出css文件的风格
```
sass --style compressed test.scss test.css
```
输出样式的风格可以有四种选择，默认为nested

- nested：嵌套缩进的css代码
- expanded：展开的多行css代码
- compact：简洁格式的css代码
- compressed：压缩后的css代码

## 监控单个文件变化
```
sass --watch test.scss:test.css
```

## 监控文件夹变化
```
sass --watch src:dest
```

# 语法
## 普通变量
```
$base-gap: 10px;
$base-color: #333;

.test {
    margin-top: $base-gap;
    color: $base-color;
}
```
如果在字符串中引用变量，则需要将变量名写在`#{}`中
```
$img-dir: "public/images/";

.test {
    background-image: url(#{$img-dir}icon.png);
}
```

## 默认变量
默认变量用来提供sass的默认值。它的含义是：如果这个变量被声明赋值了，那就用它声明的值，否则就用默认值。这在书写sass库文件时非常有用。设置默认变量的方法也非常简单，只需在变量值后加上!default即可。
```
$color: #ccc;
$color: #000 !default;
p {
    color: $color;
}
```

## 多值变量
多值变量类似js中的数组，声明时只需用空格将多个值隔开即可。如：
```
$colors: #fff #ccc #999 #666 #333;
```
我们可以通过length($colors)来获取多值变量的值的个数，通过nth($colors, index)来获取第index个位置的值。ps: index的取值范围为1到length($colors)。
```
$colors: #fff #ccc #999 #666 #333;
p::after {
  content: "#{length($colors)}";    // 5
  color: nth($colors, 1);            // #fff
}
```

## 嵌套
```
.list {
    margin-top: 10;
}
.list li {
    padding-left: 15px;
}
.list a {
    color: #333;
}
.list a:hover {
    text-decoration: none;
}
```

用嵌套改写:
```
.list {
    margin-top: 10px;
    li {
        padding-left: 15px;
    }
    a {
        color: #333;
        &:hover {
            text-decoration: none;
        }
    }
}
```
嵌套代码中的&表示父元素选择器。嵌套虽然很方便，但不建议嵌套层次太深，以免生成的css选择器过长。除了选择器可以嵌套外，css属性也可以嵌套(用的相对较少)，如：
```
.test {
    border: {
        width: 2px;
        style: solid;
        color: #000;
    }
}
```

## 导入.sass或.scss文件
在使用@import导入sass文件时，可以省略sass文件的后缀名.sass或.scss，例如：
```
- a.scss
    body {
        background-color: #f00;
    }
- style.scss
    @import "a";
    div {
        color: #333;
    }
```
编译整个sass目录的话，会发现一个问题，在生成style.css的同时也生成了一个a.css
在文件名前加上下划线_，sass编译的时候就会忽略这个文件

## 导入css文件
当然，如果你需要像原生css那样去导入其他的css文件，也是可以的，如果符合以下三条中的任意一种情况，sass就会认为你想用css原生的@import:

被导入的文件名以.css结尾
被导入的文件是一个在线的url地址
以@import url(...)方式去导入文件

## 注释
sass会在生成的css文件中删除单行注释，只保留css原生的注释内容
```
.test {
    margin: 10px;    // 这块注释不会出现在生成的css文件中
    color: #333;     /* 这块注释会出现在生成的css文件中 */
}
```


## 简单混合器

sass中的混合器一般用来解决大段代码重复的问题。比如我们经常使用的单行文本溢出显示省略号，可以使用@mixin来定义一个简单的混合器：
```
@mixin ellipsis {
    width: 100%;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
```
然后在需要用到的地方我们可以通过@include来使用这个混合器：
```
.text {
    @include ellipsis;
}
```
输出的css为：
```
.text {
    width: 100%;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
```

## 带参数的混合器

混合器不仅可以实现代码的重复利用，还可以传递参数，根据需要生成不同的css。这在跨浏览器的css3兼容方面尤为好用。例如：
```
@mixin radius($value) {
    -moz-border-radius: $value;
    -webkit-border-radius: $value;
    border-radius: $value;
}
```
使用时，我们只需传入相应的参数值即可。
```
.test {
    @include radius(3px);
}
```
生成的css为：
```
.test {
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
}
```
另外我们还可以给参数提供默认值，如：
```
@mixin link-colors($normal: #333, $hover: $normal, $visited: $normal) {
    color: $normal;
    &:hover {
        color: $hover;
    }
    &:visited {
        color: $visited;
    }
}
```
调用时，可以传参，也可以不传：

```
.text {
    @include link-colors;
}
.error {
    @include link-colors(red);
}
a {
    @include link-colors(blue, green, yellow);
}
```

生成的css为：
```
// 鉴于篇幅问题，已将生成的代码改成单行
.text { color: #333;}
.text:hover { color: #333;}
.text:visited { color: #333;}

.error { color: red;}
.error:hover { color: red;}
.error:visited { color: red;}

a { color: blue;}
a:hover { color: green;}
a:visited {color: yellow;}
```

## 继承extend

使用sass时，继承是一个很不错的减少css重复代码的功能。继承可以让一个选择器继承另一个选择器的所有样式，并联合声明。可以使用@extend语法来实现继承。

.text {
    color: #333;
    font-size: 14px;
    margin: 10px 0;
}
.error {
    @extend .text;
    color: #f00;
}
上面代码中，.error继承了.text中的所有样式，并且.error和.text中的公共样式会进行联合声明。生成的css为：

.text, .error {
    color: #333;
    font-size: 14px;
    margin: 10px 0;
}

.error {
    color: #f00;
}
这种继承虽然方便，但是也有一定的弊端。比如我们仅仅想继承.text类中的样式，而实际并不需要.text的这个类。换句话说就是我们的html中并没有class="text"这样的代码，这样的话生成的css中的.text其实就是多余的。

## 占位选择器%

占位选择器的优势在于：声明之后，如果不调用，则不会产生类似.text的多余css代码。占位选择器通过%标识来定义，也是通过@extend来调用。
```
%text {
    color: #333;
    font-size: 14px;
    margin: 10px 0;
}
.warn {
    @extend %text;
    color: #fdd;
}
.error {
    @extend %text;
    color: #f00;
}
```
生成的css为：
```
.warn, .error {
    color: #333;
    font-size: 14px;
    margin: 10px 0;
}
.warn {
    color: #fdd;
}
.error {
    color: #f00;
}
```
这样就不会再额外生成多余的样式了。

## `@if`添加判断

sass中的@if语句和js中的if很相似。可以单独使用，也可以配合@else使用。
```
$lte7: true;    // 是否支持ie7以下版本
$theme: yellow;
.clearfix {
    @if $lte7 {
        zoom: 1;
    }
    &:after {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }
}

body {
    @if $theme == red {
        background: rgba(255, 0, 0, 0.5);
    } @else if $theme == yellow {
        background: rgba(255, 255, 0, 0.5);
    } @else if $theme == black {
        background: rgba(0, 0, 0, 0.5);
    }
}
```
生成css为：
```
.clearfix {
    zoom: 1;
}
.clearfix:after {
    content: ".";
    display: block;
    height: 0;
    clear: both;
    visibility: hidden;
}
body {
    background: rgba(255, 255, 0, 0.5);
}
```

## 三目运算判断

三目运算符的语法为：`@if($condition, $condition_true, $condition_false)`，例如：
```
$fontBold: true;
.title {
    font-weight: if($fontBold, bold, normal);
}
生成的css为

.title {
    font-weight: bold;
}
```

## sass相关工具推荐

[sass在线编译](http://sassmeister.com)
[sass可视化编译工具: Koala]()
