classdef ExcelOutputStream < Obj
    % ע��ExcelOutputStream���̳���OutputStream
    % �����Ƕ�native�����ķ�װ�������ڼ̳й�ϵ
    properties
        file;
        sheet;
    end
    methods
         function obj = ExcelInputStream(file)%ʹ��file����
            if isa(file,'File')
                obj.file = file;
               
            elseif isa(file,'string')||isa(file,'String')
                obj.file = File(file); 
            end
            obj.sheet = 1;
         end
    end
end