classdef String < Obj
    % String类.注意String的方法不改变该当String，其地址值不会改变。
    % author:Cocca
    % date:2019/04/27
    properties
        str;
    end
    methods
        function obj = String(varargin)
           if nargin == 0
                obj.str = "";
            end
            if nargin == 1
                if isa(varargin{1},'string')
                obj.str = varargin{1};
                elseif isa(varargin{1},'char')
                 obj.str = string(varargin{1});  
                end
            end
        end
        function  flag = eq(obj,obj2)
            if isa(obj,'String') && isa(obj2,'String')
                flag = obj.str == obj2.str;
            elseif isa(obj,'String') && isa(obj2,'string')
                flag = obj.str == obj2;
            elseif isa(obj,'string') && isa(obj2,'String')
                flag = obj == obj2.str;
            end
        end
        function str = reverse(obj)
            str = String(obj.str.reverse);
        end
        function char = toCharArray(obj)
            char = obj.str.char;
        end 
        function flag = contains(obj,obj2)
            flag = obj.str.contains(obj2.str);
        end
         function index = indexOf(varargin)
             % 2 overload methods:
             % indexOf(obj,item)
             % indexOf(obj,item,fromIndex)
             obj = varargin{1};
             item = varargin{2};
             chars = obj.str.char;
             if nargin == 3
                 start = varargin{3};
             else
                 start = 1;
             end
            for i = start:obj.length()
                if eq(chars(i),item)
                    index = i;
                    return;
                end
            end
            index = -1; % 没找到
         end
         function strVal = substring(obj,start,endd)%注意索引值从1开始
             chars = obj.str.char;
             strVal = String(string(chars(start:endd)));
         end
        function list = split(obj,regex)%regex也要封装成String
            list = ArrayList(String);
             res = split(obj.str,regex);
             for i = 1:length(res)
                 list.add(String(res(i)));
             end
           end

        function print(obj)
            fprintf('%s',obj.str);
        end
        function println(obj)
             disp(obj.str);
        end
%         function disp(obj) %override the original method
%             disp(obj.str);
%         end
% 在使用 [String("") String("")]时报错。
%不要随便重写disp方法，因为是MATLAB原生函数，可能会遇到问题。
%建议重写toString方法,由System.out.println方法调用。
        function obj = toString(obj)
        end
        function str = toMatlabString(obj)
            str = obj.str;
        end
        function str = getMatlabString(obj)
            str = obj.str;
        end
        function l = length(obj)
            l = length(obj.toCharArray);
        end
        function flag = isEmpty(obj)
            flag = obj.length==0;
        end
        function char = charAt(obj,index)
            charStr = obj.str.char();
            char = charStr(index);
        end
        function obj = toUpperCase(obj)
            obj.str = upper(obj.str);
        end
        function obj = toLowerCase(obj)
             obj.str = lower(obj.str);
        end
        function obj = plus(obj,obj2)
            if isa(obj,'String') && isa(obj2,'String')
                obj.str = obj.str+obj2.str;
            elseif isa(obj,'String') && isa(obj2,'string')
                obj.str = obj.str + obj2;
            elseif isa(obj,'string') && isa(obj2,'String')
                obj.str = obj + obj2.str;
            end
        end
    end
end