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





# 心得

目前使用到的JavaScript还只是初级

# 目标



