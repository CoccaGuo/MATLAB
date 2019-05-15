classdef PrintStream < Obj % 修改默认输出需要重写Obj类中toString方法 
    properties
        outputMethod = 0;
        outputStream;
    end
    methods
        function obj = PrintStream(varargin)
            if nargin == 0
                System.err.print("请使用OutputStream构造。");
            end
            if nargin == 1
                if varargin{1}=="errorOutput"
                    obj.outputMethod = 1;
                end
                if  isa(varargin{1},'OutputStream')
                    obj.outputMethod = 2;
                    obj.outputStream = varargin{1};
                end
            end
        end 
        function print(obj,printableObj)
            if obj.outputMethod==0 %控制台正常输出
                 if isa(printableObj,'string')%照顾到原生的默认string
                fprintf("%s",printableObj);
                 else
                fprintf('%s',printableObj.toString.toMatlabString);
                end
            end
            if obj.outputMethod==1 %控制台错误输出
                if isa(printableObj,'string')
                error("%s",printableObj);
                fprintf("%c",8);
                else
                error("%s",printableObj.toString.toMatlabString);
                fprintf("%c",8);
                end
            end 
            if obj.outputMethod==2 %输出流输出
                 if isa(printableObj,'string')%照顾到原生的默认string
                fprintf(obj.outputStream.fileID,"%s",printableObj);
                 else
                fprintf(obj.outputStream.fileID,'%s',printableObj.toString.toMatlabString);
                end
            end
        end
        function println(obj,printableObj)
            if obj.outputMethod==0
                if isa(printableObj,'string')
                disp(printableObj);
                else
               disp(printableObj.toString.toMatlabString);
                end
            end
            if obj.outputMethod==1 %错误输出
                if isa(printableObj,'string')
                    error("%s",printableObj);
                else
                    error("%s",printableObj.toString.toMatlabString);
                end
            end 
            if obj.outputMethod==2 %输出流输出
                 if isa(printableObj,'string')%照顾到原生的默认string
                fprintf(obj.outputStream.fileID,"%s\r\n",printableObj);
                 else
                fprintf(obj.outputStream.fileID,'%s\r\n',printableObj.toString.toMatlabString);
                end
            end
        end
        
        function obj = eq(obj)
        end
    end
end