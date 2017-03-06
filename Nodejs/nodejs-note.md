title: "我的nodejs学习之旅［开端］"
tags: [nodejs]

---

本文为学习nodejs过程中的知识整理，部分引用原文话语.参考文献:
- [nodejs 包教不包会](https://github.com/alsotang/node-lessons)
- [7天学会nodejs](http://mclspace.com/2015/08/21/7-days-nodejs/)
- [粉丝日志](http://blog.fens.me/nodejs-roadmap/)


## 常用库教程
- [restify](http://segmentfault.com/a/1190000000369308)

## 书籍
- NodeJS开发指南


## 常用技巧
### 计时
**console.time(label)**
> Mark a time.

**console.timeEnd(label)**

```
Finish timer, record output. Example:

console.time('100-elements');
for (var i = 0; i < 100; i++) {
  ;
}
console.timeEnd('100-elements');
// prints 100-elements: 262ms
```

### 格式化json输出
JSON.stringify的第4个参数可以定义插入的空格的数量。

```
JSON.stringify({ a:1, b:2, c:3 }, null, 4);
/* output:
{
     "a": 1,
     "b": 2,
     "c": 3,
}
*/
```

##记录
###推荐用homebrew 来安装nvm
`brew install nvm` 并按照brew的指示添加文件夹和指令

<del>
使用[nvm](https://github.com/creationix/nvm)管理node版本，使用以下命令安装:
```
  $ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.2/install.sh | bash
```
</del>

常用命令：
- 查看哪些版本可以用  `nvm ls-remote`
- 安装某一版本 `nvm install 0.12`
- 显示所有版本 `nvm ls`
- 使用某一版本 `nvm use 0.12`
- 卸载nvm `sudo rm -rf ~/.nvm`，并且删除.zshrc或.profile中的关于nvm的行,重启终端。
- 设定默认版本 `nvm alias default 4.1.0`

### 下面是一个完全符合 CommonJS 规范的 package.json 示例:
```
{
"name": "mypackage",
"description": "Sample package for CommonJS. This package demonstrates the required
       elements of a CommonJS package.",
    "version": "0.7.0",
    "keywords": [
"package",
"example" ],
    "maintainers": [
       {
          "name": "Bill Smith",
          "email": "bills@example.com",
       }
    ],
    "contributors": [
       {
          "name": "BYVoid",
          "web": "http://www.byvoid.com/"
} ],
    "bugs": {
       "mail": "dev@example.com",
       "web": "http://www.example.com/bugs"
    },
    "licenses": [
       {
          "type": "GPLv2",
          "url": "http://www.example.org/licenses/gpl.html"
} ],
    "repositories": [
       {
          "type": "git",
          "url": "http://github.com/BYVoid/mypackage.git"
       }
    ],
    "dependencies": {
       "webkit": "1.2",
       "ssl": {
          "gnutls": ["1.0", "2.0"],
          "openssl": "0.9.8"
       }
} }
```

### 使用npm进行包依赖管理,安装node时默认安装
常用命令:
- 在项目文件夹下安装包 `npm [install/i] -g [package_name]`，加-g添加到全局
- 显示帮助，使用`npm help <command>`可查看某条命令的详细帮助，例如`npm help install`。
- 列出项目的包结构 `npm list`
- 互动式地生成一份最简单的 package.json 文件 `npm init`
- 安装包，并自动将依赖写入到 package.json文件中 `npm install express utility --save`
- 删除包,`npm uninstall express',响应的也可以加-g选项
- 使用`--registry`指定安装时候的源,如:`--registry=https://registry.npm.taobao.org`
- 在package.json所在目录下使用`npm install . -g`可先在本地安装当前命令行程序，可用于发布前的本地测试。
- 使用`npm update <package>`可以把当前目录下node_modules子目录里边的对应模块更新至最新版本
- 使用`npm update <package> -g`可以把全局安装的对应命令行程序更新至最新版。
- 使用npm cache clear可以清空NPM本地缓存，用于对付使用相同版本号发布新版本代码的人
- 使用npm unpublish <package>@<version>可以撤销发布自己发布过的某个版本代码。
- 使用npm adduser 创建用户，用`npm whoami`测试是否已取得账户
- 在 package.json 所在目录下运行 npm publish,发布包,访问 <http://search.npmjs.org/> 就可以找到自己刚刚发布的包了
- 如果你的包将来有更新,只需要在 package.json 文件中修改 version 字段,然后重新 使用 npm publish 命令就行了。
- 使用`npm update -g npm` 更新npm


### 为什么使用全局模式
为什么要使用全局模式呢?多数时候并不是因为许多程序都有可能用到它,为了减少多重副本而使用全局模式,
而是因为本地模式不会注册 PATH 环境变量。举例说明,我们安装 supervisor 是为了在命令行中运行它,
譬如直接运行 supervisor script.js,这时就需要在 PATH 环境变量中注册 supervisor

### 创建全局链接
npm 提供了一个有趣的命令 `npm link`,它的功能是在本地包和全局包之间创建符号链 接。
我们说过使用全局模式安装的包不能直接通过 require 使用,
但通过` npm link命令 `可以打破这一限制。举个例子,我们已经通过 `npm install -g express` 安装了 express,
这时在工程的目录下运行命令:
```
￼$ npm link express
./node_modules/express -> /usr/local/lib/node_modules/express
```
￼我们可以在 node_modules 子目录中发现一个指向安装到全局的包的符号链接。通过这 种方法,我们就可以把全局包当本地包来使用了。
￼除了将全局的包链接到本地以外,使用 npm link命令还可以将本地的包链接到全局。 使用方法是在包目录( package.json 所在目录)中运行 npm link 命令。如果我们要开发 一个包,利用这种方法可以非常方便地在不同的工程间进行测试。


###使用package.json文件管理项目的依赖
- 使用`npm init` 生成最简单的package.json文件
- 使用`--save` 参数将安装的包自动写入到package.json文件中
- 使用`–save-dev`标示符，它用来告诉npm将我们添加的依赖模块放入package.json文件的devDependencies字段中

### 使用supervisor来监视对代码的改动,自动重启Node.js
```
   $ npm install -g supervisor
   #安装
   $ supervisor app.js
   #使用,当代码被改动时,运行的脚本会被终止,然后重新启动
```

###node常用命令
- 运行node app `node app.js`
- 把要执行的语句作为 node -e 的参数直接执行。
```
    $ node -e "console.log('Hello World');"
    Hello World
```
- REPL模式,运行无参node,进入交互式shell。


### 调试
- `node debug debug.js` 启动调试工具
- 在命令行下使用以下两个语句之一可以打开调试服务器:
```
node --debug[=port] script.js 脚本会正常 执行,但不会暂停
node --debug-brk[=port] script.js 这时调试服务器在启动后会立刻暂停 执行脚本,等待调试客户端连接。
```
当调试服务器启动以后,可以用命令行调试工具作为调试客户端连接,例如:
```
//在一个终端中
$ node --debug-brk debug.js debugger listening on port 5858
//在另一个终端中
$ node debug 127.0.0.1:5858 connecting... ok
debug> n
break in /home/byvoid/debug.js:2
1 var a = 1;
2 var b = 'world';
3 var c = function (x) {
4 console.log('hello ' + x + a);
debug>
```
- 使用 node-inspector 调试 Node.js

首先,使用 npm install -g node-inspector 命令安装 node-inspector,然后在
终端中通过 `node --debug-brk=5858 debug.js` 命令连接你要除错的脚本的调试服务器,
启动 node-inspector:
```
    $ node-inspector
```
在浏览器中打开 <http://127.0.0.1:8080/debug?port=5858>,即可显示出优雅的 Web 调试工 具


## 全局对象
- Nodejs中的全局对象是global,在浏览器中是window,所有全局变量(除了 global 本身以外)都是 global 对象的􏱅性。

### process
- process.argv 命令行参数数组，第一个参数是node,第二个参数是脚本文件名，第三个运行参数起每一个元素是一个运行参数
- process.stdout是标准输出流
- process.stdin是标准输入流
- process.nextTick(callback)的功能是为事件􏰜环设置一项任务
- 详细:<http://nodejs.org/api/process.html >


### console
- console.log():􏰑标准输出流打􏰒字符并以􏲛行符结􏲜

- console.error():与 console.log() 用法􏲥同,只是􏰑标准错误流输出

- console.trace():􏰑标准错误流输出􏰝前的调用􏲦

## 常用工具util
- util.inherits(constructor, superConstructor)是一个实现对象间􏰨􏰡继承的函数。
- util.inspect(object,[showHidden],[depth],[colors])是一个将任意对象􏲰􏲛 为字符􏲟的方法,通常用于调试和错误输出。
- 除了以上我们介绍的几个函数之外,util还提供了util.isArray()、util.isRegExp()、 util.isDate()、util.isError() 􏲾个􏲠􏰡􏲿试工具,以及 util.format()、util. debug() 等工具
- 详细: <http://nodejs.org/api/util.html >

## 事件驱动 events

events 模块只提供了一个对象: events.EventEmitter。EventEmitter 的核心就 是事件发射与事件􏳎听器功能的􏳏装。
### 事件发􏳌射器
- EventEmitter.on(event, listener) 为指定事件注􏳐一个􏳎监听器,接受一个字符event 和一个回调函数listener。
- EventEmitter.emit(event, [arg1], [arg2], [...]) 发射 event 事件,传递若干􏲝􏲞可􏰻参数到事件􏳎听器的参数表。
- EventEmitter.once(event, listener) 为指定事件注􏳐一个􏱹􏳒􏳎听器,􏱆􏳎听器最多只会触发一次,触发后􏱼􏰤解除该􏳎听器。
- EventEmitter.removeListener(event, listener) 􏳓除指定事件的􏳔个􏳎听器,listener 􏰗􏰘是该事件已经注􏳐过的􏳎听器
- EventEmitter.removeAllListeners([event]) 􏳓除所有事件的所有􏳎听器, 如果指定 event,则􏳓除指定事件的所有􏳎听器。
- 详细<http://nodejs.org/api/events.html>

### error事件
emitter.emit('error') 发射error事件，学会为error事件添加监听器，避免异常退出

### 􏳝􏳞继承EventEmitter
大多数时􏱺我们不会􏱊接使用 EventEmitter,而是在对象中继􏲬它。包括 fs、net、 http 在内的,只要是支持事件􏰛应的核心模块都是 EventEmitter 的􏳑􏲠。

## 文件 fs
与其他模块不同的是,fs 模块中所有的操作都提供了异步的和 同步的两个版本,例如读取文件内容的函数有异步的 fs.readFile() 和同步的 fs.readFileSync()。
- fs.readFile(filename,[encoding],[callback(err,data)]) 不指定编码则以 Buffer 形式表示二􏰌进制数据
- fs.readFileSync 同步版本,你需要使用 try 和 catch 􏴐􏴑并处理异常,读取到的文件内容会以函数􏴅回值的形式􏴅回
- fs.open(path, flags, [mode], [callback(err, fd)])，它接受两个􏰗􏰻参数,path 为文件的路􏴕, flags 可以是以下值:r,r+,w,w+,a,a+
- fs.read(fd, buffer, offset, length, position, [callback(err, bytesRead, buffer)])
- ...

## http 服务器
- http.Server 的􏳀􏳁事件,包括 request,connection,close,请求处理函数接受两个参数,分别是请求对象( req )和响􏰛应对象 ( res )


###常用包
- [express](https://github.com/strongloop/express) tj大神的快速应用框架,现在好像转交给StrongLoop管理了.
- [utility](https://github.com/node-modules/utility) 定义了很多常用且比较杂的辅助方法,包括md5,sha1等.
- [superagent](http://visionmedia.github.io/superagent/)
> $ http 方面的库，可以发起 get 或 post 请求
- [cheerio](https://github.com/cheeriojs/cheerio)
> $  Node.js 版的 jquery,从网页中以 css selector 取数据，使用方式跟 jquery 一样一样的。
- [async](https://github.com/caolan/async)
> $ 异步并发控制工具
- [mocha](https://github.com/mochajs/mocha)
> $ nodejs测试框架
- [should](https://github.com/tj/should.js)
> $ nodejs断言工具
- [istanbul](https://github.com/gotwarlost/istanbul)
> $ js 代码覆盖工具
- [chai](https://github.com/chaijs/chai)
> $ 全栈断言库
- [supertest](https://github.com/visionmedia/supertest)
> $  supertest 是 superagent 的孪生库呢，因为他们的 API 是一模一样的。superagent 是用来抓取页面用的，而 supertest，是专门用来配合 express （准确来说是所有兼容 connect 的 web 框架）进行集成测试的。
- [nodemon]( https://github.com/remy/nodemon)
> $ 这个库是专门调试时候使用的，它会自动检测 node.js 代码的改动，然后帮你自动重启应用。在调试时可以完全用 nodemon 命令代替 node 命令。
- [benchmark](https://github.com/bestiejs/benchmark.js)
> $ 测试哪个方法更快
- [showdown](https://github.com/showdownjs/showdown)
> $ 一款markdown to html的js转换包
- [markx](https://github.com/jgallen23/markx)
> $ 一款将md，jade文件转换成html的命令行工具
- [socket.io](https://github.com/socketio/socket.io)
> $ 实时通信应用架构 for nodejs
- [passport](https://github.com/jaredhanson/passport)
> $ 基于Nodejs的认证中间件,只是为了“登陆认证”
- [later](https://github.com/bunkat/later)
> $ Later 是一个基于Nodejs的工具库，用最简单的方式执行定时任务
- [browserify](https://github.com/substack/node-browserify)
> $ Browserify 的出现可以让Nodejs模块跑在浏览器中，用require()的语法格式来组织前端的代码，加载npm的模块。
在浏览器中，调用browserify编译后的代码，同样写在<script>标签中。
- [commander.js](https://github.com/tj/commander.js)
> $ 轻巧的nodejs模块，提供了用户命令行输入和参数解析强大功能。
- [tty](https://github.com/chjj/tty.js/)
> $ 一个支持在浏览器中运行的命令行窗口，基于node.js平台，依赖socket.io库，通过websocket与Linux系统通信。
- [node-webkit](https://github.com/nwjs/nw.js)
> $ NodeJS与WebKit技术的融合，提供一个跨Windows、Linux平台的客户端应用开发的底层框架，利用流行的Web技术（Node.JS，JavaScript，HTML5）来编写应用程序的平台。应用程序开发人员可以轻松的利用Web技术来实现各种应用程序。
- [nodeos](https://github.com/nodeos/nodeos)
> $ 采用NodeJS开发的一款友好的操作系统，该操作系统是完全建立在Linux内核之上的，并且采用shell和NPM进行包管理
- [lodash](https://lodash.com/docs#pick)
> $ 这是一个封装了很多js方法的工具类，underscore的代替者
- [colors](https://www.npmjs.com/package/colors)
> $ 在命令行中打印有颜色的输出
- [bcrypt](https://www.npmjs.com/package/bcrypt)
> $ Lib to help you hash passwords. node下的加密解密工具
- [body-parser](https://www.npmjs.com/package/body-parser)
> $ Node.js body parsing middleware.  body请求转换中间件，一般和connect中间件和express一起适用
- [morgan](https://www.npmjs.com/package/morgan)
> $ mHTTP request logger middleware for node.js ,也就是在收到Http请求之后输出该请求的信息

- [validator](https://www.npmjs.com/package/validator)
> $ A library of string validators and sanitizers. 各种验证器，如isEmail

- [Leaflet](https://github.com/Leaflet/Leaflet)
> $ JavaScript library for mobile-friendly interactive maps http://leafletjs.com
- [node-uuid](https://github.com/broofa/node-uuid)
> $ Generate RFC-compliant UUIDs in JavaScript 可以用来生成token
- $[connect-flash](https://www.npmjs.com/package/connect-flash)
>

###术语
- REPL(read–eval–print loop) 读取﹣求值﹣输出循环

- CSRF（Cross-site request forgery跨站请求伪造，也被称为“one click attack”或者session riding，通常缩写为CSRF或者XSRF，是一种对网站的恶意利用。
- query

- body
> req.body 就是 POST 请求􏰥􏰦解析过后的对象

- md5
> MD5消息摘要算法（英语：MD5 Message-Digest Algorithm），一种被广泛使用的密码散列函数，
可以产生出一个128位（16字节）的散列值（hash value），用于确保信息传输完整一致。
1996年后被证实存在弱点，可以被加以破解，对于需要高度安全性的数据，专家一般建议改用其他算法，
如SHA-1。2004年，证实MD5算法无法防止碰撞，因此无法适用于安全性认证，如SSL公开密钥认证或是数字签章等用途。

- sha1
> 安全散列算法（英语：Secure Hash Algorithm）是一种能计算出一个数字消息所对应到的，长度固定的字符串（又称消息摘要）的算法。
且若输入的消息不同，它们对应到不同字符串的概率很高；而SHA是FIPS所认证的五种安全散列算法。这些算法之所以称作“安全”是基于以下两点（根据官方标准的描述）：
由消息摘要反推原输入消息，从计算理论上来说是很困难的。
想要找到两组不同的消息对应到相同的消息摘要，从计算理论上来说也是很困难的。任何对输入消息的变动，都有很高的概率导致其产生的消息摘要迥异。

- OCD
> $ Obsessive–compulsive disorder 强迫症, tj的twitter介绍

- MIME
> MIME (Multipurpose Internet Mail Extensions) 是描述消息内容类型的因特网标准。MIME 消息能包含文本、图像、音频、视频以及其他应用程序专用的数据。

- BSON
> BSON（）是一种类json的一种二进制形式的存储格式，简称Binary JSON，它和JSON一样，支持内嵌的文档对象和数组对象，但是BSON有JSON没有的一些数据类型，如Date和BinData类型。
Mongodb中的文档实际上是指BSON

- orm
> 全称是 Object-Relational Mapping,对象关系映射

- odm
>  Object-Document Mapping，对象文档映射。它的作用就是，在程序代码中，定义一下数据库中的数据格式，然后取数据时通过它们，可以把数据库中的 document 映射成程序中的一个对象，这个对象有 .save .update 等一系列方法，和 .title .author 等一系列属性。在调用这些方法时，odm 会根据你调用时所用的条件，自动转换成相应的 mongodb shell 语句帮你发送出去。自然地，在程序中链式调用一个个的方法要比手写数据库操作语句具有更大的灵活性和便利性。

- 阻塞
> 什么是阻塞(block)呢?线程在执行中如果遇到磁盘读写或网络通信(统称为 I/O 操作), 通常要耗费较长的时间,这时操作系统会剥夺这个线程的 CPU 控制权,使其暂停执行,同 时将资源让给其他的工作线程,这种线程调度方式称为 阻塞。当 I/O 操作完毕时,操作系统 将这个线程的阻塞状态解除,恢复其对CPU的控制权,令其继续执行。这种 I/O 模式就是通 常的同步式 I/O(Synchronous I/O)或阻塞式 I/O (Blocking I/O)。

- dist
> 很多项目中的dist文件夹是做什么的？
全称是distribution。在某些框架中，因为开发和发布是的内容或者代码形式是不一样的（比如利用Grunt压缩等等)，这时候就需要一个存放最终发布版本的代码，这就是dist文件夹的用处。

- FP
> 函数式编程,具体请看 [傻瓜函数式编程](https://github.com/justinyhuang/Functional-Programming-For-The-Rest-of-Us-Cn/blob/master/FunctionalProgrammingForTheRestOfUs.cn.md)

- i18n
> i18n（其来源是英文单词 internationalization的首末字符i和n，18为中间的字符数）是“国际化”的简称。在资讯领域，国际化(i18n)指让产品（出版物，软件，硬件等）无需做大的改变就能够适应不同的语言和地区的需要。对程序来说，在不修改内部代码的情况下，能根据不同语言及地区显示相应的界面。 在全球化的时代，国际化尤为重要，因为产品的潜在用户可能来自世界的各个角落。通常与i18n相关的还有L10n（“本地化”的简称）。

- RTFM
> 是一个网络语言，意思是：“去读那些他妈的手册”（Read The Fucking Manual）

##学习资源
- [nodejs 包教不包会](https://github.com/alsotang/node-lessons)
- [使用 Express + MongoDB 搭建多人博客](https://github.com/nswbmw/N-blog)
- [七天学会NodeJS](https://nqdeng.github.io/7-days-nodejs/)
- [Node入门](http://www.nodebeginner.org/index-zh-cn.html)
- [Nodejs学习路线图](http://blog.fens.me/nodejs-roadmap/)
- [阮一峰老师的标准参考教程](http://javascript.ruanyifeng.com/)
- [tj大神的medium](https://medium.com/@tjholowaychuk)
- [scotch教程，强烈推荐，简直漂亮](https://scotch.io)
- [正则表达式30分钟入门教程](http://deerchao.net/tutorials/regex/regex.htm)
- [正则表达式之：零宽断言不『消费』](http://fxck.it/post/50558232873)
- [mongodb 小黄书](https://github.com/justinyhuang/the-little-mongodb-book-cn/blob/master/mongodb.md)
- [redis 小黄书](https://github.com/JasonLai256/the-little-redis-book/blob/master/cn/redis.md)
- [用npm-run自动化任务](http://segmentfault.com/a/1190000000344102)
## 网站工具
- [所见即所得的正则表达式测试网站](http://refiddle.com/)
- [在线分享js benchmark](http://jsperf.com/)
- [travis-ci](https://travis-ci.org/)
> $ 帮你生成github项目中常有的 build passing图标,持续集成平台：travis
- [coveralls](https://coveralls.io/)
> $ 帮你生成github项目中常有的 coverage 100% 图标


## 常见问题
- process.env.PORT是什么意思?
> 启动node进程携带的变量
在linux下
只设置一次有效 $ PORT=1234 node xxoo.js
只设置永久有效  $ export PORT=1234
在window下
默认是永久情况
set PORT=1234
node xxoo.js
