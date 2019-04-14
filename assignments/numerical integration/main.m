
    eps = 1e-4; %准确度要求
    syms x;
    f1 = 4*sqrt(1-x^2); %r=1
    ellipsoidr = sqrt(1 - x^2);    % a = 1,b = 2,c = 3
    ellipsoidy = ellipsoidr*2;
    ellipsoidz = ellipsoidr*3;
    f2 = 2*pi*ellipsoidy*ellipsoidz;
    f3 = 1/x;
    f4 = cos(x);
    funcList =[f1 f2 f3 f4];
    aList = [0 0 1 0];
    bList = [1 1 10 3];
    answerList = [pi 8*pi log(10) sin(3)];

