function res = simpson(func,a,b,n)
% ���㰴����ɭ��ʽ�������
% func��FuncObj�����sym������a�����ޣ�b�����ޣ�n��ȡ�����
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