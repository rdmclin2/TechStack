深入浅出Node.js笔记
=========

# 第一章
## 异步I/O
- Don't call me,I will call you 原则
- 事件,回调,异步
- 单线程 -> 子进程 -> 将大计算量分发到各个子进程，通过进程事件消息传递结果
- 适合处理I/O密集型应用场景，根本没有I/O的场景（纯计算）更适合使用多线程的方式。 ->开子线程，用C/C++扩展 

# 第二章
## 模块机制
- commonJS ->让JS能够在任何地方运行  
- require - > module代表模块自身，exports对象是唯一导出的出口，一个文件就是一个模块。 
- require('模块'),这里模块可以是一个小驼峰(如:strLength)命名的字符串，可以是相对路径，可以是绝对路径，可以没有文件名后缀.js
- 模块分为核心模块和文件模块，核心模块引入要优先与文件模块
- Node引入的模块都会缓存，减少二次引用的开销。
- 自定义模块指的是非核心模块，其查找规则基于模块路径。如果标示符中不包括扩展名，那么node会按.js,.json,.node的次序补足进行尝试。这里用了fs模块同步阻塞判断文件是否存在，存在性能问题。因此如果是.node和.json文件,带上扩展名会加快一点速度。
- 每个模块都有require,exports,module这3个变量，在编译过程中，Node对获取到的JS文件内容进行了头尾包装,如:
```
(function (exports, require, module, __filename, __dirname) {
    var math = require('math');
    exports.area = function(radius){
       return Math.PI * radius * radius; 
    };
})
```