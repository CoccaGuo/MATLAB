classdef FuncObj < Obj
    %传入符号形式的函数或函数句柄
    %自变量是一元函数
    properties
        func;
    end 
    methods
        function obj = FuncObj(inputFunc)%传入符号形式的函数或函数句柄
            if isa(inputFunc,'function_handle')
                syms x;
                obj.func = inputFunc(x);
            else
                obj.func = inputFunc;
            end
        end
        function res = calc(obj,arg)
            f = matlabFunction(obj.func);
            res  = f(arg);
        end
        function func_handle = handle(obj)
            func_handle = matlabFunction(obj.func);
        end
    end
end