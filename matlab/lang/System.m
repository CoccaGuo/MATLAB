classdef System
    %ע�⣺System���еĲ������Ժͷ���������Windowsϵͳ
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
        function logout() %ע����¼
            system('logoff');%ע����ر����г���Ҫ����������
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
