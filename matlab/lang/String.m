classdef String < Obj
    properties
        str;
    end
    methods
        function obj = String(varargin)
           if nargin == 0
                obj.str = "";
            end
            if nargin == 1
            obj.str = varargin{1};
            end
        end
        function  obj = eq(obj)
        end
        function print(obj)
            fprintf('%s',obj.str);
        end
        function println(obj)
             disp(obj.str);
        end
        function disp(obj) %override the original method
            disp(obj.str);
        end
        function l = length(obj)
            l = strlength(obj.str);
        end
        function flag = isEmpty(obj)
            flag = obj.length==0;
        end
        function char = charAt(obj,index)
            
        end
        function obj = toUpperCase(obj)
            obj.str = upper(obj.str);
        end
        function obj = toLowerCase(obj)
             obj.str = lower(obj.str);
        end
        function obj = plus(obj,obj2)
            obj.str = obj.str+obj2.str;
        end
    end
end