classdef FractalLine < Line % extends Line
    properties
        theta = pi/3; %rotating angle
    end
    methods 
        function line = FractalLine(x1,x2,y1,y2)
            line = line@Line(x1,x2,y1,y2);
        end
        
        function obj = rotate(line,theta) %use for rotation
            line = rotate@Line(line,theta);
             obj = FractalLine(line.x1,line.x2,line.y1,line.y2);

        end
        
        function triLineList = trisection(line) % return 3 FractalLine objects 返回三等分的(3个)分形线段对象
            vec = [line.x2-line.x1,line.y2-line.y1];
            line1 = FractalLine(line.x1,line.x1+vec(1)/3,line.y1,line.y1+vec(2)/3);
            line2 = FractalLine(line.x1+vec(1)/3,line.x1+vec(1)*2/3,line.y1+vec(2)/3,line.y1+vec(2)*2/3);
            line3 = FractalLine(line.x1+vec(1)*2/3,line.x2,line.y1+vec(2)*2/3,line.y2);
            triLineList = ArrayList(line1);
            triLineList.add(line1);
            triLineList.add(line2);
            triLineList.add(line3);
        end
       
        function childrenLineList = fractal(line) %fractal，get all children FractalLine node
            triLineList = trisection(line);
            line1 = triLineList.get(1);%返回的第1,2,3根分形子线段是原来线段的3等分线段
            line2 = triLineList.get(2);
            line3 = triLineList.get(3);
            line4 = line2.rotate(line.theta);%第4根是第2根逆时针转theta度
            line5 = line3.rotate(-line.theta);%第5根是第三根顺时针转theta度
            childrenLineList = ArrayList(line1);
            childrenLineList.add(line1);
            childrenLineList.add(line2);
            childrenLineList.add(line3);
            childrenLineList.add(line4);
            childrenLineList.add(line5);
        end
        function aline = add(line,anotherLine) % override operator + , used for displacement
        aline = FractalLine(0,0,0,0);
        aline.x1 = line.x1 + anotherLine.x1;
        aline.x2 = line.x2 + anotherLine.x2;
        aline.y1 = line.y1 + anotherLine.y1;
        aline.y2 = line.y2 + anotherLine.y2;
        end
    function aline = uminus(line) 
         aline = FractalLine(0,0,0,0);
        aline.x1 = line.x2 ;
        aline.x2 = line.x1 ;
        aline.y1 = line.y2 ;
        aline.y2 = line.y1 ;
     end
          function childrenLineList = fractal2(line) %fractal，get all children FractalLine node
            triLineList = trisection(line);
            line1 = triLineList.get(1);%返回的第1,2,3根分形子线段是原来线段的3等分线段
            line2 = triLineList.get(2);
            line3 = triLineList.get(3);
            line4 = line2.rotate(line.theta);%第4根是第2根逆时针转theta度
            line5 = line3.rotate(2*line.theta);%第5根是第三根顺时针转theta度
            line6 = FractalLine(line5.x2,line5.x1,line5.y2,line5.y1);
            childrenLineList = ArrayList(line1);
            childrenLineList.add(line1);
            childrenLineList.add(line3);
            childrenLineList.add(line4);
            childrenLineList.add(line6);
          end
           function quadLines = quadsection(line) % return 4 FractalLine objects 返回等四等分的(4个)分形线段对象
            vec = [line.x2-line.x1,line.y2-line.y1];%可以直接写n等分的线段，但是作业太少懒得写了
            line1 = FractalLine(line.x1,line.x1+vec(1)/4,line.y1,line.y1+vec(2)/4);
            line2 = FractalLine(line.x1+vec(1)/4,line.x1+vec(1)*2/4,line.y1+vec(2)/4,line.y1+vec(2)*2/4);
            line3 = FractalLine(line.x1+vec(1)*2/4,line.x2*3/4,line.y1+vec(2)*2/4,line.y2*3/4);
            line4 = FractalLine(line.x1+vec(1)*3/4,line.x2,line.y1+vec(2)*3/4,line.y2);
            quadLines = ArrayList(line1);
            quadLines.add(line1);
            quadLines.add(line2);
            quadLines.add(line3);
            quadLines.add(line4);
 end
        
 function childrenLine = fractal3(line) %fractal，get all children FractalLine node
            quadLineList = quadsection(line);%vector2D平移是可以写到Line方法里的，但估计之后也用不到，就没写。
            line1 = quadLineList.get(1);%返回的第1,2,3,4根分形子线段是原来线段的4等分线段
            line2 = quadLineList.get(2);
            line4 = quadLineList.get(4);
            cLine = line2.rotate(pi/2);
           % cLine2 = line2.add(FractalLine(0,cLine.x2-cLine.x1,0,cLine.y2-cLine.y1));
           cLine2 = -cLine;
           cLine2 = cLine2.rotate(pi/2);
            cLine3 = -cLine2;
            cLine3 = cLine3.rotate(pi/2);
            cLine4 = -cLine3;
            cLine4 = cLine4.rotate(pi);
            cLine5 = -cLine4;
            cLine5 = cLine5.rotate(-pi/2);
            cLine6 = -cLine5;
            cLine6 = cLine6.rotate(-pi/2); 
            childrenLine = ArrayList(line1);
            childrenLine.add(line1);  
            childrenLine.add(cLine);  
             childrenLine.add(cLine2); 
             childrenLine.add(cLine3); 
             childrenLine.add(cLine4); 
             childrenLine.add(cLine5);
             childrenLine.add(cLine6);
            childrenLine.add(line4);
 end
    end
end