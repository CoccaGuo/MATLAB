classdef Scanner < Obj
    % Scanner 
    % author: Cocca
    % date:2019/04/27
    properties
       inputStream;
       cache = String();
    end
    methods
        %渐渐可以远离MATLAB底层了。
        function obj = Scanner(varargin)
            if nargin == 0
                System.err.println("Scanner类需要使用InputStream构造。");
            end
            if nargin == 1
                if ~isa(varargin{1},'InputStream')
                    System.err.println("Scanner类应该由InputStream构造。");
                else
                    obj.inputStream = varargin{1};
                end
            end
        end
        function string = nextLine(obj)
                if obj.cache.length == 0
                string = obj.inputStream.readString();
                else
                    string = obj.cache;
                    obj.cache = String();
                end
        end
        function number = nextNumber(obj)
                if obj.cache.length == 0
                    number = obj.inputStream.readNumber();
                else
                    number = Number.parseNumber(obj.cache);
                    obj.cache = String();
                end
        end
        function flag = hasNext(obj)
            %判断是否有next的标准是下一行长度是否为零。
            %在文档中，可能出现一行空行的情况。fgetl函数(默认)不返回-1即可。
                obj.cache = obj.inputStream.readString();
                flag = obj.cache.length() ~= 0;
        end
        function obj = eq(obj)
        end
        function obj = print(obj)
        end
end
end
