## 变量类型

### 基本

- Undefined
- Null
- Boolean
- Number
- String

### 复杂

- Object

## 局部变量和全局变量

### 函数内局部变量

```javascript
function f() {
  var a = 1;
  //let a = 1; 建议
}
```

### 函数内全局变量

```javascript
function f() {
  a = 1;//不建议
}
```

### 推荐

- `let`关键字标识块级变量，推荐在函数内使用

## 创建对象

每个函数内有一个prototype属性指针，该属性实例共享

### 工厂模式

- 缺点：每创建一个对象里的函数都会创建新对象，并且无法识别对象类型

```javascript
function c(name,age) {
  var o = new Object();
  o.name = name;
  o.age = age;
  o.sayName = function() {
    alert(this.name);
  };
  return o;
}

var person = c();
```

### 构造函数模式

- 缺点：每创建一个对象里的函数都会创建新对象，可以识别对象

```javascript
function Person(name,age) {
  this.name = name;
  this.age = age;
  this.sayName = function() {
    alert(this.name);
  };
}

var person = new Person();
```

### 组合原型模式和构造函数模式-推荐

- 用原型属性解决重复创建方法对象的问题

```javascript
function Person(name,age) {
  this.name = name;
  this.age = age;
}

Person.prototype = {
  constructor : Person,
  sayName : function() {
			alert(this.name);
	}
}
```

### 动态原型模式-推荐

- 同上，并且延迟加载

```javascript
function Person(name,age) {
  this.name = name;
  this.age = age;
  
  if(typeof this.sayName != 'function') {
    Person.prototype.sayName = function() {
      	alert(this.name);
    };
  }
}
```

### [稳妥构造函数模式-静态变量](https://blog.csdn.net/maomaolaoshi/article/details/73928094)

## 继承

### 组合继承-推荐

- 原型属性继承方法
- 借用构造函数继承属性，保证引用属性独立
- 缺点，调用两次父类构造函数

```javascript
function SuperType(name) {
  this.name = name;
  this.colors = ['red','blue','green'];
}

SuperType.prototype.sayName = function() {
  alert(this.name);
};

function SubType(name,age) {
  SuperType.call(this,name);
  this.age = age;
}

SubType.prototype = new SuperType();
SubType.prototype.constructor = SubType;
SubType.prototype.sayAage = function() {
  	alert(this.age);
};
```

### 寄生组合式继承

- 避免调用两次父类构造函数
- 实际还是要new 一个对象

```javascript
function object(o) {
  function F() {
    F.prototype = o;
    return new F();
  }
}

function inheritPrototype(subType, superType) {
  var prototype = object(subType.prototype);
  prototype.constructor = subType;
  subType.prototype = prototype;
}

function SuperType(name) {
  this.name = name;
  this.colors = ['red','blue','green'];
}

SuperType.prototype.sayName = function() {
  alert(this.name);
};

function SubType(name,age) {
  SuperType.call(this,name);
  
  this.age = age;
}

inheritPrototype(SubType,SuperType);

SubType.prototype.sayAge = function() {
  alert(this.age);
};
```

## 函数表达式