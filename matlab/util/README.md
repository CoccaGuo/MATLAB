# ArrayList类的使用

​	ArrayList是可变长度的列表。ArrayList类是对MATLAB数组的重新封装。ArrayList的语言更接近我们的思维方式，使用ArrayList将更加方便快捷，让我们专注于更重要的问题上，而不是被数据类型所困。ArrayList的源代码可以在阅读原文拿到。

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
>> numList.add(1)%向numList中添加一个元素：1
ans = 
  ArrayList - 属性:

    objArr: 1
      size: 1
>> numList.add(2)%向numList中添加一个元素：2
ans = 
  ArrayList - 属性:

    objArr: [1 2]
      size: 2
>> numList.add(3)%向numList中添加一个元素：3
ans = 
  ArrayList - 属性:

    objArr: [1 2 3]
      size: 3
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

#### get方法、set方法和remove方法

​	get方法用于获得某位置的某个元素。使用方法为：`arrayList.get(index)`。其中arrayList是ArrayList的某个实例，index是要获取元素的位置。

​	set方法用于改变某位置某元素的值。使用方法为：`arrayList.set(index,element)`。其中arrayList是ArrayList的某个实例，index是要设置元素的位置，element是要设置的元素的值。

​	remove方法用于移除某个元素。使用方法为：`arrayList.remove(index)`。其中arrayList是ArrayList的某个实例，index是要移除元素的位置。

​	用刚刚定义的numList举个例子：

```matlab
>> numList.get(1)%获取第一个元素的值
ans =
     1
>> numList.set(1,4)%将第一个元素设为4
ans =
     4
>> numList.get(1)%获取第一个元素的值
ans =
     4
>> numList	%查看现在的numList
numList = 
  ArrayList - 属性:

    objArr: [4 2 3]
      size: 3
>> numList.remove(2)%移除第二个元素
ans = 
  ArrayList - 属性:

    objArr: [4 3]%第二个元素已经被移除
      size: 2
```

#### addAll和removeAll方法

​	get、set和remove方法适用于操作单一元素的方法。批量操作ArrayList可以使用addAll和removeAll方法。使用方法为：

`arrayList.removeAll()%移除所有元素`

`arrayList.addAll(anotherList);%将另一个ArrayList中的元素全部加到此ArrayList之后`。

举个例子：

```matlab
>> numList2	%另一个ArrayList
numList2 = 
  ArrayList - 属性:

    objArr: [1 2 3 4 5]
      size: 5
>> numList	%刚刚的ArrayList
numList = 
  ArrayList - 属性:

    objArr: [4 3]
      size: 2
>> numList.addAll(numlist2)	%将numList2添加到numList之后
ans = 
  ArrayList - 属性:

    objArr: [4 3 1 2 3 4 5]
      size: 7
>> numList2.removeAll %将numList2清空
ans = 
  ArrayList - 属性:

    objArr: []
      size: 0
```



#### contains方法和isEmpty方法

contains方法用于判断某元素是否在该ArrayList内，如果在则返回地址。

isEmpty方法用于判断该ArrayList是否为空。

举个例子：

```matlab
>> numList %先看看numList里都有哪些元素
numList = 
  ArrayList - 属性:

    objArr: [4 3 1 2 3 4 5]
      size: 7
>> numList.contains(3) %numList里是否有3
ans =
     2     5			%返回了3的index
>> numList.contains(6)	%numList里是否有6
ans =
  空的 1×0 double 行向量 %没有
>> numList.isEmpty 
ans =
     0		%numList不为空
>> numList2.isEmpty
ans =
     1		%numList2为空
```

#### ArrayList接收对象

​	ArrayList最擅长处理的不是number和string，那些用系统数组就可以搞定。ArrayList的特别之处是可以处理自定义的数据类型和对象。

#### ArrayList综合运用

​	之前我们已经定义了FractalLine类。这个类通过传入一对点的坐标(x1,y1)、(x2,y2)来构造一条线段，并实现了线段的平移、旋转、求模、取等分点、分形等操作。下面我们用ArrayList处理分型中众多的线段。

​	`parentLine = FractalLine(0,0,0,1);`  %最开始的一条直线(0,0)(0,1)

​	`lineList = ArrayList(parentLine);` %声明并实现一个ArrayList，用于存放所有线段

​	`lineList.add(parentLine);`% 先把第一条直线放到lineList中

​	`childrenList = ArrayList(parentLine);`%声明了另一个存放线段的ArrayList

​	`for i = 1:n `%循环次数

​	   ` childrenList.removeAll();` %将childList清空

​	   ` for cursor = 1:lineList.getSize()`%遍历整个lineList，cursor在循环中依次指向lineList中的每条线段的index

​	           ` childrenList.addAll(lineList.get(cursor).fractal);` % lineList.get(cursor).fractal 获得lineList中cursor位置的线段，调用它的分形方法。childrenList.addAll()每一条线段分形后返回一组子线段(结果)，将它们放入childList中暂存。

​	  `  end `   
​	           ` lineList.removeAll();`%将lineList清空

​	            `lineList.addAll(childrenList);`%把这一次循环所有结果重新放入lineList中，等待下一次循环

​	`end` %循环结束，分形完成

​	`for cursor = 1:lineList.getSize()`%遍历分形的结果

​	     `lineList.get(cursor).plot(); `%对每个线段调用plot方法

​	   ` axis equal`

​	  `  hold on`

`end`

完整过程：

```matlab
	parentLine = FractalLine(0,0,0,1);  %初始母线段
    lineList = ArrayList(parentLine); %声明并实现一个ArrayList，用于存放所有线段
    lineList.add(parentLine);
    childrenList = ArrayList(parentLine);
    for i = 1:n
        childrenList.removeAll();
        for cursor = 1:lineList.getSize() %遍历整个lineList
        	childrenList.addAll(lineList.get(cursor).fractal);
        end  
                lineList.removeAll();
                lineList.addAll(childrenList);
    end
    for cursor = 1:lineList.getSize()
         lineList.get(cursor).plot(); 
        axis equal
        hold on
end
```

#### 使用注意事项

 - ArrayList是我们自己定义的类，在其他电脑上使用时需要将ArrayList需要的相关文件一起拷贝
 - ArrayList是List的实现类，List依次继承与Collection和Obj。
 
