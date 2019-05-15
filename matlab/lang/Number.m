classdef Number < Obj
    properties
        num;
    end
    methods(Static)
        function num = parseNumber(str) %ע�ⷵ�ص���num����Number����
            num = double(str);
        end
    end
    methods
        function obj = Number(varargin)
            if nargin == 0
                obj.num = 0;
            elseif nargin == 1
                obj.num = varargin{1}; %�ɴ���������һ��Number
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
        function num = getNumber(obj)% �ֶ�����
            num = obj.num;
        end
        function flag = eq(obj,anotherObj)
            flag = obj.num == anotherObj.num;
        end
        function print(obj)
            System.out.print(obj.num);
        end
    end
end