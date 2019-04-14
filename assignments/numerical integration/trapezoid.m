function res = trapezoid(func,a,b,n)
% ���㰴���ι�ʽ�������
% func��FuncObj�����sym������a�����ޣ�b�����ޣ�n��ȡ�����
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