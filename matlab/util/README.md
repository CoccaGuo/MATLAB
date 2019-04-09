# ArrayList类的使用

​	ArrayList是可变长度的列表。ArrayList类是对MATLAB数组的重新封装。ArrayList的语言更接近我们的思维方式，使用ArrayList将更加方便快捷，让我们专注于更重要的问题上，而不是被数据类型所困。

#### 构造一个ArrayList

​	在MATLAB中构造实例的方式是`objName = ClassConstructor(args);`，其中objName是对象名称，ClassConstructor是构造器，args是传入参数。

​	在ArrayList类中，有两种构造器分别是`ArrayList();`和`ArrayList(objInstance);`。空构造器支持传入MATLAB默认数据类型，如`double,string`等，但是不支持传入自定义类型。第二个构造器通过传入一个对象实例，实现了对ArrayList接受类型的声明(类似于Java中的泛型)，之后这个ArrayList只接收该对象实例。

​	举个例子：

```matlab
>> numList = ArrayList()%新建一个未定义类型的ArrayList
numList = 
  ArrayList - 属性:

    objArr: []
      size: 0
>> numList = numList.add(1)%添加一个元素：1
numList = 
  ArrayList - 属性:

    objArr: 1
      size: 1
>> numList = numList.add(2)
numList = 
  ArrayList - 属性:

    objArr: [1 2]
      size: 2
```

除了`add()`方法，ArrayList还提供了一系列List的对应方法：

```matlab
>> methods(numList)

类 ArrayList 的方法:

ArrayList
addAll
contains
get
isEmpty
remove
set
add         
getSize    
indexOf    
print      
removeAll
```

下面介绍一些常用的方法。

#### get方法和set方法

​	get方法用于获得某位置的某个元素。使用方法为：`arrayList.get(index)`。其中arrayList是ArrayList的某个实例，index是要获取元素的位置。
