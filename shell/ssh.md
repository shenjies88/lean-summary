## 命令

```shell
ssh -p 端口 目标机用户名@目标机host
```

## 生成密钥

```shell
ssh-keygen
```

- ~/.ssh/id_rsa 私钥
- ~/.ssh/id_rsa.pub 公钥匙

## 传送密钥至目标主机

```shell
scp -p ~/.ssh/id_rsa.pub 目标机用户名@<目标机host>:目标主机存储的路径
```

- 将该密钥拼接至authorized_keys后面
- cat id_rsa.pub >> authorized_keys
- 即可免密登陆

## 配置文件

- ~/.ssh/config
- 配置样例

```shell
Host 别名
HostName 目标机host
User 目标机用户名
IdentityFile ~/.ssh/id_rsa
```

```shell
ssh 别名
```

- 即可马上登陆