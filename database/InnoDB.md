## 组织结构

- 多线程工作
- 有缓冲池

## InnoDB引擎特性

- 插入缓冲
  - 为非聚集索引提高效率
- 两次写
  - 写入数据保证
- 自适应哈希索引
  - 对相同模式的所以索引访问，建立Hash表加快速度
- 异步IO
  - 提高IO效率
- 刷新邻接页
  - 刷新临近的脏页

## 后台线程

- Master Thread
  - 保证数据同步
  - 1秒1循环
  - 10秒1循环
  - background循环

- IO Thread
  - 负责`AIO`的回调处理

- Purge Thread
  - 回收分配的`undo`页

- Page Cleaner Thread
  - 脏页刷新操作

- LRU 列表
  - 最近最少使用的页

- Free列表
  - 空闲列表
- Flush列表
  - 刷新脏页列表

## 文件

- 错误日志
- 二进制日志
- 慢查询日志
- 查询日志

## [索引原理](<https://blog.csdn.net/tongdanping/article/details/79878302>)

## 索引 order by

- https://www.cnblogs.com/wangxusummer/p/5329813.html
- <https://www.cnblogs.com/morewindows0/p/9225638.html>

## [隔离级别](<http://blog.chinaunix.net/uid-14010457-id-3956842.html>)

## [SQL优化](<https://zhuanlan.zhihu.com/p/48385127>)

## [MySQL原理](<https://dbaplus.cn/news-155-1531-1.html>)

## [Explain详解](https://www.cnblogs.com/gomysql/p/3720123.html)

