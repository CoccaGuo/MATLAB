classdef(Abstract) Obj < handle % extends handle class
    % all superclasses of MyClass Object
    % interface implements to Matlab Classes
    methods(Abstract)
     flag = eq(obj,anotherObj); %�ж����������Ƿ���� 
     print(obj); %��ʽ����ӡ����
    end
end