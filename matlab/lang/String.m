classdef String < Obj
    % String��.ע��String�ķ������ı�õ�String�����ֵַ����ı䡣
    % author:Cocca
    % date:2019/04/27
    properties
        str;
    end
    methods
        function obj = String(varargin)
           if nargin == 0
                obj.str = "";
            end
            if nargin == 1
            obj.str = varargin{1};
            end
        end
        function  flag = eq(obj,obj2)
            if isa(obj,'String') && isa(obj2,'String')
                flag = obj.str == obj2.str;
            elseif isa(obj,'String') && isa(obj2,'string')
                flag = obj.str == obj2;
            elseif isa(obj,'string') && isa(obj2,'String')
                flag = obj == obj2.str;
            end
        end
        function str = reverse(obj)
            str = String(obj.str.reverse);
        end
        function char = toCharArray(obj)
            char = obj.str.char;
        end 
        function flag = contains(obj,obj2)
            flag = obj.str.contains(obj2.str);
        end
         function index = indexOf(varargin)
             % 2 overload methods:
             % indexOf(obj,item)
             % indexOf(obj,item,fromIndex)
             obj = varargin{1};
             item = varargin{2};
             chars = obj.str.char;
             if nargin == 3
                 start = varargin{3};
             else
                 start = 1;
             end
            for i = start:obj.length()
                if eq(chars(i),item)
                    index = i;
                    return;
                end
            end
            index = -1; % û�ҵ�
         end
         function strVal = substring(obj,start,endd)%ע������ֵ��1��ʼ
             chars = obj.str.char;
             strVal = String(string(chars(start:endd)));
         end
%  split������˭����˭��ɣ��ҷ��ˡ�
%         function arrayList = split(obj,regex)%regexҲҪ��װ��String
%             ch = 1;
%             patt = String(".$|()[{^?*+\");
% %             if (obj.length ==1 && patt.indexOf(regex.charAt(0)) == -1),ch = regex.charAt(0) || ...
% %                    (regex.length == 2 && ...
% %                     regex.charAt(0) == '\' &&...
% %                     (regex.charAt(1)-'0')|('9'-regex.charAt(1)) < 0 ch =regex.charAt(1) &&...
% %                     ((ch-'a')|('z'-ch)) < 0 &&...
% %               ((ch-'A')|('Z'-ch)) < 0)
%             next = 1;
%             off = 1;
%             list = ArrayList(String);
%             next = obj.indexOf(ch, off);
%             while (next  ~= -1) 
%                 next = indexOf(ch, off);
%                 list.add(obj.substring(off,next));
%                 disp(list);
%                 off = next + 1;
%             end
%             if (off == 0)
%                  list.add(obj.str);
%                  return;
%             end
%             list.add(obj.substring(off,obj.length));
%            end
% %           end
        function print(obj)
            fprintf('%s',obj.str);
        end
        function println(obj)
             disp(obj.str);
        end
%         function disp(obj) %override the original method
%             disp(obj.str);
%         end
% ��ʹ�� [String("") String("")]ʱ����
%��Ҫ�����дdisp��������Ϊ��MATLABԭ�����������ܻ��������⡣
%������дtoString����,��System.out.println�������á�
        function obj = toString(obj)
        end
        function str = toMatlabString(obj)
            str = obj.str;
        end
        function str = getMatlabString(obj)
            str = obj.str;
        end
        function l = length(obj)
            l = strlength(obj.str);
        end
        function flag = isEmpty(obj)
            flag = obj.length==0;
        end
        function char = charAt(obj,index)
            charStr = obj.str.char();
            char = charStr(index);
        end
        function obj = toUpperCase(obj)
            obj.str = upper(obj.str);
        end
        function obj = toLowerCase(obj)
             obj.str = lower(obj.str);
        end
        function obj = plus(obj,obj2)
            if isa(obj,'String') && isa(obj2,'String')
                obj.str = obj.str+obj2.str;
            elseif isa(obj,'String') && isa(obj2,'string')
                obj.str = obj.str + obj2;
            elseif isa(obj,'string') && isa(obj2,'String')
                obj.str = obj + obj2.str;
            end
        end
    end
end