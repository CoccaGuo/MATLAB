function res = simpson(func,a,b,n)
% 计算按辛普森公式计算积分
% func是FuncObj对象或sym函数，a是下限，b是上限，n是取点个数
if isa(func,'FuncObj')
    f = func.handle;
else
    f = matlabFunction(func);
end
    x = linspace(a,b,n);
    h = x(2)-x(1);
    y = f(x);
    z = f(x+h/2);
    y(1)=0;
    s = 0;
    for k=1:(b-a)/h
        s=s+y(k)+y(k+1)+4*z(k);
    end
  res = s*h./6;
end