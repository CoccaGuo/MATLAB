function main()
    eps = 1e-4; %准确度要求
    syms x;
    f1 = 4*sqrt(1-x^2); %r=1 %圆
    ellipsoidr = sqrt(1 - x^2);    % a = 1,b = 2,c = 3
    ellipsoidy = ellipsoidr*2;
    ellipsoidz = ellipsoidr*3;
    f2 = 2*pi*ellipsoidy*ellipsoidz; %椭圆
    f3 = 1/x;
    f4 = cos(x);
    funcList =[f1 f2 f3 f4];
    aList = [0 0 1 0];
    bList = [1 1 10 3];
    answerList = [pi 8*pi log(10) sin(3)];
    for j = 1:length(funcList)
    for i=2:10e5
        if abs(trapezoid(funcList(j),aList(j),bList(j),i)-answerList(j)) < eps 
            fprintf("f%d-trapezoid:at least %d times\n",j,i);
            break;
        end
    end
    for i=2:10e5
        if abs(simpson(funcList(j),aList(j),bList(j),i)-answerList(j)) < eps 
            fprintf("f%d-simpson:at least %d times\n",j,i);
            break;
        end
    end
    end
end
