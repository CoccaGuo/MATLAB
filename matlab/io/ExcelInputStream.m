classdef ExcelInputStream < Obj
    % 注意ExcelInputStream不继承自InputStream
    % 该类是对native方法的封装，不存在继承关系
    properties
        file;
        sheet;
    end
    methods
         function obj = ExcelInputStream(file)%使用file构造
            if isa(file,'File')
                obj.file = file;
               
            elseif isa(file,'string')||isa(file,'String')
                obj.file = File(file);
                
            end
            obj.sheet = 1;
            obj.inputMethod = 2;%从文件读入
         end
         function setSheet(obj,sheetCount)
             obj.sheet = sheetCount;
         end
         function num = readNumber(obj)
             [num,~,~]=xlsread(obj.file.path.toCharArray,obj.sheet);
         end
          function txt = readText(obj)
             [~,txt,~]=xlsread(obj.file.path.toCharArray,obj.sheet);
          end
          function all = readAll(obj)
            [~,~,all]=xlsread(obj.file.path.toCharArray,obj.sheet);
          end  
          function all = read(obj)
            [~,~,all]=xlsread(obj.file.path.toCharArray,obj.sheet);
          end  
          function data = readRange(obj,fromStr,toStr)
              range  = fromStr+":"+toStr;
            [data]=xlsread(obj.file.path.toCharArray,obj.sheet,range.char);
          end
    end
end