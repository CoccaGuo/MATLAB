function fractalPlot(questionNum,n)
    if nargin == 1
        n = 4;
    end
    parentLine = FractalLine(0,0,0,1);  %初始母线段
    if questionNum==3
        parentLine = FractalLine(0,1,0,0);  %初始母线段
    end
    lineList = ArrayList(parentLine); %声明并实现一个ArrayList，用于存放所有线段
    lineList.add(parentLine);
    childrenList = ArrayList(parentLine);
    for i = 1:n
        childrenList.removeAll();
        for cursor = 1:lineList.getSize() %遍历整个lineList
            if questionNum == 1
                childrenList.addAll(lineList.get(cursor).fractal);
            elseif questionNum ==2
                childrenList.addAll(lineList.get(cursor).fractal2);
            else
                childrenList.addAll(lineList.get(cursor).fractal3);
            end
        end    
                lineList.removeAll();
                lineList.addAll(childrenList);
    end
    for cursor = 1:lineList.getSize()
         lineList.get(cursor).plot(); 
        axis equal
        hold on
    end
end