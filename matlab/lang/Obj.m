classdef Obj < handle
    % all superclasses of MyClass Object
    % interface implements to Matlab Classes
    methods
        function flag = eq(obj,~); %判断两个对象是否相等
            flag = 1 == 0;
        end
    end
    methods
        function obj = toString(obj) %格式化打印输出接口
        end %默认实现
    end
end