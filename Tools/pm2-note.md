PM2 笔记
========

安装
```
$ npm install pm2 -g
```

启动
```
$ pm2 start app.js
```
App会在后台运行，被监控，并一直存货


更新
```
# Install latest pm2 version
$ npm install pm2 -g
# Save process list, exit old PM2 & restore all processes
$ pm2 update
```