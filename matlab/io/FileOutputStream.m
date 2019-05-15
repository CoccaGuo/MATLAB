classdef FileOutputStream < OutputStream
    % 使用2进制输出。默认实现txt输出成utf-8文档。
    properties
        file;
        isOpen;
        fileID;
    end
     methods
        function obj = FileOutputStream(file)%使用file构造
            if isa(file,'File')
                obj.file = file;
                obj.isOpen = (1 == 0);
            elseif isa(file,'string')||isa(file,'String')
                obj.file = File(file);
                obj.isOpen = (1 == 0);
            end
        end
        function writeString(obj,string)%主要针对txt的默认实现。
            writeMatlabString(obj,string.toMatlabString);
        end
        function writeMatlabString(obj,string)
            if ~obj.isOpen
                obj.open;
            end
            fprintf(obj.fileID,string);
        end
        function writeBytes(obj,bytes)
            if ~obj.isOpen
                obj.open;
            end
           fwrite(obj.fileID,bytes);
        end
        function flag = open(obj)%返回isOpen
            try
            obj.fileID = fopen(obj.file.path.str.char,'a','n','UTF-8');%file should be encoded in utf-8
           % obj.fileID = fopen(obj.file.path.str.char); 
           obj.isOpen = (1 == 1);
            flag = obj.isOpen;
            catch
                flag = (1 == 0);
                obj.isOpen = (1 == 0);
            end
        end
        function flag = close(obj)%返回isOpen
            if obj.isOpen
                fclose(obj.fileID);
                obj.isOpen = (1 == 0);
                flag = obj.isOpen;
            end
        end
    end
end