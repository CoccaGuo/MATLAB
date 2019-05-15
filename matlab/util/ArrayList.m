classdef ArrayList < List 
    %list��ʵ����
    %(final)��Ҫ�޸������Ĺ��췽�����޸�ǰ��==����==����汾��
    % author : Cocca
    % date :2019/03/30
    properties
        objArr;
        size;
    end
    methods
        function obj = ArrayList(varargin)
            if nargin == 0
                obj.size = 0;
                obj.objArr = [];
            end
            if nargin == 1
                obj.size = 0;
                obj.objArr = [varargin{1}];
                 cache = varargin{1};
                if ismatrix(cache) % Construct by matlab vectors
                    [m,n] = size(cache);
                   if m == 1 && n > 1 %ֻ��һ��������������
                       for i = 1:n
                           obj.add(cache(i));
                       end
                   end
                end
            end
        end
        function flag = check(obj,index)
            if index < 1 && index > obj.size
                error("IndexOutOfBorderException");
                return
            end
            flag = 1;
        end
        function size = getSize(obj)
            size = obj.size;
        end
        function flag = isEmpty(obj)
            if obj.size == 0
                flag = 1;
            else
                flag =0;
            end
        end
        function index = contains(obj,object)
            index = find(obj.objArr == object);
        end
        function element = get(obj,index)
            if check(obj,index) == 1
            element = obj.objArr(index);
            end
        end
        function element = set(obj,index,element)
             if check(obj,index) ~= 1
                return
             end
             obj.objArr(index) = element;
        end
        function obj = remove(obj,index)
            if check(obj,index) == 1
                obj.objArr(index) = [];
                obj.size = obj.size - 1;
            end
        end
        function obj = add(obj,element)
            obj.size = obj.size + 1;
            obj.objArr(obj.size) = element;
            %flag = 1;
        end
        function index = indexOf(obj,item)
            for i = 1:obj.getSize()
                if eq(obj.objArr(i),item)
                    index = i;
                    return;
                end
            end
            index = -1;
        end
        function obj = removeAll(obj)
            obj.objArr = [];
            obj.size = 0;
        end
        function obj = addAll(obj,objectList)
           obj.objArr = [obj.objArr objectList.objArr];
           obj.size = obj.size + objectList.size;
        end
         function print(obj) %deprecated, override toString instead.
            for cursor = 1:obj.getSize()
                obj.objArr(cursor).print(); 
            end
         end
         function string = toString(obj)
             string = String();
            for cursor = 1:obj.getSize()
                 string = string + obj.objArr(cursor).toString(); 
            end
        end
        function flag = eq(obj,obj2)
            for cursor = 1:obj.getSize()
               if ~eq(obj.objArr(cursor),(obj2.objArr(cursor)))
                   flag = (1==0);
                   return;
               end
            end
               flag = 1 == 1;         
        end
    end
end