classdef System
    %注意：System类中的部分属性和方法依赖于Windows系统
    properties(Constant)
         out = PrintStream("defaultOutput");
         err = PrintStream("errorOutput");
         in = InputStream("defaultInput");
    end
    methods(Static)
        function shutdown(varargin) % use to shutdown
            if nargin == 0 % shutdown immediately
                system('shutdown -s -t 0');
            elseif nargin == 1 %shutdown after time (milliseconds) count
                time = varargin{1};
                comm = ['shutdown -s -t ' num2str(time)];
                if time == -1
                    comm = 'shutdown -s -t 0';
                end
                 system(comm);
            end
        end
        function logout() %注销登录
            system('logoff');%注销会关闭所有程序并要求输入密码
        end
        function cancelShutdown()
            system('shutdown -a');
        end
        function info = execute(string)
            if isa(string,'String')
                info = system(char(string.getMatlabString));
            elseif isa(string,'string')
               info = system(char(string));
            elseif isa(string,'char')
               info = system(string);
            end
            
        end
    end
    
end
