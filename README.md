# MATLAB分形参考思路

##### 基本思路

​	这些题目相对复杂，但是每次完成的任务都很类似，故可以使用面向对象的思想。

##### 线段类

三个题目都反复用到了线段，所以线段是一个重要的对象。

```matlab

classdef Line < Obj
end    
```

​	在properties里面，我们声明了线段基本的描述方式，即两个端点x1,x2,y1,y2,通过这4个参数构造线段对象。同时在方法里面还声明了线段平移，旋转，取负数，获得长度，绘图等常用方法。

##### 可分形线段类

​	但是，一个普通的线段没有取等分点、分形等方法，所以我写了子类FractalLine，继承自Line类，代码如下：

```matlab
classdef FractalLine < Line % extends Line
end
```

​	这个类更像是Line类的实现类，分形具体的过程就在这个类中。

##### 迭代操作函数

​	如何实例化一个可分形线段类，并让它迭代起来呢？我把这个过程写在了一个主函数中：

```matlab
function fractalPlot(questionNum,n)
end
```

##### 入口函数

​	为了方便的调用，将迭代封装成函数后由入口函数调用：

```matlab
function main(questionNumber,n)%questionNumber是题目序号，n是循环迭代次数
    fractalPlot(questionNumber,n);
end
```

​	这样在绘图的时候直接调用`main(questionNumber,n)%questionNumber是题目序号，n是循环迭代次数`就可以实现绘图啦。

##### 工具类

​	可能你已经注意到了，Line类是继承自Obj类的，那么Obj到底是什么呢？事实上，MATLAB中所有类都是继承自handle类的；而我们自己写的Obj(即Object，对象)继承自handle类，可以说在MATLAB标准类和我们自己写的类之间起到了承上启下的作用。

​	另外，程序中用到的ArrayList类是仿照Java的范式在MATLAB中重写的精简的线性表类，使用起来十分方便。同时，使用纯MATLAB重写，避免了数据类型不兼容的问题。ArrayList依次继承自Collection类、List类。

Obj类：

```matlab
classdef(Abstract) Obj < handle % extends handle class
    % all superclasses of MyClass Object
    % interface implements to Matlab Classes
end
```

Collection类：

```matlab
classdef (Abstract = true) Collection < Obj
end
   
```

List类：

```matlab
classdef(Abstract) List < Collection
end
```

ArrayList类：

```matlab
classdef ArrayList < List 
    %list的实现类
    % author : Cocca
    % date :2019/03/30
end
```

​	在画分形线段时，需要按照相应的文件名复原工具类。


