title: "appium note"
tags:
---


## 检测环境
- appium-doctor --android
> 检测android安装环境

- appium-doctor --ios
> 检测ios安装环境

## 安装
使用npm 安装
```
npm install -g appium
```
注意不能用sudo

## 运行
```
appium &
```
> just only & it means, whatever command/script you entered, all of them will be executed in the background and will act independently from other each other (multi-commands/scripts).

## 执行测试
- [教程](https://github.com/appium/appium/blob/master/docs/cn/writing-running-appium/running-tests.cn.md)

## 开始

## JsonWireProtocol
https://code.google.com/p/selenium/wiki/JsonWireProtocol

## 遇到的问题
- appium 安装不能在sudo模式下，然而直接安装的node用npm装必须要用sudo否则无法安装
>解决的方式是用homebrew装nvm, nvm 装node
