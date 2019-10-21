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

### 理论

- 解释性语言

- 因为shell脚本在执行命令时是通过`fork()`系统调用创建子进程去执行
- 子进程无法改变父进程的环境变量
- 如果不希望脚本创建子进程，可以使用 `source`命令+可执行文件

### 实践

```shell
#!/bin/bash
echo "当前脚本名称为$0"
echo "总共有$#个参数，分别是$*。"
echo "第 1 个参数为$1，第 5 个为$5。"
```



if

单条件判断

```shell
#!/bin/bash
DIR="/media/cdrom"
if [ ! -e $DIR ]
then
mkdir -p $DIR fi
```



分支判断

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



多分支判断

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



for循环

```shell
#!/bin/bash
HLIST=$(cat ~/ipadds.txt)
for IP in $HLIST
do
ping -c 3 -i 0.2 -W 3 $IP &> /dev/null 
if [ $? -eq 0 ] ; then
echo "Host $IP is On-line." 
else
echo "Host $IP is Off-line." 
fi
done
```



while

```shell
#!/bin/bash
PRICE=`expr $RANDOM % 1000`
TIMES=0
echo "商品价格在0-999之间，猜猜看是多少?"
while true
do
read -p "输入价格: " INT
let TIMES++
if [ $INT -eq $PRICE ] ; then
echo "答对了, 实际价格是 $PRICE"
echo "总共猜了 $TIMES 次"
exit 0
elif [ $INT -gt $PRICE ] ; then
echo "太高了!"
else
echo "太低了!"
fi
done
```

case

```shell
#!/bin/bash
read -p "请输入一个字符，并按 Enter 键确认:" KEY 
case "$KEY" in
[a-z]|[A-Z])
echo "您输入的是 字母。"
;;
[0-9])
echo "您输入的是 数字。"
;;
*)
echo "您输入的是 空格、功能键或其他控制字符。" 
esac
```



sed

编辑文本流

- 不会修改原文件，如需修改 > 重定向
- `-e` 根据表达式操作
- `-n` 显示操作的行
- `-f` 执行脚本

实例

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

awk

过滤输出

- 不会修改原文件
- `-F`重设分隔符，默认是`空格`，可以设置为`正则`
- `-f`执行脚本

实例

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

## 定时任务

- `at`一次性计划

- `crond`周期性计划
  - `分`，`时`，`日`，`月`，`星期`
  - 同一值用`,`分隔
  - 同一值用`-`表示连续
  - `*/2`每2执行一次
  - `分`必须有值
  - `日`和`星期`不能同时使用
  
  ## 用户身份与文件权限
  

用户身份

- `useradd`新增用户

- `groupadd`新增组

- `usermod`修改用户信息

- `passwd`修改密码

- `userdel`删除用户

## 文件权限

- rwxrwxrwx

  - 文件所有者读写执行，文件所属组读写执行，其他用户读写执行

- 目录的权限

  - 读目录下的文件列表
  - 写能够新增、删除、重命名
  - 执行能够进入该目录

隐藏权限

- `chattr`改变隐藏权限
- `lsattr`显示隐藏权限

切换用户与sudo服务

- `su`切换用户
- `su - username`会完全切换用户包括环境变量
- `sudo`赋予用户权限
- `visudo`编辑权限列表
- 谁可以使用 允许使用的主机=（以谁的身份） 可执行命令的列表

## 存储

物理设备命名

- /dev/sda5
- dev设备文件
- sd存储设备
- a第一个被识别到的设备
- 5编号为5的分区

硬盘使用

- `fdis`分区
  - `/etc/fstab`分区配置文件
- `mkfs`格式化
  - `mkswap`交换分区格式化
- `mount`挂载
  - `swapon `交换分区挂载

磁盘容量配额

- `xsf_quota`
- `edquota`

软硬链接

- 硬链接
  - 对原文件的指针，原文件删除依然可以访问，不可跨分区

- 软连接
  - 可以跨分区，只是单纯的路径关联，原文件删除无效

## 磁盘冗余

RAID0

- 磁盘不冗余存储，提升吞吐量

RAID1

- 磁盘冗余存储，减少吞吐量

RAID10

- 0 1的组合

创建冗余阵列

- `mdadm`管理冗余阵列

逻辑卷管理

- `pvcreate`创建物理卷
- `vgcreate`创建卷组
- `lvcreate`创建逻辑卷
- 格式化
- 挂载
- 写入配置文件

删除逻辑卷

- 卸载挂载点
- 删除配置文件
- 删除逻辑设备
- 删除卷组
- 删除物理卷设备

## 防火墙

配置工具

- `iptables`
  - 驱动`netfilter`
- `firewalld`
  - 驱动`nftables`

规则链

- `PREROUTING`进行路由选择前处理数据包
- `INPUT`处理流入的数据包
- `OUTPUT`处理流出的数据包
- `FORWARD`处理转发的数据包
- `POSTROUTING`在进行路由选择后处理数据包

动作处理

- `ACCEPT`允许流量通过
- `REJECT`拒绝流量通过（拒绝并响应）
- `LOG`记录日志信息
- `DROP`拒绝流量通过（拒绝并不响应）

保存防火墙配置

```sh
service iptables save
```

TCP Wrappers 用于控制服务是否可以访问

## SSH

配置网络服务

- `nmtui`配置网卡

创建网络会话切换不同的服务

安全密钥验证

- `ssh-keygen`客户端生成密钥对
- `ssh-copy-id 目标主机ip`传送公钥至远程服务端

远程传输命令

- `scp [参数] 本地文件 远程账户@远程ip:远程路径`本地传送至远程
- `scp [参数] 远程账户@远程ip:远程路径 本地文件` 远程传送至本地