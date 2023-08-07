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



使用 new 来调用函数，或者说发生构造函数调用时，会自动执行下面的操作。 1. 创建（或者说构造）一个全新的对象。 2. 这个新对象会被执行 [[ 原型 ]] 连接。 3. 这个新对象会绑定到函数调用的 this。 4. 如果函数没有返回其他对象，那么 new 表达式中的函数调用会自动返回这个新对象。



# 心得

目前使用到的JavaScript还只是初级

# 目标

1. 使用JavaScript创建，关联，扩展对象，构建大型的复杂应用
2. JavaScript设计模式
   1. 单例模式
3. 

