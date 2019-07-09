## Servlet是什么

- 定义了一些规范和接口
- Servlet容器用于处理 web application的一些网络请求和响应

## 多线程问题

- 实现SingleThreadModel接口，容器保证一个service方法在同一个时间点仅被一个请求线程调用（不推荐）
- 维护一个Servlet线程池

## Request

- POST请求中的Body和url参数在一起，有重名的话，在url参数之后
- 本质是在对象的inputStream中，如果已经调用过获取参数的方法，那么是读不到Body的

## ServletContext

- 添加过滤器和监听器
- 是Servlet实例运行的环境
- 可以获取上下文属性

## Response

