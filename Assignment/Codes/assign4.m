clear all; close all; clc;

%%%%%%%%%%%
D = 0;
X = 0:0.01:1;
H1 = zeros(1, length(X));
for i=1:length(X)
ha = 0;
hb = 1;
hd = 0.01;
eps = 10^-10;
flag = 0;
for vv=ha:hd:hb
    if(hydraulic(vv,X(i),D)*hydraulic(vv+hd,X(i),D)<0)
        v = bisection(X(i), vv, vv+hd, eps, D);
        if(flag == 0)
            H1(i) = v;
            flag=1;
            break;
        end
    end
end
    
end
D = 1;
plot(X(1:end-1), H1(1:end-1));
hold on;
X = 1:0.01:2;
H1 = zeros(1, length(X));
for i=1:length(X)
ha = 1;
hb = 2;
hd = 0.01;
eps = 10^-10;
flag = 0;
for vv=ha:hd:hb
    if(hydraulic(vv,X(i),D)*hydraulic(vv+hd,X(i),D)<=0)
        v = bisection(X(i), vv, vv+hd, eps, D);
        if(flag == 0)
            H1(i) = v;
            flag=1;
            break;
        end
    end
end
    
end

plot(X(2:end), H1(2:end));
xlim([0, 2.5]); ylim([0, 2]);
grid; title('A hydraulic Jump');
xlabel('X'); ylabel('H');
