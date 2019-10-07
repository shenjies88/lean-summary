## Servlet是什么

- 定义了一些规范和接口
- Servlet容器用于处理 web application的一些网络请求和响应

## 多线程问题

- 实现SingleThreadModel接口，容器保证一个service方法在同一个时间点仅被一个请求线程调用（不推荐）
- 维护一个Servlet线程池
- 适当的加入同步机制

## Request

- POST请求中的Body和url参数在一起，有重名的话，在url参数之后
- 本质是在对象的inputStream中，如果已经调用过获取参数的方法，那么是读不到Body的
- 请求路径 = contexPath + servletPath + pathInfo
  - 如果前者能把路径匹配完整，则后续路径为null
  - 如果servletPath = *.jsp，那么匹配.jsp文件时，pathInfo为null
- 生命周期
  - service方法
  - doFilter方法
  - 异步处理

## ServletContext

- 添加过滤器和监听器
- 是Servlet实例运行的环境
- 可以获取上下文属性

## Response

- 可以设置缓冲区
- 返回出去的实体

## 过滤器

- service方法必须和应用到servlet的所有过滤器运行在同一线程

## 转发请求

- 服务端转发