# Java虚拟机

## 调优总结

[总结](<https://www.jianshu.com/p/a2a6a0995fee>)

## Java运行时内存

- 共享
  - 方法区-类加载信息、静态变量、常量
    - 常量池
  - 堆-实例分配
    - 对象头
      - 对象运行在虚拟机时的数据
    - 实例数据
    - 对齐填充
- 非共享
  - 本地方法栈
  - 虚拟机栈-局部变量和方法调用栈
  - 程序计数器-不会溢出

## 垃圾回收

- 标记-清除（低效不使用）
- 标记-复制
  - Eden和survivor比例 8 : 1
- 标记-整理
  - 标记清除，并且规整内存去除碎片
- 分代回收
  - 新生代
    - 标记-复制
  - 老年代
    - 标记-整理
- 安全点，安全区
  - 为了保证GC时对象固定，需要暂停线程
  - GC时对象进入安全点挂起
  - 进入到安全区，引用不回改变，可以直接GC

## 类加载机制

- 步骤
  - 加载
  - 链接
    - 验证
    - 准备
    - 解析
  - 初始化
  - 使用
  - 卸载
- 解析和使用阶段不确定，其他阶段按顺序"开始"（即一个阶段开始不一定等前一阶段完成）
- 类初始化的触发条件（类未初始化）
  1. new关键字
  2. 调用或者设置静态字段，或调用静态方法
  3. 反射
  4. 父类未初始化
  5. main方法类

## 栈贞

- 操作数栈
- 局部变量表
- 动态链接
- 返回地址

## 重载的原理

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
  - Human引用，子类实例

## 重写的原理

- 实例代码

```java
public class Temp {

    static abstract class Human {
        abstract void sayHello();
    }

    static class Man extends Human {

        @Override
        void sayHello() {
            System.out.println("man");
        }
    }

    static class Woman extends Human {

        @Override
        void sayHello() {
            System.out.println("woman");
        }
    }


    public static void main(String[] args) {
        Human man = new Man();
        Human woman = new Woman();
        man.sayHello();
        woman.sayHello();

        man = new Woman();
        man.sayHello();

    }

}
```

- 输出

  ```
  man
  woman
  woman
  ```

- 关键字节码

  ```
   				 0: new           #2                  // class cn/com/java/Temp$Man
           3: dup
           4: invokespecial #3                  // Method cn/com/java/Temp$Man."<init>":()V
           7: astore_1
           8: new           #4                  // class cn/com/java/Temp$Woman
          11: dup
          12: invokespecial #5                  // Method cn/com/java/Temp$Woman."<init>":()V
          15: astore_2
          16: aload_1
          17: invokevirtual #6                  // Method cn/com/java/Temp$Human.sayHello:()V
          20: aload_2
          21: invokevirtual #6                  // Method cn/com/java/Temp$Human.sayHello:()V
          24: new           #4                  // class cn/com/java/Temp$Woman
          27: dup
          28: invokespecial #5                  // Method cn/com/java/Temp$Woman."<init>":()V
          31: astore_1
          32: aload_1
          33: invokevirtual #6                  // Method cn/com/java/Temp$Human.sayHello:()V
          36: return
  ```

- 原理

  - `new` 指令在堆中分配内存，存入操作数栈顶
  - `dup`复制栈顶元素，存入操作数栈顶
  - `invokespecial`调用`init`初始化并把操作数栈顶弹出
  - `astore_N`存入局部变量表
  - `aload_N`压入操作数栈中
  - `invokevirtual`调用会检查栈顶的引用，寻找是否有该方法，所以在该指令调用前，会把引用压入栈顶

## 执行字节码引擎

- 编译成本地代码
- 解释执行
- 使用栈指令集
  - 优点：跨平台，访问内存，不依赖于硬件寄存器
  - 缺点：访问内存（不如访问寄存器快）

## 热点代码

- 方法计数器
- 回边计数器（用于探测流程控制指令）
- 满足JIT要求后，编译的同时继续用解释方式执行，到下次时判断到已拥有已编译的代码使用编译代码