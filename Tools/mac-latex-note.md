title: "Mac中nju-thesis latex模板食用指南"
tags:
---

> Nju-thesis 是南京大学学位论文XeLaTeX模板，由本校优秀博士胡海星制作分享，该模板严格遵循南京大学学术委员会对学位论文的排版格式要求以及相应的国家标准规范，可帮助南京大学的同学们方便地排版出漂亮的学位论文。目前该模板支持排版博士、硕士和学士的学位论文。虽然该模板主要用于排版南京大学的学位论文，但亦可经过简单的设置或修改用于排版国内其他大学的学位论文。


# 安装Texlive2015
<http://tug.org/mactex/morepackages.html>
如果你用basic版本参考[这篇教程](http://www.readern.com/sublime-text-latex-chinese-under-mac.html)进行设置即可，注意里面的`subprocess.Popen([‘open’] + [pdffile])`用的单引号有问题,注意替换。不过basic版本中很多宏包不存在之后还是会有问题，需要自己安装宏包。所以初学者还是建议安装完全版。

# 设置环境变量
在.zshrc中添加环境变量如下:
```
LATEX_HOME=/usr/local/texlive/2015/bin/x86_64-darwin
PATH=$PATH:$LATEX_HOME
```

# 下载配置 Nju-thesis
[github地址](https://github.com/Haixing-Hu/nju-thesis)，下载完成后需要一定的配置才能编译成功,在该文件目录下修改`sample.tex`文件，将第一行的代码进行如下修改:

```
\documentclass[macfonts,master]{njuthesis}
```
添加macfonts代表使用mac下的字体，在其他系统下请参照手册fonts相关部分，master代表生成硕士论文,相应的也可以设置其他的如`phd/master/bachelor 选择博士/硕士/学士论文`
然后
```
$ make clean
$ make sample 
```
即可成功编译该文档


# 模板基本使用
## 注意点
特殊字符如$,_等需要转义

## 标题组织
```
\chapter{引言}\label{chapter_introduction}   # 章 
\section{项目背景}  # 节
\subsection{IaaS云中心}  # 子小节
```

# 代码
使用listings宏包，在文档前添加宏包,fontspec 选字体,Menlo是Mac下的一种字体格式，可以不添加这两个包

```
\usepackage{listings}

\usepackage{fontspec}

\newfontfamily\menlo{Menlo}
```

如果要设置代码格式（要定制化可以google）,在`\begin{document}`前添加

```
  \lstset{ %
  backgroundcolor=\color{white},   % choose the background color
  basicstyle=\small\menlo,  % size of fonts used for the code
  columns=fullflexible,
  breaklines=true,                 % automatic line breaking only at whitespace
  captionpos=b,                    % sets the caption-position to bottom
  tabsize=4,
  escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
  keywordstyle=\color{blue},       % keyword style
  frame=single,
  rulesepcolor=\color{red!20!green!20!blue!20},
  % identifierstyle=\color{red},
  language=JavaScript,
  numberstyle=\tiny\menlo
}
```

然后通过以下代码的格式进行调用

```
\begin{lstlisting}[language=JavaScript]
var http = require('http');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
}).listen(1337, "127.0.0.1");

console.log('Server running at http://127.0.0.1:1337/');
\end{lstlisting}
```

如果listings中没有你想要得代码格式（例如我想用Javascript）,你可以在listings的包中进行设置,以texlive2015为例,路径为`/usr/local/texlive/2015/texmf-dist/tex/latex/listings`中修改`listlang1.sty`文件，添加如下代码

```
\lst@definelanguage{JavaScript}%
  {morekeywords={typeof,new,true,false,catch,function,return,null,catch,switch,var,if,in,while,do,else,case,break},%
  morecomment=[l]//,%
  morecomment=[s]{/*}{*/},%
  morestring=[b]",%
  morestring=[b]',%
  }[keywords,comments,strings]%
```

##参考文献 

### 列表枚举
```
\begin{enumerate}
\item 分类号  在左上角注明分类号，便于信息交换和处理。一般应注明《中国图书资
  料分类法》的类号，同时应注明《国际十进分类法UDC》的类号；
\item 密级  在右上角注明密级；
\item “博士学位论文”用大号字标明；
\item 题名和副题名   用大号字标明；
\item 作者姓名；
\item 学科专业名称；
\item 研究方向；
\item 导师姓名，职称；
\item 日期包括论文提交日期和答辩日期；
\item 学位授予单位。
\end{enumerate}
```

### 引用
例如
```
\cite{baike1}
```

### 书籍
```
@book{book1,
  title={Google Android 开发入门与实战},
  author={靳岩,姚尚朗},
  year={2009},
  publisher={人民邮电出版社},
  address={北京},
}
```
### 网页
```
@webpage{baike1,
  title = {{hybrid app}},
  author = {{百度百科贡献者}},
  publisher = {百度百科},
  year = {2015},
  url = {http://baike.baidu.com/link?url=D2o0b8jhdREb7o4cysYKmU-oH9BZVTWAp1LxI9-zK_CNly3A7RQgEPIF-ptnGpdjrgvUVz_HE1UOscnSsdNbFa},
  modifydate = {2015/09/23},
  citedate = {2015/10/21}
}
```

## 插图
```
\begin{figure}[htbp]
  \centering
  \includegraphics[width= 0.5\textwidth]{njuname.eps}\\
  \caption{测试插图}\label{fig:test1}
\end{figure}
```
引用插图
```
图\ref{fig:test1}所示为传统IaaS云中心网络结构的一部分。
```

## 表格 
```
\begin{table}
  \centering
  \begin{tabular}{cccp{38mm}}
    \toprule
    \textbf{文档域类型} & \textbf{Java类型} & \textbf{宽度(字节)} & \textbf{说明} \\
    \midrule
    BOOLEAN  & boolean &  1  & \\
    CHAR     & char    &  2  & UTF-16字符 \\
    BYTE     & byte    &  1  & 有符号8位整数 \\
    SHORT    & short   &  2  & 有符号16位整数 \\
    INT      & int     &  4  & 有符号32位整数 \\
    LONG     & long    &  8  & 有符号64位整数 \\
    STRING   & String  &  字符串长度  & 以UTF-8编码存储 \\
    DATE     & java.util.Date & 8 & 距离GMT时间1970年1月1日0点0分0秒的毫秒数 \\
    BYTE\_ARRAY & byte$[]$ & 数组长度 & 用于存储二进制值 \\
    BIG\_INTEGER & java.math.BigInteger & 和具体值有关 & 任意精度的长整数 \\
    BIG\_DECIMAL & java.math.BigDecimal & 和具体值有关 & 任意精度的十进制实数 \\
    \bottomrule
  \end{tabular}
  \caption{测试表格}\label{table:test2}
\end{table}
```

## 定义
```
\begin{definition}[节点之间的距离]
网络中两个节点$i$和$j$之间的距离(distance)$d_{ij}$定义为连接这两个节点
的最短路径上的边数。
\end{definition}
```

## 等式 
```
\begin{equation}\label{eq:dimension}
    D = \max_{i,j} d_{ij}
\end{equation}
```

# png/jpg -> eps 在线转换工具
论文中使用图片需要使用eps格式的图片，不过我们的图片格式一般是jpg/png格式的，转换格式有多重方式，推荐在线转换工具:
<http://www.tlhiv.org/cgi-bin/rast2vec/index.cgi>



# 其他latex模板
[Ieee模板](http://www.ieee.org/conferences_events/conferences/publishing/templates.html)

# 参考文献 
- [知乎](http://www.zhihu.com/question/30957600)
- [LaTeX技巧32：LaTeX程序代码排版，Listings宏包](http://blog.sina.com.cn/s/blog_5e16f1770100fw83.html)
- 