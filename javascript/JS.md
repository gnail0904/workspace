# Call，Apply，Bind

**call和apply改变函数内部的this指向，**

**call和apply类似，参数上的却别，call是多个参数，apply是数组**

**bind给函数绑定this的指向**

```javascript
func.call(thisObj, args1, args2, ...)
1, func is a function that needs to be invoked with a different this object
2, thisObj is an object or a value that needs to be replaced with the this keyword present inside the function func
3, args1, args2 are arguments that are passed to the invoking function with the changed this object.
```



```javascript
function Car(type, fuelType){
	this.type = type;
	this.fuelType = fuelType;
}

function setBrand(brand){
	Car.call(this, "convertible", "petrol");
	this.brand = brand;
	console.log(`Car details = `, this);
}

function definePrice(price){
	Car.call(this, "convertible", "diesel");
	this.price = price;
	console.log(`Car details = `, this);
}

const newBrand = new setBrand('Brand1');
const newCarPrice = new definePrice(100000);
```

![image-20230806223726344](JS.assets/image-20230806223726344.png)



# 箭头函数

箭头函数在涉及this绑定时的行为和普通函数的行为完全不一致，它放弃了所有普通this绑定的规则，取而代之的是**用当前的词法作用域覆盖了this本来的值**



# This

1. 为什么使用this

   随着你的使用模式越来越复杂，显示传递上下文对象会让代码变得越来越混乱，使用this则不会这样，**当我们介绍对象和原型时，你就会明白函数可以自动引用合适的上下文对象 有多重要**、

   **每当你想要把 this 和词法作用域的查找混合使用时，一定要提醒自己，这是无法实现的。**

   **this 实际上是在函数被调用时发生的绑定，它指向什么完全取决于函数在哪里被调用**



使用 new 来调用函数，或者说发生构造函数调用时，会自动执行下面的操作。 

1. 创建（或者说构造）一个全新的对象。 
2. 这个新对象会被执行 [[ 原型 ]] 连接。
3. 这个新对象会绑定到函数调用的 this。 
4. 如果函数没有返回其他对象，那么 new 表达式中的函数调用会自动返回这个新对象。

# ES6增加了可计算属性名

```javascript
var prefix = "foo";
var myObject = {
[prefix + "bar"]:"hello",
[prefix + "baz"]: "world"
};
myObject["foobar"]; // hello
myObject["foobaz"]; // world
```



# for of 遍历

```javascript
for(var val in obj){
    console.log(val);   
}
```

**普通的对象没有内置的 @@iterator，所以无法自动完成 for..of 遍历。之所 以要这样做，有许多非常复杂的原因，不过简单来说，这样做是为了避免影响未来的对象 类型**

你可以使用 ES6 的 for..of 语法来遍历数据结构（数组、对象，等等）中的值，for..of 会寻找内置或者自定义的 @@iterator 对象并调用它的 next() 方法来遍历数据值。

```javascript
var myObject = {
a: 2,
b: 3
};
Object.defineProperty( myObject, Symbol.iterator, {
enumerable: false,
writable: false,
configurable: true,
value: function() {
var o = this;
var idx = 0;
var ks = Object.keys( o );
return {
next: function() {
return {
value: o[ks[idx++]],
done: (idx > ks.length)
};
}
};
}
} );
// 手动遍历 myObject
var it = myObject[Symbol.iterator]();
it.next(); // { value:2, done:false } 
it.next(); // { value:3, done:false } 
it.next(); // { value:undefined, done:true }
// 用 for..of 遍历 myObject
for (var v of myObject) {
console.log( v );
}
// 2
// 3
```

# JS类

```javascript
class Rectangle {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
}
```



# 原型

```javascript
// 和你想要的机制不一样！
Bar.prototype = Foo.prototype;
// 基本上满足你的需求，但是可能会产生一些副作用 :(
Bar.prototype = new Foo();
```

Bar.prototype = Foo.prototype 并不会创建一个关联到 Bar.prototype 的新对象，它只 是让 Bar.prototype 直接引用 Foo.prototype 对象。因此当你执行类似 Bar.prototype. myLabel = ... 的赋值语句时会直接修改 Foo.prototype 对象本身。显然这不是你想要的结 果，否则你根本不需要 Bar 对象，直接使用 Foo 就可以了，这样代码也会更简单一些。



```javascript
Bar.prototype = Object.create( Foo.prototype )。
```

Bar.prototype = new Foo() 的确会创建一个关联到 Bar.prototype 的新对象。但是它使用 了 Foo(..) 的“构造函数调用”，如果函数 Foo 有一些副作用（比如写日志、修改状态、注 册到其他对象、给 this 添加数据属性，等等）的话，就会影响到 Bar() 的“后代”，后果 不堪设想

```javascript
// ES6 之前需要抛弃默认的 Bar.prototype
Bar.ptototype = Object.create( Foo.prototype );
// ES6 开始可以直接修改现有的 Bar.prototype
Object.setPrototypeOf( Bar.prototype, Foo.prototype );
```



```javascript
a instanceof Foo; // true
instanceof 操作符的左操作数是一个普通的对象，右操作数是一个函数。instanceof 回答
的问题是：在 a 的整条 [[Prototype]] 链中是否有指向 Foo.prototype 的对象?
    可惜，这个方法只能处理对象（a）和函数（带 .prototype 引用的 Foo）之间的关系。如
果你想判断两个对象（比如 a 和 b）之间是否通过 [[Prototype]] 链关联，只用 instanceof
无法实现
```



# 什么是代理





# Webpack

## webpack是什么

webpack是一种前端资源构建工具，一个静态模块打包器，在webpack看来前端的所有资源文件（js/css/json/img/less）都会作为模块处理，它将根据模块的依赖关系进行静态分析，打包生成对应的静态资源（bundle）

## webpack五个核心概念

### Entry入口

指示webpack以哪个文件为入口起点开始打包，分析构建内部依赖图

### output输出

指示webpack打包后的资源bundles输出到那里去，以及如何明明

### loader

loader让webpack能够处理哪些非JavaScript文件（webpack自身只理解JavaScript）

loader有两个属性：

test属性，识别出哪些文件会被转换

use属性，定义在进行转换时，应该使用哪个loader

webpack.config.js

### plugins插件

可以执行范围更广的任务，插件的范围包括，从打包优化和压缩，一直到重新定义环境中的变量等

### mode

模式mode指示webpack使用相应模式的配置

development:能让代码本地调式运行的环境

​	会将DefinePlugin中process.env.NODE_ENV的值设置为development

production:能让代码优化上线运行的环境

​	会将DefinePlugin中process.env.NODE_ENV的值设置为production



![img](https://img2022.cnblogs.com/blog/694493/202207/694493-20220705193915200-1963588822.png)



__dirname是一个成员，用来动态获取文件模块所属的绝对路径

__filename，可以动态获取当前文件夹的绝对路径



## Webpack体验

```javascript
初始化 package.json 输入指令:

npm init  //

下载并安装 webpack
输入指令: npm install webpack webpack-cli -g  
npm install webpack webpack-cli -D  
```





# npm

1. 查看版本

   ```shell
   npm -v
   ```

   如果使用的是旧版本，在window系统用以下命令升级

   ```shell
   npm install npm -g
   
   ```

   linux升级

   ```shell
   $ sudo npm install npm -g
   /usr/local/bin/npm -> /usr/local/lib/node_modules/npm/bin/npm-cli.js
   npm@2.14.2 /usr/local/lib/node_modules/npm
   
   ```

   

2. 使用淘宝镜像的命令

```shell
npm install -g cnpm --registry=https://registry.npmmirror.com
```

可以使用cnpm命令来安装模块

- 使用npm命令安装模块

```shell
npm install express
```

安装好之后，express包就放在了工程目录下的node_modules目录中，因此在代码中只需要通过require('express')的方式就好，无需指定第三方包路径

```javascript
var express = require("express")
```

- 全局安装与本地安装

  ```shell
  npm install express          # 本地安装
  npm install express -g   # 全局安装
  
  ```

  

如果出现错误

```shell
npm err! Error: connect ECONNREFUSED 127.0.0.1:8087 


$ npm config set proxy null // 解决办法
```



### 本地安装

- 1. 将安装包放在 ./node_modules 下（运行 npm 命令时所在的目录），如果没有 node_modules 目录，会在当前执行 npm 命令的目录下生成 node_modules 目录。

- 2. 可以通过 require() 来引入本地安装的包。

     

### 全局安装

- 1. 将安装包放在 /usr/local 下或者你 node 的安装目录。
- 2. 可以直接在命令行里使用。



查看安装信息

```shell	
npm list -g # 查看所有全局安装的模块
npm list grunt # 查看某个模块的版本号
```

## package.json



### Package.json 属性说明

- **name** - 包名。
- **version** - 包的版本号。
- **description** - 包的描述。
- **homepage** - 包的官网 url 。
- **author** - 包的作者姓名。
- **contributors** - 包的其他贡献者姓名。
- **dependencies** - 依赖包列表。如果依赖包没有安装，npm 会自动将依赖包安装在 node_module 目录下。
- **repository** - 包代码存放的地方的类型，可以是 git 或 svn，git 可在 Github 上。
- **main** - main 字段指定了程序的主入口文件，require('moduleName') 就会加载这个文件。这个字段的默认值是模块根目录下面的 index.js。
- **keywords** - 关键字

**属性不全，待不全**



```shell
npm uninstall express # 卸载模块
npm ls  
npm update express #更新模块
npm search express #搜索模块
npm init #创建模块

npm adduser #注册用户
npm publish #发布模块
```



版本号

- 如果只是修复bug，需要更新Z位。
- 如果是新增了功能，但是向下兼容，需要更新Y位。
- 如果有大变动，向下不兼容，需要更新X位。



# npm i -S -D -g

-S 等同于--save 保存在package.json文件中，是在dependencies 下，

--save安装包信息将加入到dependencies（生产环境）中，生产阶段的依赖，也就是项目运行时的依赖，就是程序上线后仍然需要依赖；



-D

-save-dev安装包信息将加入到devDependencies（开发环境）中，开发阶段的依赖，就是我们在开发过程中需要的依赖，只在开发阶段起作用；



# -g

等同于--global的简写，对模块进行全局安装，作用于全局环境下，
--global安装包信息是指把模块安装到操作系统上，
一般会安装在AppDataAppData\Roaming\npm目录下



# ES Module 和CommonJS

原生 ESM 文件

常用的是`CommonJS`和基于 `AMD` 的其他模块系统 如 `RequireJS`



# Vue



```javascript
<script setup> // SETUP是she
import { ref } from 'vue'

const awesome = ref(true)

function toggle() {
  // ...
}
</script>
```







# 谷歌地图

API key

```javascript
AIzaSyDSVBKLylg_yjnshcaNmNj6-r-U8axUtWI
```





# 心得

目前使用到的JavaScript还只是初级

# 目标

1. 使用JavaScript创建，关联，扩展对象，构建大型的复杂应用
2. JavaScript设计模式
   1. 单例模式
3. 每天写日记



