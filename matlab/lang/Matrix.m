classdef Matrix < Obj
% can't be used
%为了提供更完善的体验，该类还在施工中。
    properties
        mat;
        list;
        m;
        n;
    end
    methods
        function obj = Matrix(varargin)
            if nargin == 0
                obj.mat = [];
                obj.list = ArrayList(ArrayList);
            end
            if nargin == 1 && ismatrix(varargin{1})
                obj.mat = varargin{1};
                obj.list = ArrayList(ArrayList);
                [obj.m,obj.n]=size(obj.mat);
                for i = 1:obj.m
                    cache = ArrayList(obj.mat(i,:));
                    obj.list.add(cache);
                end
            end
        end
        function list = toFlatArrayList(obj)
            list = ArrayList();
            for i = 1:obj.list.getSize
                list.addAll(obj.list.get(i));
            end
        end
        function arr = toFlatArray(obj)
            arr = obj.toFlatArrayList.toArray;
        end
        function list = toArrayList(obj)
            list = obj.list;
        end
        function mat = toMatlabMatrix(obj)
            mat = obj.mat;
        end
   
%         indexOf();
        
    end
end