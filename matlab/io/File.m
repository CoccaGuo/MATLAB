classdef File < Obj
    properties
        path;
    end
    methods
        function obj = File(string)
            if isa(string,'String')
            obj.path = string;
            else 
             obj.path = String(string);
            end
        end
        function flag = exists(obj)
           flag = ~exist(obj.path.toMatlabString,'file') == 0;
        end 
        function flag = makeNewFolder(obj)
            flag = mkdir(obj.path.toCharArray);
        end
        function flag = mkdir(obj)
            flag = mkdir(obj.path.toCharArray);
        end
        function flag = makeNewFile(obj)
             tag = fopen(obj.path.toCharArray,'a');
             fclose(tag);
            flag = obj.exists;
        end
    end
end