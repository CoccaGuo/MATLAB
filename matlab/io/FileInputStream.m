classdef FileInputStream < InputStream
    %���ļ���Ϊ���������������롣
    %����txt�ļ�������ֱ��ʹ��readString������ȡ�ı���Ĭ��ʵ�֣�
    %ͳһ����utf-8���롣
    properties
        file;
        fileID;
        isOpen;
    end
    methods
        function obj = FileInputStream(file)%ʹ��file����
            if isa(file,'File')
                obj.file = file;
                obj.isOpen = (1 == 0);
            elseif isa(file,'string')||isa(file,'String')
                obj.file = File(file);
                obj.isOpen = (1 == 0);
            end
            obj.inputMethod = 2;%���ļ�����
        end
        function string = readString(obj)
            string = String(readMatlabString(obj));
        end
        function str = readMatlabString(obj)
            if ~obj.isOpen
                obj.open;
            end
            res = fgetl(obj.fileID);
            if res == -1
                res = '';
            end
            str = string(res);
        end
        function  str = readBytes(obj) %return the array of bytes
            if ~obj.isOpen
                obj.open;
            end
           str = fread(obj.fileID);
        end
        function flag = open(obj)%����isOpen
            if ~obj.file.exists
                System.err.println("�ļ�������");
                return;
            end
            try
            obj.fileID = fopen(obj.file.path.str.char,'r','n','UTF-8');%file should be encoded in utf-8
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