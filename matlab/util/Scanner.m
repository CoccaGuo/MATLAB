classdef Scanner < Obj
    % Scanner 
    % author: Cocca
    % date:2019/04/27
    properties
       inputStream;
       cache = String();
    end
    methods
        %��������Զ��MATLAB�ײ��ˡ�
        function obj = Scanner(varargin)
            if nargin == 0
                System.err.println("Scanner����Ҫʹ��InputStream���졣");
            end
            if nargin == 1
                if ~isa(varargin{1},'InputStream')
                    System.err.println("Scanner��Ӧ����InputStream���졣");
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
            %�ж��Ƿ���next�ı�׼����һ�г����Ƿ�Ϊ�㡣
            %���ĵ��У����ܳ���һ�п��е������fgetl����(Ĭ��)������-1���ɡ�
                obj.cache = obj.inputStream.readString();
                flag = obj.cache.length() ~= 0;
        end
        function obj = eq(obj)
        end
        function obj = print(obj)
        end
end
end
