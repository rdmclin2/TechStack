title: "express-note"
tags:
---

##express中间件

### express视图助手dynamicHelpers和helpers从2.x到3.x改成什么了？
```
app.use(function (req,res,next) {
    res.locals.user = req.session.user;

    var err = req.flash('error');
    var success = req.flash('success');

    res.locals.error = err.length ? err: null;
    res.locals.success = success.length ? success : null;

    next();
});

// app.dynamicHelpers({
//   user: function (req,res) {
//     return req.session.user;
//   },
//   error: function (req,res) {
//     var err = req.flash('error');
//     if(err.length){
//       return err;
//     }else{
//       return null;
//     }
//   },
//   success: function (req,res) {
//     var succ = req.flash('success');
//     if(succ.length){
//       return succ;
//     }else{
//       return null;
//     }
//   }
// });
```

### connect-flash flash中间件


### cookie-parser cookie解析中间价
[官网](https://www.npmjs.com/package/cookie-parser)
例子:
```
var express      = require('express')
var cookieParser = require('cookie-parser')

var app = express()
app.use(cookieParser())

app.get('/', function(req, res) {
  console.log("Cookies: ", req.cookies)
})

app.listen(8080)

// curl command that sends an HTTP request with two cookies
// curl http://127.0.0.1:8080 --cookie "Cho=Kim;Greet=Hello"
```

### connect-mongo 用来在mongo中存储session
[connect-mongo包官网](https://www.npmjs.com/package/connect-mongo)
例子:
```
var session = require('express-session');
var MongoStore = require('connect-mongo')(session);

app.use(session({
    secret: 'foo',
    store: new MongoStore(options)
}));
```

### express-session session管理中间件
[官网](https://github.com/expressjs/session)
例子:
```
var express = require('express')
var parseurl = require('parseurl')
var session = require('express-session')

var app = express()

app.use(session({
  secret: 'keyboard cat',
  resave: false,
  saveUninitialized: true
}))

app.use(function (req, res, next) {
  var views = req.session.views

  if (!views) {
    views = req.session.views = {}
  }

  // get the url pathname
  var pathname = parseurl(req).pathname

  // count the views
  views[pathname] = (views[pathname] || 0) + 1

  next()
})

app.get('/foo', function (req, res, next) {
  res.send('you viewed this page ' + req.session.views['/foo'] + ' times')
})

app.get('/bar', function (req, res, next) {
  res.send('you viewed this page ' + req.session.views['/bar'] + ' times')
})
```
