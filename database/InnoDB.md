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

## 行锁

- 行锁是间隙锁，是锁定指向数据区域，第一个索引健之前以及最后一个索引健之后的区域
- 查询无法利用索引，会变为表锁
- 两个会话使用同一索引列但使用不同的值，会触发表锁
- 实际返回的数据不属于该索引的范围，也会触发表锁
- [详解](https://www.cnblogs.com/crazylqy/p/7821481.html)

## 备份

### 参数

- `innodb_data_home_dir`共享表空间
-  `innodb_data_file_path` 具体共享表空间文件大小及目录
- `innodb_log_group_home_dir` 日志目录
- `innodb_file_per_table` 每表一文件

### 备份文件

- 备份`innodb_data_home_dir`和`innodb_data_file_path`目录下的文件和`datadir`下的.frm文件
- 如果设置了`innodb_file_per_table`，还需要备份`datadir`下的.idb



