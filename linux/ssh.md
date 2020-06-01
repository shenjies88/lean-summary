## 命令

```shell
ssh -p 端口 目标机用户名@目标机host
```

## 生成密钥

```sh
ssh-keygen
```

- ~/.ssh/id_rsa 私钥
- ~/.ssh/id_rsa.pub 公钥匙

## 传送公钥匙至目标主机

```sh
ssh-copy-id -i ~/.ssh/id_rsa.pub <远程机器的用户名>@<远程机器的ip>
```

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
