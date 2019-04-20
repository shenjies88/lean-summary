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
  'age' int unsigned null comment '年龄'
   key 'index_name' ('name','date')
)
```

- 全值匹配

  ```mysql
  select * from test where name = 'sj‘ and date = '2019-04-20';
  ```

- 最左列匹配

  ```mysql
  select * from test where name = 'sj‘;
  ```

- 最左列前缀匹配-不适用于数字

  ```mysql
  select * from test where name like 'abc%';
  ```

  注意不能匹配这种`%abc`

- 最左列范围匹配-不适用于数字

  ```mysql
  select * from test where name between 'sj' and 'cjy'
  ```

- 最左原则

  - 有索引(a,b,c)
  - 适用a
  - 适用a,b
  - 适用a,b,c

- 只访问索引列，即`覆盖索引`

## 前缀索引计算公式

- 前缀比例计算

  ```mysql
  select count(distinct '目标列')/count(*) from '目标表'
  ```

- 计算比例

  ```mysql
  select count(distinct left('目标列'，'前缀个数')/count(*) from '目标表'
  ```

  