## 常用命令

### 系统

- `man`查看文档
- `echo`终端输出字符串
- `date`终端输出时间
- `reboot`重启
- `poweroff`关机
- `wget`下载
- `ps`查看进程状态
- `top`监视系统状态
- `kill`终止进程
- `ifconfig`查看网卡和网络状态
- `uptime`查看系统启动时间和负载情况
- `free`查看内存使用情况
- `history`查看历史命令

### 目录

- `pwd`查看当前目录
- `cd`切换工作路径
- `ls`用于显示当前的目录信息
- `touch`创建文件及修改时间
- `mkdir`创建目录
- `cp`复制
- `mv`剪切或重命名
- `rm`删除
- `file`查看文件类型

### 文本编辑

- `cat`查看文件内容
- `more`分页查看
- `head`用于查看前n行
- `tail`用于查看后n行
- `tr`用于替换文本中的字符
- `stat`文件状态
- `diff`查看两个文件的不同

### 打包压缩与搜索

- `tar`解压和压缩
- `grep`关键词搜索
- `find`查找文件

## 管道、重定向、环境变量

- 管道将前一个命令的输出作为后一个命令的输入
- 输入输出重定向
- `export`提升全局环境变量

## Shell

### shell语言特性

- 解释性语言

### 脚本无法改变环境变量

- 因为shell脚本在执行命令时是通过`fork()`系统调用创建子进程去执行
- 子进程无法改变父进程的环境变量
- 如果不希望脚本创建子进程，可以使用 `source`命令+可执行文件

### if

#### 单条件判断

```shell
#!/bin/bash
DIR="/media/cdrom"
if [ ! -e $DIR ]
then
mkdir -p $DIR fi
```



#### 分支判断

```shell
#!/bin/bash
ping -c 3 -i 0.2 -W 3 $1 &> /dev/null $? -eq 0 ]
if [
then
echo "Host $1 is On-line."
else
echo "Host $1 is Off-line."
fi
```



#### 多分支判断

```shell
#!/bin/bash
read -p "Enter your score (0-100): " GRADE
if [ $GRADE -ge 85 ] && [ $GRADE -le 100 ] ; then
echo "$GRADE is Excellent"
elif [ $GRADE -ge 70 ] && [ $GRADE -le 84 ] ; then
echo "GRADE is Pass"
else
echo "$GRADE is Fail"
fi
```

## sed

### 编辑文本流

- 不会修改原文件，如需修改 > 重定向
- `-e` 根据表达式操作
- `-n` 显示操作的行
- `-f` 执行脚本

### 实例

```shell
  sed -n -e '1，5d' file
```

- 删除文件的第一到第五行，并且把删除的行显示出来

```shell
sed -n -e '/正则/p' file
```

- 打印和`正则表达式`匹配的行

```shell
sed -e 's/aaa/bbb/g' file
```

- 把文件中的`aaa`替换成`bbb` `/g`表示全局替换

```shell
sed -e '/BEGIN/,/END/p' file
```

- 打印正则`BEGIN`到`END`范围的文本，匹配了`BEGIN`但是没有匹配`END`一样会输出，但是没有匹配`BEGIN`则不会输出

## awk

### 过滤输出

- 不会修改原文件
- `-F`重设分隔符，默认是`空格`，可以设置为`正则`
- `-f`执行脚本

### 实例

```shell
awk '{print $1 $3}' file
```

- 打印文件的第一列和第三列

```shell
awk -F":" '{print $1 $3}' file
```

- 以-F标记的分隔符，打印第一列和第三列

```shell
awk '{print " user : "$1" name : "$2"  "}'
```

- 想在输入时插入一些东西需要用`""`扩起来，变量也需要用`""`扩起来

```bash
BEGIN {
    print "How many people with nologin"
}
/nologin/ {adder++}
END {
    print "'nologin' appears " adder " times "
}
```

```shell
awk -f count.awk file
```

- 使用脚本，对该文件里面的`nologin`进行计数，`//`内填写正则表达式，后续的`{}`内填写逻辑

```shell
awk -F":" '/正则/{print $0}'
```

- 根据`正则`输出行

```shell
awk 'BEGIN{print ENVIRON["HOME"];print ENVIRON["PATH"]}'
```

- 打印环境变量

```shell
awk '{print "3+2=" 3+2}'
```

- 计算

- 判断和循环类似于`C语言`不提供实例

- 内置变量
  - FS 以什么样的字符来区分一个字段
  - RS 以什么样的字符来区分一个记录
  - OFS 字段之间插入的字符
  - ORS 记录之间插入的字符
  - NR已经读出的记录
  - FNR当前记录数
  - NF当前处理记录的字段数