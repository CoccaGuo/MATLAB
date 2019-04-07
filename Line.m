classdef Line < Obj
    % from matlab.awt.Line
    % author :Cocca
    %date : 2019/03/29
    properties
    x1;
    y1;
    x2;
    y2;
    end
    
methods
    function line = Line(varargin) % Constructor
        if nargin == 0
        line.x1 = 0;
        line.x2 = 0;
        line.y1 = 1;
        line.y2 = 1;
        end
        if nargin == 2
            line.x1 = 0;
            line.x2 = varargin{1};
            line.y1 = 0;
            line.y2 = varargin{2}; 
        end
        if nargin == 4
        line.x1 = varargin{1};
        line.x2 = varargin{2};
        line.y1 = varargin{3};
        line.y2 = varargin{4};
        end
    end
    
    function aline = add(line,anotherLine) % override operator + , used for displacement
        aline = Line();
        aline.x1 = line.x1 + anotherLine.x1;
        aline.x2 = line.x2 + anotherLine.x2;
        aline.y1 = line.y1 + anotherLine.y1;
        aline.y2 = line.y2 + anotherLine.y2;
    end
   
     function aline = uminus(line) 
         aline = Line();
        aline.x1 = line.x2 ;
        aline.x2 = line.x1 ;
        aline.y1 = line.y2 ;
        aline.y2 = line.y1 ;
     end
    
    function aline = minus(line,anotherLine)
        aline = Line();
        aline.x1 = line.x1 - anotherLine.x1;
        aline.x2 = line.x2 - anotherLine.x2;
        aline.y1 = line.y1 - anotherLine.y1;
        aline.y2 = line.y2 - anotherLine.y2;
    end
    
    function obj = rotate(line,theta) %use for rotation
        rotMat = [cos(theta),-sin(theta);sin(theta),cos(theta)];
        vec = rotMat*[line.x2-line.x1;line.y2-line.y1];
        x = line.x1 + vec(1);
        y = line.y1 + vec(2);
        obj = Line(line.x1,x,line.y1,y);
    end
    
    function length = length(line) %used to get the length of this line
        length = sqrt((line.x2 - line.x1)^2 + (line.y2 - line.y1)^2);
    end
    
    function direction = direction(line) % used to get the direction
        direction = [(line.x2-line.x1)/line.length (line.y2-line.y1)/line.length]';
    end
    function fig = plot(line)
        fig = plot([line.x1 line.x2],[line.y1 line.y2],'k');
    end
    function print(line)
        fprintf("line:P1(%.2f,%.2f) P2(%.2f,%.2f)\n",line.x1,line.y1,line.x2,line.y2);
    end 
    function flag = eq(line,anotherLine) %Ê©¹¤ÖĞ...
        if (double(line.x1) == double(anotherLine.x1) & double(line.x2) == double(anotherLine.x2)) & (double(line.y1) == double(anotherLine.y1) & double(line.y2) == double(anotherLine.y2))
            flag = 1;
        else
            flag = 0;
        end
    end
end
end    