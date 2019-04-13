## Java

### 继承、封装、多态

> https://blog.csdn.net/justloveyou_/article/details/52798666

### 文件上传下载

- 文件上传思路
  - 通过MultipartFile 获得InputStream和fileName
  - 如果是传到本地，先在需要存放的路径下创建路径文件夹
  - 如果是传到Minio则先判断bucket是否存在
  - 本地存储，路径名+文件名
  - Minio存储，bucektName + 文件名 + InputStream
  - 输入输出流Buffer进行数据交换
- 文件下载思路
  - 对请求的URL进行处理，获得URI编码处理
  - 对URI进行详细处理获得我们想要的路径
  - 对路径进行检查是否存在文件
  - 存在文件则返回输入流进行数据存储

### HashMap初始化建议

> https://blog.csdn.net/moakun/article/details/80494253

### HashMap和concurrentHashMap

> <http://www.javastack.cn/article/2018/hashmap-concurrenthashmap-details/>

### Java泛型原理

> https://blog.csdn.net/briblue/article/details/76736356

### Java异常

> https://blog.csdn.net/zjh_1110120/article/details/81607868

### Java流复用

> https://blog.csdn.net/qq_25646191/article/details/78856639

### Filter vs Interceptor

> https://www.programering.com/a/MDOxkzMwATk.html

### Minio学习

> https://docs.minio.io/docs/java-client-api-reference

### AIO、NIO的学习

> https://www.jianshu.com/p/b38f8c596193

### Lambda表达式

- 传递一个代码块

- 用于需要实现的接口只有一个方法

- 学习示例

  > https://juejin.im/post/5abc9ccc6fb9a028d6643eea

- 闭包

  > http://www.importnew.com/17905.html

  - 外围类创建内部类的时候，内部类必定会捕获外围类的一个引用，也就是外围类的this
  - 形成this链之后，要调用前一个this来触发，因为labmda表达式绑定外环境的this，所以在表达式内用this就相当于调了前一个this，而使用匿名内部类需要显示的调外部类的this来触发前一个this。

### 方法引用

- 思想是传递一个函数
- 类::静态方法
- 对象::实例方法
- 类::构造方法

### Stream

- 可以更好的对集合进行操作

- 对集合操作之后，还能返回封装类的结果

- API教程

  > https://www.jianshu.com/p/32fd655cc2c2

### Optional

- 方便的对结果进行判空

- 使用教程

  > https://lw900925.github.io/java/java8-optional.html