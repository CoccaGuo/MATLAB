classdef (Abstract = true) Collection < Obj
    methods(Abstract)
          obj = getSize(obj)      
          obj = isEmpty(obj) 
          obj = add(obj,element)
          obj = remove(obj,index)
          obj = addAll(obj,objectList)
          obj = removeAll(obj)
    end
end
     
 