## Docker

### 常用命令

- **获取镜像**

  docker pull 镜像名:tag

- **列出镜像**

  docker image ls

- **删除本地镜像**

  docker image rm ID号

- **commit 生成镜像**

  docker commit 容器名 新镜像名

- **运行镜像**

  docker run --name 容器名 选项 镜像名

- **构建镜像**

  docker build -t 镜像名:tag 上下文路径

- [数据卷操作](https://blog.51cto.com/sf1314/1977831)

- [容器操作](https://yeasy.gitbooks.io/docker_practice/container/)
### Dockerfile指令

- **FROM 基础镜像来源**

  FROM 镜像名

- **RUN 构建时执行命令**

  RUN 命令 参数

- **COPY 复制文件**

  COPY  `构建上下文`需要复制的文件路径或文件夹路径  `镜像内`目标文件夹路径

- [ADD更高级的复制文件](https://yeasy.gitbooks.io/docker_practice/image/dockerfile/add.html)

- [CMD启动时的命令](https://yeasy.gitbooks.io/docker_practice/image/dockerfile/cmd.html)


- [ENTRYPOINT CMD命令作为参数可以在后面拼接](https://yeasy.gitbooks.io/docker_practice/image/dockerfile/entrypoint.html)

- **ENV设置环境变量** 

  ENV key value

- **VOLUME 定义匿名卷**

  VOLUME 路径

- ##### **EXPOSE声明端口 只会声明 并不会映射**

  EXPOSE 端口 

  如在docker run -P 不指定端口，会随机映射 EXPOSE的端口

- **WORKDIR指定工作目录**

  WORKDIR 工作目录

- [HEALTHCHECK健康检查](https://yeasy.gitbooks.io/docker_practice/image/dockerfile/healthcheck.html)

### 