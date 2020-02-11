clear all; close all; clc;

%%%%%%%%%%%
B = 2;
R = 0.5:0.0001:2;
Rinit = 1;
for i=1:length(R)
ya = 0;
yb = 2.5;
yd = 0.01;
eps = 10^-10;
flag = 0;
for vv=ya:yd:yb
    if(nuclear(vv,R(i),B)*nuclear(vv+yd,R(i),B)<0)
        v = bisection(R(i), vv, vv+yd, eps,B);
        if(flag == 0)
            v1(i) = v;flag=1;
            x(i) = 1/(v1(i)*R(i)^2);
            u1(i) = sqrt(x(i)*(3*x(i)-2));
        else
            v2(i) = v;flag = 2;
            x(i) = 1/(v2(i)*R(i)^2);
            u2(i) = sqrt(x(i)*(3*x(i)-2));
        end
    end
end
    if(flag ~= 2)
        Rinit = i;
    else
    %fprintf('%g \t %g\r', v1(i), v2(i));
    end
   end
R = R(Rinit+1:end);
v1 = v1(Rinit+1:end);
v2 = v2(Rinit+1:end);
u1 = u1(Rinit+1:end);
u2 = u2(Rinit+1:Rinit+1812);
Rjugad = R(1:1812);
plot(R,v1,'r',R,u1,'b');hold on;
plot(R,v2,'r');hold on;
plot(Rjugad,u2,'b');
%plot(R,v1,'r',R,u1,'b',R,v2,'r',R,u2,'b');
legend('y = y(R)','u = u(R)');
title('A Nuclear Outflow y,u vs R');
xlabel('R');ylabel('y,u');
grid on;