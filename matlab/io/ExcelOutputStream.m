classdef ExcelOutputStream < Obj
    % 注意ExcelOutputStream不继承自OutputStream
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
         end
    end
end