## Java

### [继承、封装、多态](https://blog.csdn.net/justloveyou_/article/details/52798666)

### [HashMap和concurrentHashMap](http://www.javastack.cn/article/2018/hashmap-concurrenthashmap-details/)

### [Java泛型原理](https://blog.csdn.net/briblue/article/details/76736356)

### [Java异常](https://blog.csdn.net/zjh_1110120/article/details/81607868)

### Lambda表达式

- 传递一个代码块

- 用于需要实现的接口只有一个方法

- [学习示例](https://juejin.im/post/5abc9ccc6fb9a028d6643eea)

- [闭包](http://www.importnew.com/17905.html)
  - 外围类创建内部类的时候，内部类必定会捕获外围类的一个引用，也就是外围类的this
  - 形成this链之后，要调用前一个this来触发，因为labmda表达式绑定外环境的this，所以在表达式内用this就相当于调了前一个this，而使用匿名内部类需要显示的调外部类的this来触发前一个this。

### Stream

- 可以更好的对集合进行操作

- 对集合操作之后，还能返回封装类的结果

- [API教程](https://www.jianshu.com/p/32fd655cc2c2)

### Optional

- 方便的对结果进行判空
- [使用教程](https://lw900925.github.io/java/java8-optional.html)

### [Java精通](<https://www.zhihu.com/question/28903757/answer/575333243>)

### Java对象占用内存

- 基本类型即数据要求的字节数
- 对象
  - 对象头+实例数据+空白填充
  - 对象内存是8的倍数
  - [实例分析](https://juejin.im/post/5d0fa403f265da1bb67a2335)