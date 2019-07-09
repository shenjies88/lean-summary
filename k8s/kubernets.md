## 常用命令

### 集群信息

```sh
kubectl cluster-info
```

### 工作节点信息

```sh
kubectl get nodes
```

### 部署应用

```sh
kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080x
```

### 获取部署信息

```sh
kubectl get deployments
```

### 获取pod信息

一个pod是多个容器的集合

一般一个pod一个容器

```sh
kubectl get pod
```

### 暴露应用到外部

```sh
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
```

### 标签

可以根据应用到标签查看pods

#### 新标签

```sh
kubectl label pod $POD_NAME $NEW_LABEL
```

### 扩容

```sh
kubectl scale deployments/$部署名 --replicas=4
```

### 滚动升级

```sh
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2
```

### 滚动升级状态

```sh
kubectl rollout status deployments/kubernetes-bootcamp
```

### 回滚

```sh
kubectl rollout undo deployments/kubernetes-bootcamp
```

## 基本概念

### Cluster

- 整个应用的名称，是计算、存储、网络资源的集合

### Node

- 实际工作运行的节点
- kubelet节点代理和外部通信
- kube-proxy负责和service的交互

### deployment

- 部署的应用
- 负责管理ReplicaSet

### ReplicaSet

- 副本集
- 负责管理pod

### Pod

- 最小的调度单位，容器的集合
- 一般一个容器一个pod

### Service

- 对外的服务
- 访问一组pod的方式

## YAML配置文件

```yaml
apiVersion: extensions/v1
kind: Deployment
metadata:
	name: nginx-deployment #必须
spec:
 	replicas: 2
 	template:
 		metadata:
 				labels: #必须
 						app: web_server
 		spec:
 				parallelism: #Job并行执行
 				hostNetwork: true #是否使用本机网络
 				containers:
 						name: nginx #必须
 						image:	nginx:1.7.9 #必须
 						command: #容器启动命令
 						volumeMounts: #定义容器内的卷积目录
 				nodeSelector: #根据节点的label选择
 						disktype: ssd 
 				volumes: #宿主机的卷积目录
```

## Volume卷积

### emptyDir

- 最基础的Volume类型，生命周期与Pod一致
- Pod则Volume消亡
- 容器消亡Pod未消亡，Volume不消亡

### hostPath

- Pod消亡，Volume还存在
- Host崩溃，hostPath也消亡

### Storage Provider