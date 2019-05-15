classdef FileOutputStream < OutputStream
    % ʹ��2���������Ĭ��ʵ��txt�����utf-8�ĵ���
    properties
        file;
        isOpen;
        fileID;
    end
     methods
        function obj = FileOutputStream(file)%ʹ��file����
            if isa(file,'File')
                obj.file = file;
                obj.isOpen = (1 == 0);
            elseif isa(file,'string')||isa(file,'String')
                obj.file = File(file);
                obj.isOpen = (1 == 0);
            end
        end
        function writeString(obj,string)%��Ҫ���txt��Ĭ��ʵ�֡�
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
        function flag = open(obj)%����isOpen
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
        function flag = close(obj)%����isOpen
            if obj.isOpen
                fclose(obj.fileID);
                obj.isOpen = (1 == 0);
                flag = obj.isOpen;
            end
        end
    end
end