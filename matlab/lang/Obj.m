classdef Obj < handle % extends handle class
    % all superclasses of MyClass Object
    % interface implements to Matlab Classes
    methods
        function flag = eq(obj,~); %�ж����������Ƿ����
            flag = 1 == 0;
        end
    end
    methods
        function obj = toString(obj) %��ʽ����ӡ����ӿ�
        end %Ĭ��ʵ��
    end
end