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

