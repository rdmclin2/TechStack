title: "js note"
tags: [js]
---

##前言
最近接触到很多js相关的技术，是时候好好补一补基础了。

##坑
- 如何遍历一个json对象并改变其值?，不能直接用for in遍历,如下
```
for(var i=0,l=list.length;i<l;i++){
  var post = list[i];
  post.likesCount = post.likes.length;
  post.likes = undefined;
}
```

- array.concat 不会改变现有的数组的，而是会返回一个新的数组
```
var arr = ['A', 'B', 'C'];
var added = arr.concat([1, 2, 3]);
added; // ['A', 'B', 'C', 1, 2, 3]
arr; // ['A', 'B', 'C']
```


##JavaScript语言精粹结合[廖雪峰的js教程](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000)
- js中的字符串除了以字母开头还可以以_和$开头。
- `/* */`可能导致语法错误，例如出现在正则表达式里，所以作者（下面称老道)建议避免使用，用//
- js只有一个数字类型，内部是64位浮点数,没有整数类型，所以1和1.0值相同
- NaN表示Not a Number，当无法计算结果时用NaN表示,NaN这个特殊的Number与所有其他值都不相等，包括它自己,唯一能判断NaN的方法是通过isNaN()函数：isNaN(NaN); // true
- Infinity表示无限大，当数值超过了JavaScript的Number所能表示的最大值时，就表示为Infinity
- js没有字符类型，所有字符都是16位的unicode，要表示一个字符只需创建包含一个字符的字符串即可。
- 字符串有length属性,通过+连接其他字符串来创建新字符串.字符串可以用''或""括
- 转义字符\\,\\u用来指定数字字符编码 "A" === "\\u0041",\\x表示16进制，如'\x41'完全等同于'A'
- 十六进制用0x前缀和0-9，a-f表示，例如：0xff00，0xa5b4c3d2
- js中的代码块不会创建新的作用域，因此变量应该被定义在函数的头部，而不是在代码块中。
- if语句的假: false,null,undefined,空字符串' ',0,NaN
- 所有其他值为真,包括"false"
- for语句的一种表示形式 for in : for(myvar in obj)
- 如果没有指定返回表达式，那么返回值是undefined.return和表达式之间不能换行。
- js不允许break和标签之间换行，标签是什么？
- =赋值，===恒等,+=加法或连接字符串
- 要特别注意相等运算符==。JavaScript在设计时，有两种比较运算符：第一种是==比较，它会自动转换数据类型再比较，很多时候，会得到非常诡异的结果；第二种是===比较，它不会自动转换数据类型，如果数据类型不一致，返回false，如果一致，再比较。由于JavaScript这个设计缺陷，不要使用==比较，始终坚持使用===比较。
- javaScript的设计者希望用null表示一个空的值，而undefined表示值未定义。事实证明，这并没有什么卵用，区分两者的意义不大。大多数情况下，我们都应该用null。undefined仅仅在判断函数参数是否传递的情况下有用
- JavaScript的数组可以包括任意数据类型,如 [1, 2, 3.14, 'Hello', null, true];或通过Array(),然而，出于代码的可读性考虑，强烈建议直接使用[]。
- JavaScript的对象是一组由键-值组成的无序集合，例如：
```
var person = {
    name: 'Bob',
    age: 20,
    tags: ['js', 'web', 'mobile'],
    city: 'Beijing',
    zipcode: null
};
```
- 可以把任意数据类型赋值给变量，同一个变量可以反复赋值，而且可以是不同类型的变量，但是要注意只能用var申明一次，例如：
```
var a = 123; // a的值是整数123
a = 'ABC'; // a变为字符串
```
这种变量本身类型不固定的语言称之为动态语言，与之对应的是静态语言,例如java

- 为了修补JavaScript这一严重设计缺陷(不强制要求用var申明变量,不用var申明的变量会被视为全局变量)，ECMA在后续规范中推出了strict模式，在strict模式下运行的JavaScript代码，强制通过var申明变量，未使用var申明变量就使用的，将导致运行错误。启用strict模式的方法是在JavaScript代码的第一行写上：
```
'use strict';
```
为了避免这一缺陷,所有的JavaScript代码都应该使用strict模式.
- js中% 为求余运算，和求模运算不同，其差别主要体现在求整数商c，例如：计算-7 Mod 4，进行求模运算c = -2（向负无穷方向舍入），求余c = -1（向0方向舍入）；
