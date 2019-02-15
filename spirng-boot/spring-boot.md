## Spring Boot

### 学习Demo

> https://gitee.com/ityouknow/spring-boot-examples.git

### 静态文件路径加载

- 例如tampelate文件夹下有ws.html ，引用 app.js，src="app.js"
- app.js路径  static/websocket/app.js
- ResquestMapping("websocket")在类上会增加URL
- ws.html读取app.js的话，读出来的是http:localhost:8080/websocket/app.js

### 拦截器匹配规则

> https://blog.csdn.net/rj042/article/details/23278337

### 启动命令参数

> https://juejin.im/entry/5a9fe3356fb9a028bc2d4d9d

### WebConfig的关系

> https://blog.csdn.net/testcs_dn/article/details/80249894