clear all;
close all;
clc;

%image1name = '13_value_1.jpg';
%image2name = '1_root_1.jpg';
tablename = 'Sec_11_table_2';
xn(1) = 31.5*pi-0.01;
xn(2) = 31.5*pi-0.1;
fxdiff(1) = 0;
xndiff(1) = 0;
fxn(1) = f11(xn(1));


error_limit = 1e-6;
itr_no = 1;
c_error = 1e10;

while(c_error > error_limit)
    itr_no = itr_no + 1;
    
    fxn(itr_no) = f11(xn(itr_no));
    fxdiff(itr_no) = fxn(itr_no)-fxn(itr_no-1);
    xndiff(itr_no) = xn(itr_no)-xn(itr_no-1);
    xn(itr_no+1) = xn(itr_no) - (fxn(itr_no)*(xndiff(itr_no)/fxdiff(itr_no)));
    error(itr_no) = xn(itr_no+1)-xn(itr_no);
    c_error = abs(error(itr_no));
end

fprintf('Root found at %0.6f with value %0.6f in %g iterations!\n', xn(itr_no), f11(xn(itr_no+1)), itr_no);

itr_no = 1:itr_no;
t = xn;
xn = xn(1:length(itr_no));

figure(1);
plot(itr_no, fxn); hold on;
scatter(itr_no, fxn, 'r*'); grid;
xlabel('Iteration Indx'); ylabel('Function Value at x_n');
title('Function Value v/s Iteration Index');
%saveas(gcf, image1name);

figure(2);
plot(itr_no, xn(1:length(itr_no))); hold on;
scatter(itr_no, xn, 'r*'); grid;
xlabel('Iteration Indx'); ylabel('Precision');
title('Approx. Value of Root v/s Iteration Index');
%saveas(gcf, image2name);

itr_no = itr_no';
fxn = round(fxn', 5);
fxdiff = round(fxdiff' ,5);
xndiff = round(xndiff' ,5);
xn = round(xn', 5);
xnp1 = round((t(2:length(t)))', 5);
error = round(error', 5);
table_data = table(itr_no, xn, fxn,xndiff,fxdiff, xnp1, error);
save(tablename, 'table_data');

xn = xn';