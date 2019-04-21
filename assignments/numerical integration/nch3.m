function nch3
global x1 x2
n = 10;
e1 = -0.9;
ki = 1;
for k=1:n
    E(k)=fzero(@hhh,e1,optimset('tolx',1e-6),k);
    xio(k,1:2)=[x1,x2];
end
disp(E)
subplot(2,1,1);
X = 1:0.001:2;
Y = 4*(X.^(-12)-X.^(-6));
plot(X,Y);
hold on
for k=1:n
    plot([xio(k,1),xio(k,2)],[E(k),E(k)],'r')
end
subplot(2,1,2)
for k = 1:n
    z = linspace(xio(k,2),xio(k,1),100);
    p = abs(100*sqrt(E(k)-0.5*ki*z.^(2)));
    plot(z,p,z,-p)
    hold on
end
end
function [f2,x1,x2]=hhh(e,kk)
syms x e;
vfun = matlabFunction(e-4*(x.^(-12)-x .^(-6)));
x1 = fzero(vfun,1,optimset('tolx',1e-6),e);
x2 = fzero(vfun,2,optimset('tolx',1e-6),e);
f2 = (kk-0.5)*pi-100*integral(vfun,x1,x2,[],0,e);
end
