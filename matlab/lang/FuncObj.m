classdef FuncObj < Obj
    %���������ʽ�ĺ����������
    %�Ա�����һԪ����
    properties
        func;
    end 
    methods
        function obj = FuncObj(inputFunc)%���������ʽ�ĺ����������
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