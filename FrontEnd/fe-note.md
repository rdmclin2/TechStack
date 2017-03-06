title: "前端笔记"
tags:
---

## css 最佳实践
- 用`<link>` 代替 `@import`,因为`@import`会在用到的时候再读取，导致浏览器闪屏，用`<link>`浏览器会并行读取
- 如何改变icon的大小？直接在css文件中修改font-size,例如`font-size: 25px;`

## js 最佳实践
- 在事件处理函数里`return false` 表示阻止浏览器对事件的默认处理,例如
```
links[i].onclick = function () {
  showSection(links[i].destination);
  return false;
}
```
表示屏蔽link默认的打开链接事件,因为showSection中已经对该链接做了处理

## 跨域问题
本地的localhost:8100端口访问p.nju发送post请求被拦截，原因是浏览器拦截了非同源请求
>
if I understood it right you are doing an XMLHttpRequest to a different domain than your page is on. So the browser is blocking it as it usually allows a request in the same origin for security reasons. You need to do something different when you want to do a cross-domain request. A tutorial about how to achieve that is Using CORS.

> When you are using postman they are not restricted by this policy. Quoted from Cross-Origin XMLHttpRequest:

> Regular web pages can use the XMLHttpRequest object to send and receive data from remote servers, but they're limited by the same origin policy. Extensions aren't so limited. An extension can talk to remote servers outside of its origin, as long as it first requests cross-origin permissions.

下载chrome的插件[`Allow-Control-Allow-Origin: *`](https://chrome.google.com/webstore/detail/allow-control-allow-origi/nlfbmbojpeacfghkpbjhddihlkkiljbi?hl=en-US)解决

> 这个是javascript的跨域问题。它说明的是请求发起的域名不被服务端认可。
解决这个问题的方法可以在服务端的response上添加`Access-Control-Allow-Origin = ‘*’`


## 非常好的前后端博客和文章及人
- [张云龙的github博客](https://github.com/fouber)
> fucking good
- [前端工程基础篇](https://github.com/fouber/blog/blob/master/201508/01.md)
> 上面那位大牛的
- [移动端自适应方案](http://f2e.souche.com/blog/yi-dong-duan-zi-gua-ying-fang-an/)

- [稀土掘金](http://gold.xitu.io/#/)
> 聚合了很多不错的资源


## 创业公司招聘
- [大搜车前端招聘](http://f2e.souche.com/blog/jia-ru-wo-men-tuan-dui-qian-duan-nodejs/)
- [稀土](https://xitu.io/jobs)
- [Zen](https://cnodejs.org/topic/55deb03928f7851f3946367c)
- [腾讯](https://cnodejs.org/topic/55ff79b2152fdd025f0f4f20)
- [moveha](https://cnodejs.org/topic/54c58bc40d075f173d433f23)


## 软件
[framer破解](http://www.waitsun.com/framer-studio-1-11-173.html)
> mojado@gnu.org 959267c9140c1bd8b7b68e3b64219e
