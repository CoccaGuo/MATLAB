function res = trapezoid(func,a,b,n)
% 计算按梯形公式计算积分
% func是FuncObj对象或sym函数，a是下限，b是上限，n是取点个数
if isa(func,'FuncObj')
    f = func.handle;
else
    f = matlabFunction(func);
end
h = (b-a)/n;
x = a:h:b;
y = f(x);
y(1)=0;
t=0;
for k=1:(b-a)/h
    t = t+y(k)+y(k+1);
end
res = t*h/2;
end