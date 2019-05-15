classdef InputStream < Obj
    properties  
        inputMethod;
        % 1： 从命令行窗口读入
        % 2： 从文件读入
    end
    methods
        function res = read(obj) % Reads the next byte of data from the input stream.(read i byte(int8)at a time.the same with Java)
            if obj.inputMethod == 1
               res = int8(input('','s'));
               res = res(1);
            end
        end
         function res = readLine(obj) % Reads all bytes of data from the input stream.new.
            if obj.inputMethod == 1
               res = int8(input('','s'));
            end
         end
         function res = readMatlabNumber(obj) % read a number.new
            if obj.inputMethod == 1
               res = input('');
            end
         end
        function number = readNumber(obj) % read a number.new
            if obj.inputMethod == 1
               res = input('');
               number = Number(res);
            end
        end
        function res = readString(obj) % read string.returns a String Object.
            if obj.inputMethod == 1
               res = input('','s');
               res = String(string(res));
            end
        end
         function res = readMatlabString(obj) % read string.returns a matlab string with"".
            if obj.inputMethod == 1
               res = input('','s');
               res = string(res);
            end
        end
    end
    methods
        function obj = InputStream(varargin)
            if nargin == 1 
                if varargin{1}=="defaultInput"
                    obj.inputMethod = 1; %input form the console 控制台输入流
                end
            end
        end
        function res = Uread(obj,byteArray,off,length)% 默认实现的read方法
            if len==0
                res = 0;
                return;
            end
            c = obj.read();
            if c==-1
                res = -1;
            end
            byteArray(off) = int8(c);
            try
                for i = 1:length
                    c = obj.read();
                    if c==-1
                        break;
                    end
                    byteArray(off+i) = int8(c);
                end
            catch
            end
            res = i;
        end
        function obj = print(obj)
        end
        function obj = eq(obj)
        end
    end
end