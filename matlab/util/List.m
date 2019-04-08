classdef(Abstract) List < Collection
    methods(Abstract)
          obj = contains(obj)
          obj = get(obj,index)
          element = set(obj,index,element)
          obj = remove(obj,index)
          add(obj,index,element)
          obj = indexOf(obj,element)
    end
end
     
 
