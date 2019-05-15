classdef ArrayList < List 
    %list的实现类
    %(final)不要修改这个类的构造方法。修改前请==备份==这个版本。
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
                obj.objArr = [Number];
            end
            if nargin == 1
                obj.size = 0;
                if isa(varargin{1},'double')
                    obj.objArr = [Number];
                else
                    obj.objArr = [varargin{1}];
                end
                 cache = varargin{1};
                if ismatrix(cache) % Construct by matlab vectors
                    [m,n] = size(cache);
                    if m >1 && n == 1 
                        cache = cache';
                    end
                    [m,n] = size(cache);
                   if m == 1 && n > 1 %只有一行且至少有两列
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
        function arr = toArray(obj)
            if isa(obj.objArr,'Number')
                arr = zeros(1,obj.size);
                for i = 1:obj.size
                    arr(i) = obj.get(i).getNumber();
                end
             else
                arr = obj.objArr;
            end
        end
        function index = contains(obj,object)
            if isa(object,'double')
                index = find(obj.objArr == Number(object));
            else
                index = find(obj.objArr == object);
            end
        end
        function element = get(obj,index)
            if check(obj,index) == 1
                if isa(obj.objArr,'Number')
                    element = obj.objArr(index).getNumber();
                else
                    element = obj.objArr(index);
                end
            end
        end
        function element = set(obj,index,element)
             if check(obj,index) ~= 1
                return
             end
             if isa(element,'double')
                 obj.objArr(index) = Number(element);
             else
                 obj.objArr(index) = element;
             end
        end
        function obj = remove(obj,index)
            if check(obj,index) == 1
                obj.objArr(index) = [];
                obj.size = obj.size - 1;
            end
        end
        function obj = add(obj,element)
            obj.size = obj.size + 1;
            if isa(element,'double')
                 obj.objArr(obj.size) = Number(element);
             else
                 obj.objArr(obj.size) = element;
            end
            %flag = 1;
        end
        function index = indexOf(obj,item)
            if isa(item,'double')
                for i = 1:obj.getSize()
                    if eq(obj.objArr(i),Number(item))
                        index = i;
                        return;
                    end
                end 
              
             else
                for i = 1:obj.getSize()
                    if eq(obj.objArr(i),item)
                        index = i;
                        return;
                    end
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
         
         function string = toString(varargin)
            if nargin == 1
                as = " ";%默认的分隔符是空格
            else
                as = varargin{2};
            end
             string = String();
             obj = varargin{1};
            if obj.getSize > 1
                for cursor = 1:obj.getSize()-1
                    string = string + obj.objArr(cursor).toString()+as; 
                end
                string = string + obj.objArr(obj.getSize).toString();
            elseif obj.getSize == 1
                string = obj.objArr(obj.getSize).toString();
            else
                string = String();
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