title: "ejs note"
tags:

---

## github地址 <https://github.com/tj/ejs>

## 教程
[scotch](https://scotch.io/tutorials/use-ejs-to-template-your-node-application)

## 基本
### nodejs中设置模板引擎为ejs
```
app.set('view engine', 'ejs');

```

### `res.render('path', {data}` 渲染
res 会寻找views文件夹,因此下面的`pages/index`路径实际上是`views/pages/index`如:
```
app.get('/', function(req, res) {
    var drinks = [
        { name: 'Bloody Mary', drunkness: 3 },
        { name: 'Martini', drunkness: 5 },
        { name: 'Scotch', drunkness: 10 }
    ];
    var tagline = "Any code of your own that you haven't looked at for six or more months might as well have been written by someone else.";

    res.render('pages/index', {
        drinks: drinks,
        tagline: tagline
    });
});
```


### `<% include FILENAME %>` 传入布局模板
如:
head
```
<!-- views/partials/head.ejs -->

<meta charset="UTF-8">
<title>Super Awesome</title>

<!-- CSS (load bootstrap from a CDN) -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<style>
    body    { padding-top:50px; }
</style>
```

header
```
<!-- views/partials/header.ejs -->

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">

        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <span class="glyphicon glyphicon glyphicon-tree-deciduous"></span>
                EJS Is Fun
            </a>
        </div>

        <ul class="nav navbar-nav">
            <li><a href="/">Home</a></li>
            <li><a href="/about">About</a></li>
        </ul>

    </div>
</nav>
```

footer
```
<!-- views/partials/footer.ejs -->

<p class="text-center text-muted">© Copyright 2014 The Awesome People</p>
```

index 拼接模板
```
<!-- views/pages/index.ejs -->

<!DOCTYPE html>
<html lang="en">
<head>
    <% include ../partials/head %>
</head>
<body class="container">

    <header>
        <% include ../partials/header %>
    </header>

    <main>
        <div class="jumbotron">
            <h1>This is great</h1>
            <p>Welcome to templating using EJS</p>
        </div>
    </main>

    <footer>
        <% include ../partials/footer %>
    </footer>

</body>
</html>
```


### `<%= variable %>` 替换一个传入的变量
如:
```
...
<h2>Variable</h2>
<p><%= tagline %></p>
...
```

### `<% %>`,传入代码
如:
```
...
<h2>Loop</h2>
<ul>
    <% drinks.forEach(function(drink) { %>
        <li><%= drink.name %> - <%= drink.drunkness %></li>
    <% }); %>
</ul>
...
```

### `<%- %>` 显示原始HTML
