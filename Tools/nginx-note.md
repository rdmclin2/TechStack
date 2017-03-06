 Nginx 笔记
=========

# Mac安装nginx
使用`brew`安装 
```
$ brew install nginx
```

然后运行
```
$ sudo nginx
```

使用
```
http://localhost:8080 
```
进行测试

关闭命令
```
$ sudo nginx -s stop
```

默认用brew安装的nginx配置文件在:
```
/usr/local/etc/nginx/nginx.conf
```

修改端口为80
```
server {
    listen       8080;
    server_name  localhost;

    #access_log  logs/host.access.log  main;

    location / {
        root   html;
        index  index.html index.htm;
    }
```
将8080改成80

修改服务器文件位置,例如`/Users/xajler/www`;
```
server {
    listen       80;
    server_name  localhost;

    #access_log  logs/host.access.log  main;

    location / {
        root   /Users/xajler/www;
        index  index.html index.htm;
    }
```