<center><h1> OOP思想在MATLAB中的应用</h1></center>

<center><h6>郭家栋 201711140121</h6></center>

<center><h6>目录</h6></ center>

[TOC]

<div STYLE="page-break-after: always;"></div>

## OOP思想和MATLAB

### 面向对象的程序设计思想[^1]

 	面向过程就是分析出解决问题所需要的步骤，然后用函数把这些步骤一步一步实现，使用的时候一个一个依次调用就可以了。 

​	面向对象编程（OOP，Object Oriented Programming）是把构成问题事务分解成各个对象，建立对象的目的不是为了完成一个步骤，而是为了描叙某个事物在整个解决问题的步骤中的行为。 

[^1]:引用:[面向对象和面向过程的区别](https://zhidao.baidu.com/question/2089034.html).

### MATLAB对OOP的支持

#### 在MATLAB中定义类

​	对象(Object)由静态的属性和动态的方法组成。类(Class)是对对象的抽象[^2]。MATLAB支持使用classdef关键字定义类，用properties定义属性，用methods定义方法[^3]。

[^2]:参考:[面向对象:类的概念和定义](https://blog.csdn.net/tp15868352616/article/details/80475887).
[^3]:参考：[classdef](https://ww2.mathworks.cn/help/matlab/ref/classdef.html)、[Create a Simple Class](https://ww2.mathworks.cn/help/matlab/matlab_oop/create-a-simple-class.html)、[Class Components](https://ww2.mathworks.cn/help/matlab/matlab_oop/class-components.html)

#### 包和命名空间

​	MATLAB中不显式存在包和命名空间的概念。为了导入并搜索到一个函数，我们会先设置路径，同时也可以看到众多的MATLAB内建函数已经包含在路径中。这样做的好处是调用方便，直接输入函数名就可以调用函数。在调用sin()函数时，我们知道是求正弦值。在调用comet()函数时，我们知道是画彗星图。

​	但是这么做也导致了严重的后果，就是重名问题。在函数还比较少的时候，稍微换个名称就可以，但是当MATLAB生态建立起来，拥有上十万百万甚至更多函数的时候，这么做就不很合理了；为了不重名，MATLAB中就出现了各种“奇奇怪怪”的函数，如`repmat,flipud,@optimplotx,@optimplotfval`等等。这也难怪会出现MATLAB指令速查手册这种东西出现。

​	事实上，大部分函数都不会经常用到，没有必要全部放在一个包下。在C语言中，我们会根据程序不同的功能，引用不同的标准库，如`#include<math.h>`来处理数学问题，比如使用sqrt();。这样就算在另一个标准库中也存在sqrt();函数，两者的使用也不会混淆，因为他们在不同的标准库中。同样的，在Java中，和数学相关的函数在类`java.lang.Math`中，使用时先输入Math.就会提示类Math中的常量和方法，非常方便。

​	如果MATLAB中能建立包的概念，在使用矩阵上下翻转这种不常用命令时，直接到Matrix类中寻找相应的函数即可，比如`Matrix.upSideDown();`这样在处理矩阵时就立马想到去Matrix类中找函数，不仅写程序方便许多，代码可读性上也增强许多。

### 编写规范

​	语言规范看似不关紧要，却影响整个代码的可读性和可维护性，同时是程序员程序风格的体现。文档按照如下语言规范编写。

#### 效率与可读性[^4]

[^4]:相关内容可以参考：[编写可读性代码的艺术](https://www.cnblogs.com/greeenplace/articles/4667830.html)

​	在进行代码开发的时候，应该遵循==可读性第一，效率第二==的原则，这是现代程序设计的常识。在保持良好的编程习惯和必要的注释的基础上进而追求效率。提升效率的主要方式是优化算法，这一过程和保持程序的可读性不矛盾。

​	不应该向课本第二章开始介绍的那样一味地追求效率而忽视程序的可读性、可理解性。因为这么做不仅不利于学习，还会使后期维护和调试面临困难。

​	该文章的主要目标之一就是通过使用新封装的API提升程序的可读性。

#### 缩进问题

​	在使用循环(for)和判断(if/switch)时建议使用缩进。目前存在Tab键缩进和空格缩进两种主流方法。其中空格缩进占75%，又有2空格、4空格、8空格三种。==文档使用4个空格进行缩进。==

```matlab
for k=1:n %摘自课本
    E(k)=fzero(@hhh,e1,optimset('tolx',1e-6),k); %正式出版物中不应该使用hhh等含义不明的名称
    e1 =E(k)+0.1*abs(E(k));
    xio(k,1:2)=[x1,x2]; %xio同理
end
```

#### 命名规范

​	在常量变量和函数的命名中存在驼峰命名和下划线命名两种。驼峰又分为大驼峰和小驼峰。举例：

​	`InputDataHandler`(大驼峰)

​	`inputFileStream`（小驼峰）

​	`input_data_handler`（下划线）

​	推荐函数名、变量名使用小驼峰，类的定义使用大驼峰，不要使用下划线和特殊符号开头。

​	命名的选择应有一定的意义，做到能“望文生义”，避免使用意义不明的拼音简写或`hhh`、`kk`等函数或变量。

#### 注释

​	在必要的场合使用注释。函数和类文件的开头，应注明函数的传入参数，传出参数，主要功能，作者等。关键代码，不易读懂的地方应适当的添加注释。举例：

```matlab
function options = optimset(varargin)
%OPTIMSET Create/alter optimization OPTIONS structure.
%   OPTIONS = OPTIMSET('PARAM1',VALUE1,'PARAM2',VALUE2,...) creates an
%   optimization options structure OPTIONS in which the named parameters have
%   ......
%   NOTE: For values that are text, the complete text is required.
%
%   OPTIONS = OPTIMSET(OLDOPTS,'PARAM1',VALUE1,...) creates a copy of OLDOPTS
%   with the named parameters altered with the specified values.
%   ......
%   See also OPTIMGET, FZERO, FMINBND, FMINSEARCH, LSQNONNEG.

%   Copyright 1984-2016 The MathWorks, Inc.

```

## 常用API

​	常用API是我自己按照OOP思想和规范、仿照Java的范式用==纯MATLAB代码==重写的一系列类的集合。

### 数据类型

#### 数值

##### 数值包装类

​	matlab中的默认数值为double类型。Number类是double等基本数值类型的封装类。该类的意义在于方便拓展、包装和数据转化。Number类默认实现了常见运算。 具体方法可以查看我的源码，这里不再一一介绍。

```matlab
类 Number 的方法:

Number       minus        times        
eq           plus         toString     
getNumber    power        uminus       
gt           print        
lt           rdivide      

Static 方法:

parseNumber  
```

##### 静态方法：parseNumber

​	static关键字描述的方法是静态方法。静态方法使用类名直接调用。parseNumber方法允许您从String或string类型中解析出数值。返回类型为double。您也可以用parseNumber方法解析存放于ArrayList中的数据。

```matlab
>> str = String("1e4");
>> Number.parseNumber(str)
ans =
       10000
>> str = "-3.2";
>> Number.parseNumber(str)
ans =
   -3.2000
```



#### 字符串

##### char、string和String

​	matlab定义的字符串类型为string，使用双引号包围。在早期版本中使用char类型代替string类型，使用单引号包围。char类型是一个Character Array，可以转化为int8类型，可以进行加减运算。string类型不能看做character的集合，因此不能使用索引，但是提供了更丰富的方法。

​	String类由一个string包装而成，可以使用string中的方法，同时可以使用自己定义的方法。Obj中的toString方法即是此String。

##### 使用String中的方法

​	使用methods指令查看String中的方法。其定义的print方法为ArrayList中方便的打印提供了良好的接口。具体方法可以查看我的源码，这里不再一一介绍。

```matlab
>> methods(String)

类 String 的方法:

String           println          
charAt           reverse          
contains         split            
eq               substring        
getMatlabString  toCharArray      
indexOf          toLowerCase      
isEmpty          toMatlabString   
length           toString         
plus             toUpperCase      
print         
```

#### 函数：在不同作用域中传递

​	MATLAB中的大多数计算都由函数完成。比如：

​	`sin(pi) /plot(x,y)/changeScore(file)%自定义函数`

​	设想一下如果我们想把函数作为参数在不同函数间传递，那我们应该怎么做?书上有函数句柄、inline函数等方式。但是考虑这种情况：

​	给出一个普遍的方法计算函数在某区间上的数值积分。实现这个功能的函数应该写成：

​	`numeralIntegration(func,start,end)`

​	其中`func`是系统函数或自定义函数。但是在编写`NumeralIntegration`的时候，在==还不知道==用户会传入什么func的情况下，我们没办法调用这个func，因为用户传入的函数句柄名称还是不确定的。

##### 函数句柄和符号类型转化

​	函数本身涉及到函数句柄比较复杂。我们可以将函数转化成符号变量，传递后再在新的函数体中还原成函数句柄。相当于在传递时先“压缩装箱”，传递之后再“解压缩”。例子：

```matlab
%压缩%
f = @(x)x^2; %function handle
syms x;
symbol_func = f(x); %symbol_function
%使用symbol_func在不同函数体之间传递%
%操作和传递……
%解压%
fun = matlabFunction(symbol_func);
fun(2) %return 4
```

​	这样就可以在不同函数间传递函数句柄了。

##### 封装成函数对象

​	每次传递函数时都要压缩解压，比较麻烦。可以直接写到一个函数对象类中：`FuncObj`

​	构造方法中可以传入符号函数类型或者函数句柄。调用`funcObj.calc(2);`可以直接返回计算结果`4`。下面给出使用的例子:

```matlab
%通过符号函数构造
syms x;
y = x^2;
square = FuncObj(y);%构造
square.calc(2) %return 4
new_handle = square.handle() %获得square的函数句柄
new_handle(3) %return 9

%通过函数句柄构造
getsin = @(x)sin(x); %getsin是一个计算sin值的函数句柄
square = FuncObj(getsin);%构造
square.calc(pi) %return 0

```

​	这样，在声明新的函数的时候，将传入的参数定义成`funcObj`,就可以直接调用`funcObj.calc()`计算。

#### 列表：ArrayList[^5]

[^5]:原文发布于我自己的公众号。已修改。

​	ArrayList是可变长度的列表。ArrayList类是对MATLAB数组的重新封装。ArrayList的语言更接近我们的思维方式，使用ArrayList将更加方便快捷，让我们专注于更重要的问题上，而不是被数据类型所困。

##### 构造一个ArrayList

​	在MATLAB中构造实例的方式是`objName = ClassConstructor(args);`，其中objName是对象名称，ClassConstructor是构造器，args是传入参数。

​	在ArrayList类中，有三种构造器分别是`ArrayList()、ArrayList(objInstance)和ArrayList(array[])`。空构造器支持传入MATLAB默认数据类型，如`double,string`等，但是不支持传入自定义类型。第二个构造器通过传入一个对象实例，实现了对ArrayList接受类型的声明(类似于Java中的泛型)，之后这个ArrayList只接收该对象实例。第三个构造器可以将MATLAB数组转化成ArrayList。

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

​	除了`add()`方法，ArrayList还提供了一系列List的对应方法：

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

​	下面介绍一些常用的方法。

##### get方法、set方法和remove方法

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

##### addAll和removeAll方法

​	get、set和remove方法适用于操作单一元素的方法。批量操作ArrayList可以使用addAll和removeAll方法。使用方法为：

​	`arrayList.removeAll()`%移除所有元素

​	`arrayList.addAll(anotherList)`%将另一个ArrayList中的元素全部加到此ArrayList之后。

​	举个例子：

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

##### contains方法和isEmpty方法

​	contains方法用于判断某元素是否在该ArrayList内，如果在则返回地址。

​	isEmpty方法用于判断该ArrayList是否为空。

​	举个例子：

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

##### toString方法、print方法和toArray方法

​	toString方法会调用每个元素的toString方法。当元素是double类型时，ArrayList实际调用的是他的封装类的toString方法。ArrayList默认使用一个空格作为分割不同元素的分隔符。您可以指定一个参数作为分隔符。

​	print方法会调用每个元素的print方法。

```matlab
>> list = ArrayList(); %新建一个ArrayList，向其中加入1~5五个数。
>> for i = 1:5
list.add(i);
end
>> list.print %print方法
12345>> 
>> list.toString() %默认toString
ans = 
  String - 属性:

    str: "1 2 3 4 5"
    >> list.toString("") %定义分隔符的toString
ans = 
  String - 属性:

    str: "12345"
>> list.toString(",") %定义分隔符的toString
ans = 
  String - 属性:

    str: "1,2,3,4,5"
>> list.toString("/") %定义分隔符的toString
ans = 
  String - 属性:

    str: "1/2/3/4/5"
```



> **过时方法** print()    %deprecated
>
> ​	过时方法会用%deprecated标记，这是不推荐使用的方法。
>
> ​	print方法原来存在于Obj中，是所有子类都会实现的方法。在新版本中，print方法被更合理的toString方法取代。今后新写的对象中，很可能不会实现print方法，使该方法失效。
>
> ​	使用以下的代码代替print方法：
>
> ```matlab
> for i = 1:list.size
>     System.out.print(list.get(i).toString());
> end
> ```
>
> 更简单地，当您调用默认的`toString()`方法时，使用一下代码以调用内建的iterator：
>
> ```matlab
> System.out.println(list);
> ```

toArray方法允许您将ArrayList转化为MATLAB默认的数组类型。

##### ArrayList接收对象

​	ArrayList最擅长处理的不是number和string，那些用系统数组就可以搞定。ArrayList的特别之处是可以处理自定义的数据类型和对象。

### 输入和输出

#### 控制台输入和输出

##### 使用(matlab.lang.)System.out.*输出

​	*`System.out`是一个`matlab.io.PrintStream`对象。*

​	使用`System.out.println(Object printableObject)`换行输出。

​	使用`System.out.print(Object printableObject)`不换行输出。

​	使用`System.err.println(Object printableObject)`换行输出错误并停止程序。

```matlab
>> System.out.println("Hello world!")
Hello world!
>> System.out.print("这句不换行")
这句不换行>> System.err.println("发生错误！")
错误使用 PrintStream/println (line 55)
发生错误！ 
```



##### 使用(matlab.lang.)System.in.*输入

​	*`System.in`是一个`matlab.io.InputStream`对象。*

​	使用`byte System.in.read()`方法从命令行窗口读取一个字节,返回一个int8类型数据。

​	使用`byte[] System.in.readLine()`方法从命令行窗口读取一行信息，使用回车键结束。返回int8数组。

​	使用` Number System.in.readNumber()`方法从命令行窗口读取一个数,返回一个Number对象。

​	使用` num System.in.readMatlabNumber()`方法从命令行窗口读取一个数,返回一个MATLAB默认的double类型数据。

​	使用`String System.in.readString()`方法从命令行窗口读取一行信息,返回一个String对象。

​	使用`string System.in.readMatlabString()`方法从命令行窗口读取一行信息,返回一个MATLAB默认的string类型数据。

```matlab
>> System.in.read()
a
ans =
  int8
   97
>> System.in.readLine()
abcd efg
ans =
  1×8 int8 行向量
    97    98    99   100    32   101   102   103
>> System.in.readMatlabNumber()
233
ans =
   233 
>> System.in.readString()
从Console读取String
ans = 
  String - 属性:

    str: "从Console读取String"
```

> **使用System中的其他方法**
>
> ​	使用`System.shutdown(sec)`方法关闭您的计算机。不输入秒数时默认立即关闭。
>
> ​	使用`System.cancelShutdown()`取消关闭计算机的计划。
>
> ​	使用`System.logout()`方法注销您的登录状态。
>
> ​	使用`System.execute(string)`方法执行系统命令。

##### 使用(matlab.util.)Scanner输入

###### 构造Scanner

​	在使用控制台输入时，用`sc = Scanner(System.in)`构造Scanner。

###### 使用Scanner中的方法

​	使用`logical hasNext()`方法判断是否有下一个元素。

​	使用`num nextNumber()`方法读取下一个数值。

​	使用`String nextLine()`方法读取下一行信息，返回一个String对象。

```matlab
>> sc = Scanner(System.in);
>> while(sc.hasNext)
str = sc.nextLine();
list.add(str);
end
你站在桥上看风景，
看风景的人在楼上看你。
明月装饰了你的窗子，
你装饰了别人的梦。

>> list.print
你站在桥上看风景，看风景的人在楼上看你。明月装饰了你的窗子，你装饰了别人的梦。>> 
```



#### 从文件输入和输出

##### (matlab.io.)File类

​	使用File类声明一个文件对象。

###### 构造File

​	使用`file = File(String path)`构造文件。其中path是文件的路径。

###### 使用File中的方法

​	使用`logical exists()`方法判断文件是否存在。

​	使用`logical makeNewFolder()`方法新建文件夹。成功建立返回1,否则返回0.

​	使用`logical makeNewFile()`方法新建文件。成功建立返回1,否则返回0.

```matlab
>> file = File("D:/demo.txt"); %不存在的文件
>> file.exists
ans =
  logical
   0
>> file.makeNewFile %建立这个文件
ans =
  logical
   1
>> file.exists
ans =
  logical
   1
```



##### (matlab.io.)FileInputStream类

​	使用FileInputStream类将文件作为二进制数据流读入。对于txt文件，可以按文本直接读取。编码格式为utf-8。

###### 构造FileInputStream

​	使用`FileInputStream(File file)`构造文件输入流。其中file是文件。

​	使用`FileInputStream(String path)`构造文件输入流。其中path是文件路径。

###### 使用FileInputStream中的方法

​	使用`open()`打开文件输入流。如果您在使用前忘记打开流，它将会自动打开。

​	使用`close()`关闭文件输入流。如果您在使用后忘记关闭流，MATLAB将会继续占用文件。

​	使用`byte[] readBytes()`读取文件的所有字节。返回int8数组。

​	使用`string readMatlabString()`读取一行utf-8编码的字符，返回一个MATLAB默认的string类型数据。

​	使用`String readString()`读取一行utf-8编码的字符，返回一个String对象。

##### (matlab.io.)FileOutputStream类

​	使用FileOutputStream类将二进制数据写入文件。对于txt文件，可以按文本直接写入。编码格式为utf-8。

###### 构造FileOutputStream

​	使用`FileOutputStream(File file)`构造文件输入流。其中file是文件。

​	使用`FileOutputStream(String path)`构造文件输入流。其中path是文件路径。

###### 使用FileOutputStream中的方法

​	使用`open()`打开文件输出流。如果您在使用前忘记打开流，它将会自动打开。

​	使用`close()`关闭文件输出流。如果您在使用后忘记关闭流，MATLAB将会继续占用文件。

​	使用`writeBytes(byte[])`将二进制数组写入文件。

​	使用`writeMatlabString(string string)`写入utf-8编码的MATLAB默认的string类型字符。

​	使用`writeString(String string)`写入utf-8编码的String字符。

##### (matlab.util.)Scanner类

​	您可以使用Scanner从文件读取。

###### 构造Scanner

​	使用`Scanner(InputStream fileInputStream)`构造扫描器。

###### 使用Scanner中的方法

​	使用`logical hasNext()`方法判断是否有下一个元素。

​	使用`String nextLine()`方法读取下一行信息，返回一个String对象。

```matlab
%在D盘存在一个文件“雨霖铃.txt”。读取其所有内容。
>> file = File("D:\雨霖铃.txt");
fis = FileInputStream(file);
sc = Scanner(fis);
while(sc.hasNext)
    str = sc.nextLine();
    System.out.println(str);
end
fis.close;
﻿寒蝉凄切，
对长亭晚，骤雨初歇。
都门帐饮无绪，方留恋处，兰舟催发。
执手相看泪眼，竟无语凝噎。
念去去、千里烟波，暮霭沉沉楚天阔。
多情自古伤离别，更那堪冷落清秋节！
今宵酒醒何处？杨柳岸、晓风残月。
此去经年，应是良辰好景虚设。
便纵有千种风情，更与何人说？
```



##### (matlab.io.)PrintStream类

​	您可以使用PrintStream写入文件。

###### 构造PrintStream

​	使用`PrintStream(OutputStream fileOutputStream)`构造打印流。

###### 使用PrintStream中的方法

​	使用`print(Obj printableObject)`方法不换行写入文件。

​	使用`println(Obj printableObject)`方法换行写入文件。

> **关于Obj printableObject**
>
> ​	Obj类是matlab包中所有类的超类。Obj类默认实现`toString()`方法，所以严格来说，所有的实例对象是可打印的对象。但是在大部分情况下，默认实现的`toString()`不完善，需要在实现类中重写。狭义的，我们把重写了`toString()`方法的对象成为可打印的对象(printableObject).

##### (matlab.io.)ExcelInputStream类

*这个类不完善，方法和命名可能会改变。*

​	您可以使用ExcelInputStream从文件读取。

###### 构造ExcelInputStream

​	使用`ExcelInputStream(File file)`构造Excel输入流。其中file是文件。

​	使用`ExcelInputStream(String path)`构造Excel输入流。其中path是文件路径。

###### 使用ExcelInputStream中的方法

​	使用`setSheet()`方法改变读取的sheet. 默认sheet为1.

​	使用`cell read()`方法读取该当sheet中的所有信息。返回元胞数组。

​	使用`cell readText()`方法读取该当sheet中的所有文本信息。返回元胞数组。

​	使用`array readNumber()`方法读取该当sheet中的所有数字信息。返回数组。

## 应用例

### ODE数据的保存和读取

##### 保存数据

​	将计算处理后的数据保存到硬盘上。

```matlab
%之前的计算
[t,y] = ode23s(@func,[0 1],1);
%处理数据
yList = ArrayList(y);
tList = ArrayList(t);
%保存
file = File("D:/odeResult.txt"); %新建文件
if ~file.exists %检查文件是否存在
    file.makeNewFile(); %不存在时新建
end
fos = FileOutputStream(file); %文件输出流(从内存输出到硬盘)
fos.open(); %打开文件输出流
out = PrintStream(fos); % 将文件输出流作为打印输出流
out.println("y的数据为："); 
out.println(yList); %ArrayList会调用每个元素的toString方法
out.println("//"); % 用作分隔符
out.println("t的数据为：");
out.println(tList);  
%关闭资源
fos.close;
% ode计算中用到的函数
function res = func(t,y)
    res = -1000*(y - sin(t)) + cos(t);
end
```

​	可以在D盘根目录下找到数据文件：

<img src="numin.jpg" style="zoom:35%" align=center />

##### 读取数据

​	从硬盘中将ODE所用的数据读取还原并画图。

```matlab
file = File("D:/odeResult.txt");
if ~file.exists %如果文件不存在
    System.err.println("文件未找到。"); %报错
end
fis = FileInputStream(file); %文件输入流
fis.open(); %打开资源
sc = Scanner(fis);
rawData = String(); %存放原始数据
while(sc.hasNext)
   str =  sc.nextLine;
   rawData = rawData + str;
end
fis.close;%关闭资源
ytList = rawData.split("//"); %使用分隔符“//”分隔y和t
y = ytList.get(1).split(" "); %使用空格分隔每个数据
y = Number.parseNumber(y.remove(1)); %将第一个数据(数据题目)移除("y的数据为：")，并解析
t = ytList.get(2).split(" ");
t = Number.parseNumber(t.remove(1));
plot(t,y,'o') % 绘图
```

<img src="numout.jpg" style="zoom:60%" align=center />

​	从绘制的图像上可以看出数据被成功解析。

​	写入读取数据是比较频繁的操作。进一步地，您可以自己尝试将数据写入和数据写出整理成一个类，通过传入数据和保存路径将其保存，通过读取路径读取数据。您也可以自定义分隔符或者使数据格式符合json格式的标准，便于其他程序读取数据。

​	通过这种方式可以保存数据。想一想如何将一个对象的实例保存？您可以在搜索引擎中搜索[序列化](https://baike.baidu.com/item/%E5%BA%8F%E5%88%97%E5%8C%96/2890184?fr=aladdin)来了解更多相关信息。

### 可分形线段和分形

​	使用面向对象的思想解决作业中线段分形的问题。

##### 线段类

​	分形中操作的主要内容是线段，所以线段是分形问题中的重要对象。下面列举了线段类的属性和方法。每条线段由2个点$(x_1,y_1)、(x_2,y_2)$构造。同时线段具有平移、旋转等方法。

```matlab
>> properties(Line)
类 Line 的属性:
    x1
    y1
    x2
    y2
>> methods(Line)

类 Line 的方法:

Line       eq         plot       toString   
add        length     print      uminus     
direction  minus      rotate
```

##### 可分形线段

​	单纯的线段不具有分形能力。定义一个可分形线段类继承自线段类，实现“能够分形”这一独特的性质。可以看到，线段获得了分形、取等分点的能力。

```matlab
>> methods(FractalLine(1,1,1,1))

类 FractalLine 的方法:

FractalLine  fractal3     rotate       
add          length       toString     
direction    minus        trisection   
eq           plot         uminus       
fractal      print        
fractal2     quadsection 
```



##### 分形过程

​	之前我们已经定义了FractalLine类。这个类通过传入一对点的坐标(x1,y1)、(x2,y2)来构造一条线段，并实现了线段的平移、旋转、求模、取等分点、分形等操作。下面我们用ArrayList处理分型中众多的线段。

```matlab
	parentLine = FractalLine(0,0,0,1); %最开始的一条直线(0,0)(0,1)
	lineList = ArrayList(parentLine); %声明并实现一个ArrayList，用于存放所有线段
	lineList.add(parentLine);% 先把第一条直线放到lineList中
	childrenList = ArrayList(parentLine);%声明了另一个存放线段的ArrayList
	for i = 1:n%循环次数
	    childrenList.removeAll(); %将childList清空
	    for cursor = 1:lineList.getSize()%遍历整个lineList，cursor在循环中依次指向lineList中的每条线段的index
	        childrenList.addAll(lineList.get(cursor).fractal);  
	        %获得lineList中cursor位置的线段，调用它的分形方法。
	        %每一条线段分形后返回一组存放于ArrayList中的子线段(结果)，将它们放入childList中暂存。
	    end 
	    % 本次分形完成
	    lineList.removeAll();%将已经分形过的lineList清空
	    lineList.addAll(childrenList);%把分形得到的所有结果重新放入lineList中，等待下一次循环
	end %循环结束，分形完成
	
	for cursor = 1:lineList.getSize()%遍历分形的结果
	    lineList.get(cursor).plot();%对每个线段调用plot方法
	    axis equal
	    hold on
end
```

<img src="fract.jpg" style="zoom:60%" align=center />

​	分形结果见上图。可以从实现过程中看到，使用面向对象的方法更加直观清晰，可读性更强。

### 估算“流浪地球”的运动轨道[^6]

[^6]:由笔者参加的2019北师大数学建模A题改编。

​	 “流浪地球”计划，即人类通过建设发动机，推动地球离开太阳系，成为系外比邻星而保护地球的一项计划。本实例以微分方程和图像描述了地球逃逸离开太阳时的运动状态，进而对“流浪地球”计划进行了合理的分析。

##### 地球逃逸阶段的状态描述

​	考虑到逃逸阶段时间相对较短，在逃逸过程中我们忽略重核聚变对于地球质量的消耗，认为地球质量$M_E$为常数。以太阳为原点建立极坐标系，我们有：
$$
\left\{ {\begin{array}{*{20}{l}}
	{M_E (\ddot{\rho}-\rho \dot{\theta})=-G\frac{M_S M_E}{{\rho}^2}+F_{\rho}}\\
	{M_E(2\dot{\rho}\dot{\theta}+\rho\ddot{\theta})=F_{\theta}}\\
	{F=n\cdot \frac{\rm{d}m}{\rm{d}t}\cdot v_{relative}}
	\end{array}} \right.​
$$
​	其中$M_E$为地球质量，$M_S$为太阳质量，$n$为行星发动机的数量，根据电影设定为10000个。$v_{relative}$是行星发动机向后喷出等离子态燃料时相对地球的速度。$\rm{d}m/dt$反映的是单个行星发动机对燃料的消耗速度。$\rho$表示运动过程中的日地距离，$\theta$表示地球绕日转过的角度，F为行星发动机对地球产生的总推力，$F_{\rho}$、$F_{\theta}$分别表示F在极坐标意义下径向和角向方向分量。

​	极坐标下，运动速度方向：
$$
\vec{v}_{relative}=\dot{\rho}\vec{e_{\rho}}+\rho \dot{\theta}\vec{e_{\theta}}
$$
​	 其中$\vec{e_{\rho}}$、$\vec{e_{\theta}}$分别为径向和角向的单位向量。 $\vec{F}$方向与$\vec{v}_{relative}$一致，因此$F_{\rho}$与$F_{\theta}$易于求得。

##### 轨迹和速率分析

​	利用Matlab程序求解上述方程组，得到$\rho$、$\theta$、$v_{relative}$随时间$t$的变化数据，并以此数据做图分析：

<img src="dd.jpg" width="500"/>

​	以上三组组地球绕日运行轨道对比图分别反映了不同时间内地球逃逸的状态。在地球逃逸过程的初期，绕日轨道仍近似为圆形，因此日地距离与绕日速率近乎不变。但随着逃逸过程的不断进行，地球绕日轨道的离心率逐渐增大，地球沿椭圆轨道不停在近日点与远日点间运动。其中运行30年后的地球绕日轨迹第一次突破木星轨道位置，但地球并未脱离太阳引力，而是沿椭圆轨道重新返回近日点。在反映日地距离随时间变化的第三幅图中，时间接近85年时，由于地球远日点距离太阳极远，故此地球完成一个围绕周期所用的时间有明显的加长，速率变化有显著的减弱。当85年后，地球首次突破冥王星最远点，此时太阳对地球的引力作用极小，地球便成功从太阳系中逃逸。在地球逃离太阳系后，地球不受太阳引力影响，故此速率趋于稳定。

<center>
    <img src="pic/r25.jpg" width="210"/>
    <img src="pic/r30.jpg" width="210"/>
    <img src="pic/r85.jpg" width="210"/>
</center>



​	以上三张图是日地距离随启动时间的直观体现。从图中我们可以看到，地球发动机启动后大约25年，日地距离开始有明显的增加，26年后开始进入远日点最远的绕日轨道，运动周期长达52年。启动后约78年，地球最后一次到达近日点，与太阳作了最后的“道别”，便逐渐远离太阳系，一去不回。

<center>
    <img src="pic/v30.jpg" width="300"/>
    <img src="pic/v85.jpg" width="300"/>
</center>

​	以上两张图反映了地球运动速度变化曲线。由图可知，地球在环绕过程中不断经历着动能-势能-动能的变化，我们得到地球在远日点速度较慢，近日点速度较快，这项结果符合开普勒第二定律及机械能守恒定律，一定程度上反映了计算所得结果的合理性。

<center>
    <img src="pic/v_30.jpg" width="300"/>
    <img src="pic/v_85.jpg" width="300"/>
</center>

​	以上两张图描绘了地球速率与日地距离的关系。这里我们更加直观地感受到了远日点速度较慢，近日点速度较快这一关系。起初日地距离变化不大时，曲线只在小氛围内来回摆动。随着日地距离的不断增加，地球运动速率变化幅度变得越来越大，最终在地球最后一次到达近日点后，地球速率到达太阳系内最大值，此后逃逸太阳，速率不断衰减，趋于一个恒定值。



## 后记

#### 例谈OOP思想[^1]

​	面向过程就是分析出解决问题所需要的步骤，然后用函数把这些步骤一步一步实现，使用的时候一个一个依次调用就可以了。 

​	面向对象编程（OOP，Object Oriented Programming）是把构成问题事务分解成各个对象，建立对象的目的不是为了完成一个步骤，而是为了描叙某个事物在整个解决问题的步骤中的行为。

​	例如五子棋，面向过程的设计思路就是首先分析问题的步骤：1、开始游戏，2、黑子先走，3、绘制画面，4、判断输赢，5、轮到白子，6、绘制画面，7、判断输赢，8、返回步骤2，9、输出最后结果。把上面每个步骤用分别的函数来实现，问题就解决了。

​	而面向对象的设计则是从另外的思路来解决问题。整个五子棋可以分为   1、黑白双方，这两方的行为是一模一样的，2、棋盘系统，负责绘制画面，3、规则系统，负责判定诸如犯规、输赢等。第一类对象（玩家对象）负责接受用户输入，并告知第二类对象（棋盘对象）棋子布局的变化，棋盘对象接收到了棋子的i变化就要负责在屏幕上面显示出这种变化，同时利用第三类对象（规则系统）来对棋局进行判定。

​	可以明显地看出，面向对象是以功能来划分问题，而不是步骤。同样是绘制棋局，这样的行为在面向过程的设计中分散在了总多步骤中，很可能出现不同的绘制版本，因为通常设计人员会考虑到实际情况进行各种各样的简化。而面向对象的设计中，绘图只可能在棋盘对象中出现，从而保证了绘图的统一。

​	功能上的统一保证了面向对象设计的可扩展性。比如我要加入悔棋的功能，如果要改动面向过程的设计，那么从输入到判断到显示这一连串的步骤都要改动，甚至步骤之间的循序都要进行大规模调整。如果是面向对象的话，只用改动棋盘对象就行了，棋盘系统保存了黑白双方的棋谱，简单回溯就可以了，而显示和规则判断则不用顾及，同时整个对对象功能的调用顺序都没有变化，改动只是局部的。

​	再比如我要把这个五子棋游戏改为围棋游戏，如果你是面向过程设计，那么五子棋的规则就分布在了你的程序的每一个角落，要改动还不如重写。但是如果你当初就是面向对象的设计，那么你只用改动规则对象就可以了，五子棋和围棋的区别不就是规则吗？（当然棋盘大小好像也不一样，但是你会觉得这是一个难题吗？直接在棋盘对象中进行一番小改动就可以了。）而下棋的大致步骤从面向对象的角度来看没有任何变化。  

#### 创作历程

​	这学期时间紧、任务重，能够基本完成这个拓展包的框架实在是意料之外的事。在上这堂课之前，我在Java编程领域已经相当熟悉了，突然被MATLAB的环境包围，感觉很不适应，就开始寻求和Java接驳的方式。最开始我只是想“复现”一个ArrayList，甚至于这个ArrayList能不能最终运转起来都没考虑过。也许是漫长的会议太无聊，或者是心血来潮打开Eclipse和MATLAB，我就能一动不动的肝一天。当ArrayList终于跑起来的时候，我已经早已不满足于ArrayList了，而是开始思考一个叫“MATLAB extension package”的东西。我希望能按照Java的范式还原一些常用的类，能让使用MATLAB像使用Java那样简单，能够让“MATLAB公式速查”这种本不该存在的东西彻底消失，至少在我这里是这样。(公式和函数怎么能是“查”的呢?应该是“就该是那样”，以至于在你没看到函数的时候就能猜出来实现这个功能的函数应该长什么样子。)

​	MATLAB其实对Java的支持是很好的，不论是ArrayList还是数据类型之间的转化都有着细致的考虑。甚至只需要一句`import java.lang.*;`就可以像写Java代码那样调用Java的API。这些都远不是我作为业余开发者一个人能完成的。但是当群里同学反映Java数据类型和MATLAB数据类型转换出现问题时，我意识到，靠Java“接济”的生活是走不远的，我能做的是要么适应MATLAB，要么改变MATLAB。于是我想都没想就选择了后者(笑)。

​	要想改变MATLAB，就不得不和较为底层的内容以及大量的MATLAB原生函数打交道。渐渐的，我开始了解到MATLAB中合理的部分，以及在版本迭代中下定的决心和付出的努力。我仿佛看到了众多工程师想要让这门语言越来越好的决心。

​	MATLAB的数据结构是针对MATLAB特点量体裁衣、深度定制的，就算其中存在些许不合理，成年累月积累的相关函数和方法论也不是说变就变的。这也和MATLAB的使用人群有关：大家需要的是一种简单的得到结果的工具。MATLAB作为现成的工具的集合，能让熟悉这个领域的人用几行命令完成运算，这就够了。它不涉及系统的框架和组织结构，因为这种脚本式的计算程序往往都不会太长。毕竟，使用MATLAB的绝大多数人只是把它当做工具而不是目的。“术业有专攻”，就像不会有人把Java用在大型桌面程序和科学运算上，每门编程语言都有它自己的适用范围，适合的才是最好的。

​	至于这个拓展包，客观上让我接触了很多正常学习MATLAB中不会碰到的问题，是很有意义的。特别在IO部分设计的比较精巧，也算是用另一种方式实现了overload了吧(笑)。一些比较完善的类，像ArrayList之类可能会在以后的实践中长期使用，这还是很有价值的，毕竟用到拓展包的机会不多，总是完整的带着感觉也挺碍事儿的。

​	另外，关于Java和MATLAB数据转换的问题，这几天我自己试的时候没毛病啊？？搞不好MATLAB没提供Collection框架就是对自己的数据结构和Java的对接很有自信吧(若有所思)。如果还有机会发展这个拓展包的话，希望能成为一个在MATLAB和Java之间起到桥梁作用的一个工具吧。

​	从开始有这个打算到动手写代码，到documentation的完善，前前后后大半个学期过去了，期间有不少内容已经先行贴在我的公众号和github上了。做出来点东西总归还是会有成就感的。期间赵虎老师对该文档的内容提出了建议也在同学电脑上测试过代码稳健性，这里要向老师和这些同学表示感谢，他们对我的支持激励着我挤出时间完成了这个工程。





