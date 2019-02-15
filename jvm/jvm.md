## Java虚拟机

### How JVM Works

> https://www.geeksforgeeks.org/jvm-works-jvm-architecture/

- 加载系统
  - 加载-编译出的字节码带有类的信息，所以可以使用反射机制
    - 加载该类及其父类的完全限定名
    - .class文件相关联的类、接口、枚举
    - 修饰符、变量、方法等信息
  - 链接
    - 验证字节码是否符合JVM标准
    - 准备分配内存
    - 解析在方法区定位引用实体
  - 初始化-静态变量和静态代码块根据代码定义进行初始化
    - *Bootstrap class loader*：加载Java核心API  *JAVA_HOME/jre/lib* 直接路径，实现C++、C的本地方法
    - *Extension class loader：上类的子类，加载扩展目录*JAVA_HOME/jre/lib/ext*，实现于*sun.misc.Launcher$ExtClassLoader* class
    - *Application class loader*：上类的子类，负责从应用程序路径加载Class

### 虚拟机运行时的数据区

- 程序计数器：选取工作的字节码
- Java虚拟机栈：线程栈
- 本地方法栈： 和Java虚拟机栈类似
- Java堆：存放实例
- 方法区： 存放加载类的信息

### 分配内存的两种方式

- 常量池中是否有类的信息，没有则先加载
- 指针碰撞：由一个指针对‘‘空余‘’和“占有“进行分界，如果分配了内存，就把空余的部分缩小一些
- 空闲列表：维护一个列表，记录‘’‘空余‘’和“占有”的空间
- 虚拟机将分配到的内存空间都初始化为0值，所以对象的成员初始化为0

### 垃圾回收详解

> https://www.jianshu.com/p/2e36bbf15b80

### Class文件的字节码结构

> https://blog.csdn.net/ns_code/article/details/17675609

### 虚拟机类加载机制

- 类的生命周期 加载->验证->准备->解析->初始化->使用->卸载（类加载的过程）
  - 验证->准备->解析 属于连接阶段  解析的行为不一定按部就班的进行
  - 何时进行初始化（主动引用）
    1. 实例化对象时、读取或设计一个类的静态字段时（被final表示已经在编译器把值放入常量池，不算）、调用类的静态方法时
    2. 对类进行反射调用时，该类未初始化
    3. 初始化一个类时，如果该类的父类未进行初始化，先对父类进行初始化
    4. 虚拟机启东时间，含main方法的类，会初始化该类
    5. JDK1.7，如果一个java.lang.invoke.MethodHandle实例最后的解析结果是REF_getStatic、REF_putStatic、REF_invokeStatic的方法句柄，并且这个方法句柄所对应的类没有进行过初始化，则需要先触发其初始化
  - 加载
    1. 根据类的全限定名获的该类的二进制字节流
    2. 字节流代表的静态存储结构转化为方法区运行时的数据结构
    3. 在内存中生成一个代表这个类的java.lang.Class对象，作为方法区这个类的各种数据的访问入口
  - 验证
    1. 字节流是否符合class文件规范
    2. 元数据语意是否符合Java语言规范
    3. 代码意图不会对虚拟机造成伤害
    4. 验证符号引用，通过全限定名找到类，符合方法和字段的描述
  - 准备
    - 类分配内存和类变量设置初值（非常量并不赋值）
  - 解析
  - 初始化

### 重载的原理

- 示例代码

  ```java
  public class StaticDispatch {
      
      static abstract class Human {}
      
      static class Man extends Human {}
      
      static class Woman extends Human {}
      
      public void sayHello (Human guy) {
          System.out.println("hello,guy!");
      }
      
      public void sayHello (Man guy) {
          System.out.println("hello,Man!");
      }
      
      public void sayHello (Woman guy) {
          System.out.println("hello,Woman!");
      }
      
      public static void main(String[] args) {
          Human man = new Man();
          Human woman = new Woman();
          StaticDispatch sr = new StaticDispatch();
          sr.sayHello(man);
          sr.sayHello(woman)
      }
  }
  ```

- 运行结果

```
hello,guy!
hello,guy!
```

- 原理
  - 我们把`Human`称为变量的静态类型， `Man`称为变量的实际类型，静态类型的变化在编译期可知，实际类型的变化为运行期可知
  - 重载是通过方法的参数`静态类型`和`参数数量`在编译期决定使用那个重载方法，把该方法的符号引用写到`invokevirtual`字节码指令中

