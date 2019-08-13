

## 基础

### [异常](https://blog.csdn.net/zjh_1110120/article/details/81607868)

## 高级

### [继承、封装、多态](https://blog.csdn.net/justloveyou_/article/details/52798666)

### [闭包](http://www.importnew.com/17905.html)

- 外围类创建内部类的时候，内部类必定会捕获外围类的一个引用，也就是外围类的this
- 形成this链之后，要调用前一个this来触发，因为labmda表达式绑定外环境的this，所以在表达式内用this就相当于调了前一个this，而使用匿名内部类需要显示的调外部类的this来触发前一个this

### Java对象占用内存

- 基本类型即数据要求的字节数
- 对象
  - 对象头+实例数据+空白填充
  - 对象内存是8的倍数
  - [实例分析](https://juejin.im/post/5d0fa403f265da1bb67a2335)

### equals和hashCode分析

- 覆盖equals时要覆盖hashCode
- 自反性。对于任何非null的引用值x，x.equals(x)应返回true
  - 示例：List.contains
- 对称性。对于任何非null的引用值x与y，当且仅当：y.equals(x)返回true时，x.equals(y)才返回true
  - 示例：自定义类重写了equals方法，但JDK内的类的equals方法无法判断和自定义类相等
- 传递性。对于任何非null的引用值x、y与z，如果y.equals(x)返回true，y.equals(z)返回true，那么x.equals(z)也应返回true
  - 继承父类扩展属性时，兼容对称性
  - 组合优于继承，将父类作为成员传入
- 一致性。对于任何非null的引用值x与y，假设对象上equals比较中的信息没有被修改，则多次调用x.equals(y)始终返回true或者始终返回false
  - 没必要判断null
  - 直接判断instanceof即可
- 对于任何非空引用值x，x.equal(null)应返回false

### 类加载器

- 双亲委派原则，子类 传递给父类加载文件，父类无法加载则子类加载
- 启动加载器由C++编写，加载Java核心库，无父类
- 扩展加载器由Java编写，加载扩展库，父类启动加载器
- 应用加载器由Java编写，父类位扩展加载器
- 开放出的接口的实现类加载，由线程上下文加载器加载

## 集合

### [HashMap和concurrentHashMap解析](http://www.javastack.cn/article/2018/hashmap-concurrenthashmap-details/)

### HashMap工作流程

- Put
  - 判断ke y是否存在
    - 存在判断旧值
    - 不存在插入新元素
  - 判断容量和table下标元素是否为null
    - 达到阀值并且下表元素不为空，则进行扩容，是原来的两倍，并且移动元素，重新计算阀值
    - 移动元素，遍历table中每个位置的链表，重新hash，在新table中找到位置

### ArrayList

- 如果没有初始化容量，采用多是懒加载机制，add时才会扩容
- 内置modCount成员，用于检测并发异常
- 扩容为1.5倍

### LinkedLIst

- 实际大小之受内存大小影响
- 使用双向链表
- 不存在扩容问题

### 

## JKD特性

### [泛型原理](https://blog.csdn.net/briblue/article/details/76736356)

### Stream

- 可以更好的对集合进行操作
- 对集合操作之后，还能返回封装类的结果
- [API教程](https://www.jianshu.com/p/32fd655cc2c2)

### Optional

- 方便的对结果进行判空
- [使用教程](https://lw900925.github.io/java/java8-optional.html)

## 知识库

### [Java精通](<https://www.zhihu.com/question/28903757/answer/575333243>)

