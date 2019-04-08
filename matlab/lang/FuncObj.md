# 函数的传递

#### 传入一个函数

MATLAB中的大多数计算都由函数完成。比如：

`sin(pi) /plot(x,y)/changScore(file)%自定义函数`

设想一下如果我们想把函数作为参数在不同函数间传递，那我们应该怎么做?举个例子，计算某个函数在特定区间上的==数值积分==。这时函数应该写成：

`NumeralIntegration(function,start,end)`

其中`function `是系统函数或自定义函数。但是在写`NumeralIntegration`具体内容的时候，我们会发现直接调用`function(pi)`是会报错的，因为没有定义名为function的函数(在这里function是关键字就更不行了)。

#### 函数句柄和符号类型转化

函数本身涉及到函数句柄比较复杂。我们可以将函数转化成符号变量，传递后再在新的函数体中还原成函数句柄。相当于在传递时先“压缩装箱”，传递之后再“解压缩”。例子：

```matlab
%压缩%
f = @(x)x^2; %function handle
syms x;
symbol_func = f(x); %symbol_function
%使用symbol_func在不同函数体之间传递%
%一顿操作……
%解压%
f = matlabFunction(symbol_func);
f(2) %return 4
```

这样就可以在不同函数间传递函数句柄了。

#### 封装成函数对象

每次传递函数时都要压缩解压，比较麻烦。可以直接写到一个函数对象类中：`FuncObj`

构造方法中可以传入符号函数类型或者函数句柄。调用`funcObj.calc(2);`可以直接返回计算结果`4`。下面给出使用的例子:

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

这样，在声明新的函数的时候，将传入的参数定义成`funcObj`,就可以直接调用`funcObj,calc()`计算啦。是不是非常方便呢。
