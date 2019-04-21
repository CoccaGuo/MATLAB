function HyperBall
syms w
f = 4/3*pi*(sqrt(1-w^2)^3);
disp(int(f,w,-1,1));
end
