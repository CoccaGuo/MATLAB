# MATLAB extension package cookbook

%%使用说明和创作思路

## 数据类型

## 输入和输出

### 控制台输入和输出

##### 使用(matlab.lang.)System.out.*输出

*`System.out`是一个`matlab.io.PrintStream`对象。*

使用`System.out.println(Object printableObject)`换行输出。

使用`System.out.print(Object printableObject)`不换行输出。

使用`System.err.println(Object printableObject)`换行输出错误并停止程序。

##### 使用(matlab.lang.)System.in.*输入

*`System.in`是一个`matlab.io.InputStream`对象。*

使用`byte System.in.read()`方法从命令行窗口读取一个字节,返回一个int8类型数据。

使用`byte[] System.in.readLine()`方法从命令行窗口读取一行信息，使用回车键结束。返回int8数组。

使用` Number System.in.readNumber()`方法从命令行窗口读取一个数,返回一个Number对象。

使用` num System.in.readNumber()`方法从命令行窗口读取一个数,返回一个MATLAB默认的double类型数据。

使用`String System.in.readString()`方法从命令行窗口读取一行信息,返回一个String对象。

使用`string System.in.readMatlabString()`方法从命令行窗口读取一行信息,返回一个MATLAB默认的string类型数据。

##### 使用(matlab.util.)Scanner输入

###### 构造Scanner

在使用控制台输入时，用`sc = Scanner(System.in)`构造Scanner。

###### 使用Scanner中的方法

使用`logical hasNext()`方法判断是否有下一个元素。

使用`num nextNumber()`方法读取下一个数值。

使用`String nextLine()`方法读取下一行信息，返回一个String对象。

### 从文件输入和输出

##### (matlab.io.)File类

使用File类声明一个文件对象。

###### 构造File

使用`file = File(String path)`构造文件。其中path是文件的路径。

###### 使用File中的方法

使用`logical exists()`方法判断文件是否存在。

使用`logical makeNewFolder()`方法新建文件夹。成功建立返回1,否则返回0.

使用`logical makeNewFile()`方法新建文件。成功建立返回1,否则返回0.

##### (matlab.io.)FileInputStream类

使用FileInputStream类将文件作为二进制数据流读入。对于txt文件，可以按文本直接读取。编码格式为utf-8。

###### 构造FileInputStream

使用`FileInputStream(File file)`构造文件输入流。其中file是文件。

使用`FileInputStream(String path)`构造文件输入流。其中path是文件路径。

###### 使用FileInputStream中的方法

使用`open()`打开文件输入流。如果您在使用前忘记打开流，它将会自动打开。

使用`close()`关闭文件输入流。如果您在使用后忘记关闭流，MATLAB将会继续占用文件。

使用`byte[] readBytes()`读取文件的所有字节。返回int8数组。

使用`string readMatlabString()`读取一行utf-8编码的字符，返回一个MATLAB默认的string类型数据。

使用`String readString()`读取一行utf-8编码的字符，返回一个String对象。

##### (matlab.io.)FileOutputStream类

使用FileOutputStream类将二进制数据写入文件。对于txt文件，可以按文本直接写入。编码格式为utf-8。

###### 构造FileOutputStream

使用`FileOutputStream(File file)`构造文件输入流。其中file是文件。

使用`FileOutputStream(String path)`构造文件输入流。其中path是文件路径。

###### 使用FileOutputStream中的方法

使用`open()`打开文件输出流。如果您在使用前忘记打开流，它将会自动打开。

使用`close()`关闭文件输出流。如果您在使用后忘记关闭流，MATLAB将会继续占用文件。

使用`writeBytes(byte[])`将二进制数组写入文件。

使用`writeMatlabString(string string)`写入utf-8编码的MATLAB默认的string类型字符。

使用`writeString(String string)`写入utf-8编码的String字符。

##### (matlab.util.)Scanner类

您可以使用Scanner从文件读取。

###### 构造Scanner

使用`Scanner(InputStream fileInputStream)`构造扫描器。

###### 使用Scanner中的方法

使用`logical hasNext()`方法判断是否有下一个元素。

使用`String nextLine()`方法读取下一行信息，返回一个String对象。

##### (matlab.io.)PrintStream类

您可以使用PrintStream写入文件。

###### 构造PrintStream

使用`PrintStream(OutputStream fileOutputStream)`构造打印流。

###### 使用PrintStream中的方法

使用`print(Obj printableObject)`方法不换行写入文件。

使用`println(Obj printableObject)`方法换行写入文件。

> **关于Obj printableObject**
>
> Obj类是matlab包中所有类的超类。Obj类默认实现`toString()`方法，所以严格来说，所有的实例对象是可打印的对象。但是在大部分情况下，默认实现的`toString()`不完善，需要在实现类中重写。狭义的，我们把重写了`toString()`方法的对象成为可打印的对象(printableObject).

##### (matlab.io.)ExcelInputStream类

这个类不完善，方法和命名可能会改变。

您可以使用ExcelInputStream从文件读取。

###### 构造ExcelInputStream

使用`ExcelInputStream(File file)`构造Excel输入流。其中file是文件。

使用`ExcelInputStream(String path)`构造Excel输入流。其中path是文件路径。

###### 使用ExcelInputStream中的方法

使用`setSheet()`方法改变读取的sheet. 默认sheet为1.

使用`cell read()`方法读取该当sheet中的所有信息。返回元胞数组。

使用`cell readText()`方法读取该当sheet中的所有文本信息。返回元胞数组。

使用`array readNumber()`方法读取该当sheet中的所有数字信息。返回数组。
