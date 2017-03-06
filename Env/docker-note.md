title: "Docker 学习笔记"
date: 2015-06-09 20:20:10
categories: dev
tags: docker

---
##前言
本篇为学习使用docker过程中的一些记录，学习docker的原因是希望使用docker在服务器上自动化部署本地编写的服务端程序。本文为学习笔记型文章，方便快速查阅，关于docker的安装等内容请移步[官网](docker.com),想系统的学习docker可以看dockerpool出的[书](http://dockerpool.com/static/books/docker_practice)。
PS:下文的使用环境为macos

## 比较好的教程
- http://segmentfault.com/a/1190000000366923


<!-- more -->

##常用命令

- 获取镜像`docker pull`,如
```
$ docker pull ubuntu:12.04
Pulling repository ubuntu
ab8e2728644c: Pulling dependent layers
511136ea3c5a: Download complete
5f0ffaa9455e: Download complete
a300658979be: Download complete
904483ae0c30: Download complete
ffdaafd1ca50: Download complete
d047ae21eeaf: Download complete
```
从 Docker Hub 仓库下载一个 Ubuntu 12.04 操作系统的镜像

- 列出本地镜像`docker images`,如
```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
nginx               latest              a785ba7493fd        12 days ago         132.9 MB
hello-world         latest              91c95931e552        7 weeks ago         910 B
```


- Mac环境下启动docker `boot2docker start`
mac下需要开启一个虚拟机，和其他linux系统不同

- 列出已有的容器 `docker ps` ,加参数'-a'列出所有镜像

- 查看boot2docker状态 `boot2docker status`

- 启动一个容器并运行一个镜像 如：`docker run -d -P --name web nginx`
-d :让容器在命令完成后在后台继续运行
－P :The -P flag publishes exposed ports from the container to your local host; this lets you access them from your Mac.

- 查看容器端口`docker port web`,如:
```
$ docker port web
443/tcp -> 0.0.0.0:32770
80/tcp -> 0.0.0.0:32771
```
容器端口80映射到host端口32771

- 查看VM的ip地址 `boot2docker ip`

- 在网页中访问应用的地址为 `$VM ip地址 /host port`，如:
http://192.168.59.103:32771

- 停止容器 `docker stop`,如:
```
	docker stop web
```
stop container name / container id

- 删除容器 `docker rm`,如:
```
	docker rm web
```
rm container name / container id

- 从dockerfile中构建镜像`docker build` 如:
```
# -t 镜像的名称
# --rm 构建成功后，删除临时镜像（每执行一行 Dockerfile 中的命令，就会创建一个临时镜像）
# “.” 是 Dockerfile 所在的路径（当前目录）, 也可以替换为一个具体的 Dockerfile 的路径。
docker build -t="ouruser/sinatra:v2" .
或 docker build --rm -t ouruser/sinatra:v2 .
```

- 推送到dockerhub `docker push` 如:
```
docker push user/sinatra
```
注意创建和推送时把user替换成自己的用户名

- 进入容器控制台 `docker attach`如:
```
	docker attach name
```
按两次回车进入，按ctrl+p+q退出(按住ctrl，先按p再按q)

- 查看容器信息 `docker inspect` 如:
```
	docker inspect name
```

- 将本地文件挂载到container中,`-v`
```
	docker run -v /data:/mnt -i -t rdmclin2/node /bin/bash
```
例如将data文件夹挂载到container中的mnt文件夹中，可以在mnt文件夹中查看，这个文件是共享的，所以两边的操作都会互相看到。
将mnt的文件拷贝到container中即可。

- 启动容器的终端
```
docker run -t -i ouruser/sinatra:v2 /bin/bash
```

- 提交修改过的container创建为image,`docker commit`
```
	docker commit -m "Added app file and do npm insall" -a "xxxx" 6f878669e0d7 rdmclin2/node
```
`-m`为信息，`－a`为用户信息。后面的id胃container的id

- 指定端口运行image `-p`,如:
```
	docker run -p 49160:8080 -d <your username>/centos-node-hello
```
在docker run 后面追加-d=true或者-d，则containter将会运行在后台模式(Detached mode)

- 重启一个停止的容器 `docker restart`，如:
```
	sudo docker restart containerName
```

- 如何编写Dockerfile ?
> $ [看这个](https://github.com/zhangpeihao/LearningDocker/blob/master/manuscript/04-WriteDockerfile.md)

- 停止并删除所有container
```
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```

- 批量删除所有<none>的镜像
```
docker rmi $(docker images -q --filter "dangling=true")
```

---

<!--
##nodejs+mongodb应用服务器端部署过程
首先在服务器端安装好docker。
###打包nodejs server
我在本机上（开发环境）打包了nodejs服务器给我的ionic程序提供web service，现在需要将该服务器（生产环境）部署到国外的vps主机上。
为了防止意外请做好备份。

1. 终端中cd到你的服务器文件夹中，创建Dockerfile 文件
```
	touch Dockerfile
```

2. 打开Dockerfile 输入：
```
FROM    centos:6

# Enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN     yum install -y npm

# Bundle app source
COPY . /server
# Install app dependencies,remove node-modules dir
RUN 	cd /server;rm -rf node-modules; npm install

EXPOSE  9804
CMD ["node", "/server/server.js"]
```
server是你要创建的应用文件夹的名字。
下面的端口换成服务器的默认端口。server.js是nodejs app的入口。
PS:注意如果是1.2.20的nodejs你的应用的package.json中要添加private标签，你也可以添加自己的respository：
如下:
```
{
  "name": "my-super-amazing-app",
  "version": "1.0.0",
  "private": true
}
```

3. 终端输入
```
	docker build -t "username/my-nodejs-app" .
```
-t指定tag,tag中指定用户名，避免等会不能push到dockerhub上,因为我们不能push一个"root" repository.

4. 在终端中输入
```
	docker images
```
查看你的应用是否成功打包.

5. 将应用push到dockerhub上
```
	docker push username/my-nodejs-app
```
如果你之前没有登录过dockerhub会提示你输入用户名密码邮箱，如果登录过了，会将认证信息存在本地，下次登录就只要回车就行。

6. 服务器端安装运行mongodb 的docker image：
```
	sudo docker run --name db -d mongo
```
可以查看[mongodb的docker repo的地址](https://registry.hub.docker.com/_/mongo/)
将--name 后的名字改成你想要的的名称。

7. 终端输入
```
	docker inspect db
```
记下db的NetworkSettings中的IPAddress等会需要用。

8. 服务器端下载我们上传的image
```
	docker pull username/my-nodejs-app
```

9. 终端输入
```
	docker run -t -i username/my-nodejs-app /bin/bash
```
修改你的app中db的地址为上面记录的ip。保存退出。

10. 将刚刚的container存成image
```
	docker commit -m "edit db address" <container id> username/server:v1
```

11. 指定端口启动我们的node_server，这里image里是9804，host端的映射也可以是9804或者任意你指定的端口。
```
	docker run -p 9804:9804 -d username/server:v1
```
172.17.0.10
如果你的image不是用dockerfile生成的，没有build时候的CMD,可以先用交互窗口将端口暴露出来.
```
	docker run --name nodejs_server -it -p 9804:9804 rdmclin2/server:v1 /bin/bash
```
然后再用docker attach 进入container，手动运行服务。再用ctrl+p+q退出。

设置多个端口
```
	docker run --name ionic  -it -p 35729:35729 -p 8100:8100 rdmclin2/ionic:v2 /bin/bash
```
即使dockerfile中expose了端口，启动的时候还是要指定映射的端口

http://nemoworks.info:9804/apks/fcws_debug.apk

-->
