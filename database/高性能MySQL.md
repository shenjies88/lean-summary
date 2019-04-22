## 测量工具

- sysbench
- Persona
  - 生成报告 pt-query-digest
  - tcpdump
  - Performance Schema

## 选用适当的数据类型

- 最小范围原则
- 用int 存储 ip地址
- 用int 代替 char
- 用 date 代替 char

## 索引生效的条件

假设有表

```mysql
create table test(
  'id' int unsigned auto_increment comment '主键' primary key,
  'name' varchar(20) null comment '名字',
  'date' date null comment '生日',
  'age' int unsigned null comment '年龄',
  'no_index' varchar(10) null comment '非索引列'
   key 'index_name' ('name','date','age')
)
```

- 全值匹配

  ```mysql
  select no_index from test where name = 'sj‘ and date = '2019-04-20';
  ```

- 最左列匹配

  ```mysql
  select no_index from test where name = 'sj‘;
  ```

- 最左原则

  - 有索引(a,b,c)
  - 适用a
  - 适用a,b
  - 适用a,b,c

- 只访问索引列，即`覆盖索引`

- `order by` 的情况

  - 直接`order by` 又不是`覆盖索引`的话，会触发 `using filesort`
  - `where` 内没有触发索引，会触发 `using filesort`
  - 单索引 `where`字句内没有触发索引，又不是`覆盖索引的`，`order by`子句使用就会触发`using filesort`
  - 联合索引`(a,b) where a order by b` 可行

- `唯一联合索引`需要满足全部条件才会触发

## 前缀索引计算公式

- 前缀比例计算

  ```mysql
  select count(distinct '目标列')/count(*) from '目标表'
  ```

- 计算比例

  ```mysql
  select count(distinct left('目标列'，'前缀个数')/count(*) from '目标表'
  ```


## 聚集索引和非聚集索引

- 聚集索引：主索引和数据以及二级索引存储在叶子节点（主索引最好为顺序索引）
- 非聚集索引：主索引和二级索引都是对标记行的随机值

## 查询优化

- 将一个大的连表查询分解成多个单个的单表查询