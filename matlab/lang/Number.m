classdef Number < Obj
    properties
        num;
    end
    methods(Static)
        function num = parseNumber(str) %注意返回的是num不是Number对象
            if isa(str,'ArrayList')
                num = zeros(1,str.getSize);
                for i = 1: str.getSize
                   num(i) = Number.parseNumber(str.get(i));
                end
            end
            if isa(str,'string')
            num = double(str);
            elseif isa(str,'String')
                num = double(str.str);
            end
        end
    end
    methods
        function obj = Number(varargin)
            if nargin == 0
                obj.num = 0;
            elseif nargin == 1
                obj.num = varargin{1}; %由传入数构造一个Number
            end
        end
        function res = plus(obj,obj2)
            res = Number(obj.num+obj2.num);
        end
        function res = minus(obj,obj2)
            res = Number(obj.num-obj2.num);
        end
        function res = uminus(obj)
           res = Number(-obj.num); 
        end
        function res = times(obj,obj2)
           res = Number(obj.num.*obj2.num); 
        end
        function res = rdivide(obj,obj2)
            res = Number(obj.num./obj2.num);
        end
         function res = power(obj,obj2)
           res = Number(obj.num.^obj2.num); 
         end
         function flag = gt(obj,obj2)
           flag = obj.num > obj2.num;
         end
         function flag = lt(obj,obj2)
          flag = obj.num < obj2.num; 
        end
        function num = getNumber(obj)% 手动拆箱
            num = obj.num;
        end
         function num = toMatlabNumber(obj)% 手动拆箱
            num = obj.num;
        end
        function flag = eq(obj,anotherObj)
            flag = obj.num == anotherObj.num;
        end
        function print(obj)
            System.out.print(string(obj.num));
        end
        function str = toString(obj)
            str = String(string(obj.num));
        end
    end
end