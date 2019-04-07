classdef(Abstract) Obj < handle % extends handle class
    % all superclasses of MyClass Object
    % interface implements to Matlab Classes
    methods(Abstract)
     flag = eq(obj,anotherObj); %判断两个对象是否相等 
     print(obj); %格式化打印对象
    end
end